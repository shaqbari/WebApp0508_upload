<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% //service(HttpServletRequest, HttpServletResponse){}에해당
	//서블릿을 사용할 경우엔 다소 불편함은 있지만, 서버측 프로그램의 원리와 제어를 개발자가 주도하기 때문에
	//서버의 상황에 이해가 가능하다. 하지만, jsp만을 이용할 경우 서블릿의 특징이 숨겨져 버리기 때문에
	//서버측의 실행 원리에 대한 지식이 부족하게 된다.
	
	//서블릿에서는 service메소드에 전달되는 요청, 응답객체의 인수명을 개발자가 마음대로 정할 수 있었다
	//왜? 클래스를 상속받아 오버라이드(재정의)할 수 있었으니깐.
	//but jsp에서는 service메소드의 존재를 모르더라도 쉽게 사용하기 위해 스크립트로 제공되므로, 개발자가 변수명을 정할 수 없다.
	//그럼 누가 정하나? sun사가 변수이름 정했다
	//결론) jsp에서는 서블릿 시절에 사용하던 객체의 변수명이 이미 정해져 있다.
	//이러한 정해진 객체변수명을 jsp내장 객체라고 한다.
	
	//서블릿 시절의 객체자료형 및 내장객체명 총 9~10개
	//HttpServletRequest --> request
	//HttpServletResponse --> response
	//init(ServletConfig) --> context	
	
	//받기 전에 한글깨지지 않게 처리
	request.setCharacterEncoding("utf-8");
	
	//web상에서 전속목적으로는 id가 아닌 반드시 name(parameter name)을 써야 한다.	
	String id=request.getParameter("id");
	String pw=request.getParameter("pw");
	
	//Writer 객체를 이미 out이라고 정해놓음
	//out의 정식 명칭: out 내장객체
	out.print("넘겨받은 id: "+id);
	out.print("<br>");
	out.print("넘겨받은 pw: "+pw);
	
%>