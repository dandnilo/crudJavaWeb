function editarAluno(id){
var uri = 'http://localhost:8080/Hibernate/AlunoServlet'
 $.get(uri + '?id=' + id, function (aluno) {
 $('#idgravar').val(aluno.id)
 $('#nome').val(aluno.nome)
 $('#email').val(aluno.eMail)
 })
}
function incluirAluno(){
$('#idgravar').val(0)
}

function limpar(){
	$('#pesquisa').val('')
	$('#btnPesquisar').click()
}
function excluirAluno(id){
	var uri = 'http://localhost:8080/Hibernate/AlunoServlet'
	$.get(uri + '?id=' + id, function (aluno) {
 $('#idexcluir').val(aluno.id)
 
 })
}
