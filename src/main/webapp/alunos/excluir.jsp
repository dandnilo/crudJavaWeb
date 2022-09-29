<%@page import="dao.DaoAluno"%>
<%@page import="modelo.Aluno"%>
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
	int id = Integer.parseInt(request.getParameter("idexcluir"));
	Aluno aluno = new Aluno();
	aluno.setId(id);

	DaoAluno dao = new DaoAluno();
	dao.delete(aluno);
	%>
	<script>
		alert("Registro excluido com sucesso.")
		window.location.replace("index.jsp");
	</script>
</body>
</html>