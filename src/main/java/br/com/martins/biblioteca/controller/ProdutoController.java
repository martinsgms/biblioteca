package br.com.martins.biblioteca.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import br.com.martins.biblioteca.bean.Produto;
import br.com.martins.biblioteca.repository.ProdutoRepository;

@Controller
public class ProdutoController {
    
    @Autowired
    ProdutoRepository repository;
    
    @RequestMapping("/produto/form")
    public String form() {
        return "produto/form";
    }
    
    @RequestMapping("/produto/gravar")
    public String gravar(Produto produto) {
        repository.gravar(produto);
        
        return "produto/ok";
    }
}
