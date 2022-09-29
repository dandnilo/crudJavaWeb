 package visao;

import java.util.List;

import dao.DaoAluno;
import modelo.Aluno;

public class FormSelect {

	public static void main(String[] args) {
		DaoAluno dao = new DaoAluno();
		
		List<Aluno> listaAluno = dao.selectAll();
		
		for (Aluno aluno : listaAluno) {
			System.out.println(aluno.toString());
		}

	}

}
