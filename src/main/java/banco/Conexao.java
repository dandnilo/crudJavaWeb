package banco;

import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

public class Conexao {
	private static EntityManagerFactory emf;
	
	public static EntityManagerFactory getConnection() {
		if (emf == null) {
			emf = Persistence.createEntityManagerFactory("banco-hibernate");
		}
		return emf;
	}

}
