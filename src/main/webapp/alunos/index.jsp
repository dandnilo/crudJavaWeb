<%@page import="javax.servlet.jsp.tagext.TryCatchFinally"%>
<%@page import="modelo.Aluno"%>
<%@page import="java.util.List"%>
<%@page import="dao.DaoAluno"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script src="aluno.js"></script>

<meta charset="UTF-8">
<title>Sistema de Gerenciamento de Alunos</title>
</head>
<body class="bg-light mt-2">
	<div class="container">
		<h2 class="text-center">Sistema de Gerenciamento de Alunos</h2>
		<div class="card">
			<div class="card-header">
				<h5>Cadastro de Alunos</h5>
			</div>
			<div class="container">
				<!-- Início do Card -->
				<div class="card">

					<div class="card-body">
						<form action="index.jsp" method="post">

							<div class="row">
								<label for="pesquisa"
									class="text-end mt-2 col-md-4 col-sm-6 col-form-label">Nome:</label>
								<div class="col-md-4 col-sm-6 mt-2">
									<input type="text" class="form-control" id="pesquisa"
										placeholder="Nome do Aluno" name="pesquisa">
								</div>

								<div class="col-md-2 col-sm-6 d-grid mt-2">
									<button submit="carregaraAlunos();"
										class="btn btn-info btn-block">Procurar</button>
								</div>

								<div class="col-md-2 col-sm-6 d-grid mt-2">
									<button onclick="limpar();" class="btn btn-secondary btn-block">Limpar</button>
								</div>
							</div>
						</form>


						<div class="card-body">
							<table class="table table-striped">
								<thead>
									<tr>
										<th>Código</th>
										<th>Nome</th>
										<th>E-mail</th>
										<th colspan="2" class="text-center">Operações</th>
									</tr>
								</thead>
								<tbody>
									<%
									DaoAluno dao = new DaoAluno();
									List<Aluno> listaAluno = dao.selectAll();
									String pesquisa = "";
									try {
										pesquisa = request.getParameter("pesquisa");
									} catch (Exception e) {

									}
									if ((pesquisa == null) || (pesquisa == "")) {
										listaAluno = dao.selectAll();
									} else {
										listaAluno = dao.selectByNome(pesquisa);
									}

									for (Aluno aluno : listaAluno) {
									%>
									<tr>
										<td><%=aluno.getId()%></td>
										<td><%=aluno.getNome()%></td>
										<td><%=aluno.geteMail()%></td>
										<td class="text-center"><button
												class="btn btn-warning btn-sm" data-bs-toggle="modal"
												data-bs-target="#modalCadastroAlunos"
												onclick="editarAluno(<%=aluno.getId()%>)">Editar</button></td>

										<td class="text-center"><button
												class="btn btn-danger btn-sm" data-bs-toggle="modal"
												data-bs-target="#modalExclusao"
												onclick="excluirAluno(<%=aluno.getId()%>)">Excluir</button></td>
									</tr>

									<%
									}
									%>

								</tbody>
							</table>
						</div>

						<div class="card-footer">
							<button type="button" class="btn btn-primary"
								data-bs-toggle="modal" data-bs-target="#modalCadastroAlunos" onclick="incluirAluno()">Novo
								Registro</button>
						</div>
					</div>



					<!-- Modal de Inclusão ou alteração de um registro -->
					<div class="modal" id="modalCadastroAlunos"
						data-bs-backdrop="static" data-bs-keyboard="false">
						<form action="gravar.jsp" method="post">
							<div class="modal-dialog">
								<div class="modal-content">

									<!-- Modal Header -->
									<div class="modal-header">
										<h4 class="modal-title">Controle de Alunos</h4>
									</div>

									<!-- Modal body -->
									<div class="modal-body">
										<label class="form-label" for="id">id</label> <input
											class="form-control" type="text" name="idgravar"
											id="idgravar"> <label class="form-label" for="nome">Nome</label>
										<input class="form-control" type="text" name="nomegravar"
											id="nome"> <label class="form-label" for="email">E-mail</label>
										<input class="form-control" type="text" name="emailgravar"
											id="email">

									</div>

									<!-- Modal footer -->
									<div class="modal-footer">
										<button type="submit" class="btn btn-success"
											data-bs-dismiss="modal">Gravar</button>
										<button type="button" class="btn btn-secondary"
											data-bs-dismiss="modal">Cancelar</button>
									</div>
								</div>
							</div>
						</form>
					</div>


					<!-- Modal de Confirmações -->
					<div class="modal" id="modal-confirmacao" data-bs-backdrop="static"
						data-bs-keyboard="false">
						<div class="modal-dialog">
							<div class="modal-content">

								<!-- Modal Header -->
								<div class="modal-header">
									<h4 class="modal-title" id="titulo-modal-confirmacao"></h4>
								</div>

								<!-- Modal body -->
								<div class="modal-body">
									<div class="modal-body">
										<h4 id="body-modal-confirmacao"></h4>
									</div>
								</div>
								<div class="modal-confirmacao">
									<div class="modal">
										<h4 id="modal-confirmacao"></h4>
									</div>
								</div>

								<!-- Modal footer -->
								<div class="modal-footer">

									<button type="button" class="btn btn-secondary"
										data-bs-dismiss="modal">Cancelar</button>

								</div>
							</div>
						</div>
					</div>

					<!-- Modal de exclusão de um registro -->
					<div class="modal" id="modalExclusao" data-bs-backdrop="static"
						data-bs-keyboard="false">
						<form action="excluir.jsp" method="post">
							<div class="modal-dialog">
								<div class="modal-content">

									<!-- Modal Header -->
									<div class="modal-header">
										<h4 class="modal-title">Confirmar exclusão</h4>
									</div>

									<!-- Modal body -->
									<div class="modal-body">
										<label class="form-label" for="nome">id</label> <input
											class="form-control" type="text" name="idexcluir"
											id="idexcluir">
										<p>Confirma a exclusão do registro?</p>
									</div>

									<!-- Modal footer -->
									<div class="modal-footer">
										<button type="submit" class="btn btn-danger"
											data-bs-dismiss="modal">Excluir</button>
										<button type="button" class="btn btn-secondary"
											data-bs-dismiss="modal">Cancelar</button>
									</div>
								</div>
							</div>
						</form>
					</div>
</body>
</html>