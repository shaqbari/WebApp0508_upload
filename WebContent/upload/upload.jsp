<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("utf-8");

	//클라이언트가 전송한 메세지와 파일을 받아서 
	//서버의 지정된 디렉토리에 저장시키자=업로드
	
	//클라이언트가 전송한 데이터가 단순 텍스트가 아닌 바이너리 파일이 포함되어 있을 경우
	//스트림 처리를 하지 않으면 업로드를 완료 할 수 없다.
	//reqeust객체 자체는 스트링의 파라미터만 받는 메소드만을 지원하기 때문에 바이너리 파일을 직접 받기 위해서는
	//컴포넌트 라이브러리를 사용하는 것이 대부분이다.
	//유명한 것 2개 - oreily의 cos.jar
	//아파치 Fileupload
	
	//파일은 binary이기 때문에 위와같은 방법으로 전달 받을 수 없다.
	//stream을 이용해야 하지만 오래걸리므로, 웹에서는 업로드 라이브러리를 따로 받아서 써야 한다.
	
	
	
	//Apache가 공식이지만  Oreily꺼(servlets.com)를 쓰기도 한다. eclipse가 아니라면 lib jar파일을 classpath에 등록해야 한다.
	//클래스명에 multipart가 들어가면 binary파일을 다룰수 있는 클래스이다.
	//이미지명은 개발자가 주도해야 한다. primary key를 쓰면 좋다.
	
	//절대경로를 이용하면 이컴퓨터에서만 사용할수 있다.자바 슬로건에 맞지 않는다.
	String saveDir="C:/javaee_workspace/WebApp0508/WebContent/data";
	int maxSize = 2*1024*1024; //2mb제한
	
	//ServletContext javaEE의 객체는 jsp에서는 application 내장객체로 지원해준다.
	//웹사이트의 환경설정 정보 즉 전역적 정보를 가진 객체이다.
	String realPath=application.getRealPath("/data");
	out.print("실제 저장 경로는 :"+realPath);
	
	//오레일리사에서 제작한 컴포넌트는 생성자에서 업로드가 처리된다. 나중에 짜증나게 된다.
	MultipartRequest multi=new MultipartRequest(request, realPath, maxSize, "utf-8"); //클래스명 뒤에서 컨트롤 스페이스 누르면 자동import된다.
	out.print("성공"); 
	
	/* String msg=request.getParameter("msg"); //메시지 받기
	out.println(msg); */
	//html 클라이언트 측에서 form 태그의 속성에 multipart/form-data가 지정되면
	//request 객체의 getParameter()로는 파라미터값을 받을 수 없게 된다.
	//따라서 업로드 컴포넌트를 써야 한다.
	
	String msg=multi.getParameter("msg");
	out.print(msg);
		
	
%>

<img src="/data/<%=multi.getOriginalFileName("myFile")%>">