<%@page import="java.io.InputStream"%>
<%@page import="org.apache.commons.io.FilenameUtils"%>
<%@page import="java.io.File"%>
<%@page import="java.io.FileOutputStream"%>
<%@page import="org.apache.commons.fileupload.FileItem"%>
<%@page import="java.util.List"%>
<%@page import="org.apache.commons.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.commons.fileupload.disk.DiskFileItemFactory"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/*파일업로드 컴포넌트 중 가장 많이 사용되는 아파치에서 배포되는
	Commons 프로젝트의 하위 프로젝트로 지원되는 FileUpload컴포넌트를 이용해 보자	
	*/
	request.setCharacterEncoding("utf-8");	

	ServletFileUpload upload=new ServletFileUpload(new DiskFileItemFactory());

	//요청객체를 넣어주면 클라이언트가 전송한 파라미터들을 분석해준다.
	List<FileItem> list=upload.parseRequest(request);
	
	//우리의 경우 msg와 myFile이라는 파라미터가 전송되므로 총 2개의 FileItem이 들어갈것이다.
	out.print("클라이언트가 보낸 파라미터의 수는 :"+list.size());
	
	for(int i=0; i<list.size(); i++){
		FileItem item=list.get(i);
		
		if(item.isFormField()){//파일이 아닌 일반 파라메터를 의미한다.
			//일반 텍스트 파라미터 
			String fileName=item.getFieldName();//html의 name
			String value=item.getString();
			//out.print(fileName+"의 값은 "+value+"이다<br>");
			
			if(fileName.equals("msg")){//msg라면
				out.print("메세지는"+value);
				
			}else if(fileName.equals("id")){//id라면
				out.print("ID는"+value);
				
			}
			
			
		}else{//업로드 파라미터
			//파일이 저장될 경로 구하기
			String realpath=application.getRealPath("/data");
			out.print(realpath);
		
			//파일명 알아맞추기
			String name=FilenameUtils.getName(item.getName());
			
			//저장될 최종경로
			String path=realpath+File.separator+name;
			//File.seaparator쓰면 os에 맞춰서 /과 \를 자동으로 넣어준다.
			out.print(path);
			
			InputStream is=item.getInputStream();
			FileOutputStream fos=new FileOutputStream(new File(path));//서비스 메소드에 예외처리가 이미 되어있다.
			
			byte[] b=new byte[1024];
			
			int flag;
			while(true){
				flag=is.read(b);
				if(flag==-1) break;
				fos.write(b);				
			}
			
			out.print("업로드 완료");
			if(fos!=null){
				fos.close();
			}
			if(is!=null){
				is.close();
			}
			
		}
		
	}
%>
<%-- <img src="data/<%= %> "/> --%>