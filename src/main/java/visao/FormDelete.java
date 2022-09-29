package visao;

import dao.DaoAluno;
import modelo.Aluno;

public class FormDelete {

	public static void main(String[] args) {
		Aluno aluno = new Aluno();
		aluno.setId(8);
		aluno.setNome("");
		aluno.seteMail("");
		
		DaoAluno dao = new DaoAluno();
		dao.delete(aluno);
		
		System.out.println("Registro excluido com sucesso.");
	}

}
