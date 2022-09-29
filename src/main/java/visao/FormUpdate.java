package visao;

import dao.DaoAluno;
import modelo.Aluno;

public class FormUpdate {

	public static void main(String[] args) {
		DaoAluno dao = new DaoAluno();
		Aluno aluno = new Aluno("Rafael", "rafael@email.com");
		aluno.setId(6);
		
		dao.update(aluno);
		
		System.out.println("Registro Alterado com sucesso.");

	}

}
