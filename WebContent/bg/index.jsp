<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%!
	String[] colors={
		"red", "orange", "yellow", "green", "blue", "navy", "purple"		
	};
%>
<%
	String bg=request.getParameter("bg");//bg는 서비스 메소드의 지역변수이다.
	if(bg==null){
		bg="green";
	}
	//모든 스크립틀릿 영역은 여러군데로 나눠있어도 하나의 서비스메소드안에 속하는 것이다.
	out.print(bg);
	
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script>
	function send(){
		//현재 페이지로 파라미터를 전송한다.
		
		form1.action="index.jsp";
		form1.submit();
		
	}
</script>
</head>
<body Style="background : <%=bg%>">
	<form name="form1">
		<select name="bg">
			<%for(int i=0; i<colors.length; i++){%>
			<option <%if(bg.equals(colors[i])){ %>selected<%}%> value="<%=colors[i]%>"><%=colors[i]%></option>	
			<%}%>
		</select>
		<input type="button" value="전송" onclick="send()" />
	</form>
</body>
</html>