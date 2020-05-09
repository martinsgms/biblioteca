package br.com.martins.biblioteca.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import br.com.martins.biblioteca.bean.Produto;
import br.com.martins.biblioteca.bean.TipoPreco;
import br.com.martins.biblioteca.repository.ProdutoRepository;

@Controller
public class ProdutoController {
    
    @Autowired
    private ProdutoRepository repository;
    
    @RequestMapping("/produto/form")
    public ModelAndView form() {
        ModelAndView modelAndView = new ModelAndView("produto/form");
        modelAndView.addObject("tipos", TipoPreco.values());
        
        return modelAndView;
    }
    
    @RequestMapping("/produto/gravar")
    public String gravar(Produto produto) {
        repository.gravar(produto);
        
        return "produto/ok";
    }
}
