package banco;

import javax.persistence.EntityManagerFactory;

public class TestaConexao {

	public static void main(String[] args) {
		EntityManagerFactory emf = Conexao.getConnection();
		
		if (emf != null) {
			System.out.println("Conexão realizada com sucesso");
		} else {
			System.out.println("Falha na conexão com o banco");
		}
		
		System.out.println(emf);
	}

}
