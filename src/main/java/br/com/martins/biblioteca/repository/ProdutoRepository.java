package br.com.martins.biblioteca.repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

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
    
}
