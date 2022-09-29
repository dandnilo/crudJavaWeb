<%@page import="java.awt.print.PrinterGraphics"%>
<%@page import="modelo.Aluno"%>
<%@page import="dao.DaoAluno"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	DaoAluno dao = new DaoAluno();	
	Aluno aluno = new Aluno();
	String nome = request.getParameter("nomegravar");
	String email = request.getParameter("emailgravar");
	int id = Integer.parseInt(request.getParameter("idgravar"));
	aluno.seteMail(email);
	aluno.setNome(nome);
    
	if(id == 0){
		dao.insert(aluno);
	}else{
	 aluno.setId(id);
	 dao.update(aluno);
	}
	
	
	
	%>
	<script>		
		window.location.replace("index.jsp");
	</script>
	

</body>
</html>