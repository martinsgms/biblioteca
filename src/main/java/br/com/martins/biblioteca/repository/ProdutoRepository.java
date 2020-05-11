package br.com.martins.biblioteca.repository;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.TypedQuery;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import br.com.martins.biblioteca.bean.Produto;

@Repository
@Transactional
public class ProdutoRepository {
    
    @PersistenceContext
    private EntityManager em;
    
    public void gravar(Produto produto) {
        em.persist(produto);
    }
    
    public List<Produto> findAll() {
        TypedQuery<Produto> q = em.createQuery("select p from Produto p", Produto.class);
        return q.getResultList();
    }
    
}
