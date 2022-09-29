package visao;

import dao.DaoAluno;
import modelo.Aluno;

public class FormInsert {

	public static void main(String[] args) {
		Aluno a = new Aluno("Ana", "ana@email.com");		
		DaoAluno dao = new DaoAluno();
		dao.insert(a);
		
		
		System.out.println("Registro inserido com sucesso.");
	}

}
