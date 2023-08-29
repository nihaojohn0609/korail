<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	String sid = (String)session.getAttribute("sid");
	if(sid != null){
		session.invalidate();
	}
	
	out.write("<script>");
	out.write("location.href='http://localhost:9000/logout';");
	out.write("</script>");
%>
