package dao;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.TypedQuery;

import com.mysql.cj.Query;
import com.mysql.cj.x.protobuf.MysqlxCrud.Delete;

import banco.Conexao;
import modelo.Aluno;

public class DaoAluno {
	private static EntityManagerFactory emf;
	
	public DaoAluno() {
		emf = Conexao.getConnection();
	}
	
	public void insert(Aluno aluno) {
		EntityManager em = emf.createEntityManager();
		em.getTransaction().begin();
		em.persist(aluno);
		em.getTransaction().commit();
		em.close();
	}
	
	public void delete(Aluno aluno) {
		EntityManager em = emf.createEntityManager();
		em.getTransaction().begin();
		aluno = em.find(Aluno.class, aluno.getId());
		em.remove(aluno);
		em.getTransaction().commit();
		em.close();
	}
	
	public void update(Aluno aluno) {
		EntityManager em = emf.createEntityManager();
		Aluno alunoBanco = new Aluno();

		em.getTransaction().begin();
		
		alunoBanco = em.find(Aluno.class, aluno.getId());
		alunoBanco.setNome(aluno.getNome());
		alunoBanco.seteMail(aluno.geteMail());
		
		em.getTransaction().commit();
		em.close();
	}
	
	public List<Aluno> selectAll() {
		EntityManager em = emf.createEntityManager();
		String sql = "FROM Aluno";
		javax.persistence.Query query = em.createQuery(sql);
		ArrayList<Aluno> listaAlunos = (ArrayList<Aluno>) query.getResultList();
		em.close();
		return listaAlunos;
	}
	
	public Aluno selectById(int id) {
		EntityManager em = emf.createEntityManager();
		Aluno aluno = em.find(Aluno.class, id);
		em.close();
		return aluno;
	}
	
	// Método para exemplificar o cache do JPA
	public void pesquisa() {
		EntityManager em = emf.createEntityManager();
		Aluno a1 = em.find(Aluno.class, 1);
		Aluno a2 = em.find(Aluno.class, 1);
		em.close();
	}
	public List<Aluno> selectByNome(String nome){
		EntityManager em = emf.createEntityManager();
		String sql = "SELECT a FROM Aluno a where a.nome like :nomePesquisa";
		TypedQuery<Aluno> typedQuery = em.createQuery(sql, Aluno.class);
		typedQuery.setParameter("nomePesquisa", "%" + nome + "%");
		List<Aluno> listaAlunos = typedQuery.getResultList();
		em.close();
		return listaAlunos;
		}	
		
		
	
}





