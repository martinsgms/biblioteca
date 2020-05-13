package br.com.martins.biblioteca.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import br.com.martins.biblioteca.bean.CarrinhoCompras;
import br.com.martins.biblioteca.bean.CarrinhoItem;
import br.com.martins.biblioteca.bean.Produto;
import br.com.martins.biblioteca.bean.TipoPreco;
import br.com.martins.biblioteca.repository.ProdutoRepository;

@Controller
@RequestMapping("/carrinho")
public class CarrinhoComprasController {
    
    @Autowired
    private ProdutoRepository repository;

    @Autowired
    private CarrinhoCompras carrinho;
    
    @RequestMapping("/add")
    public ModelAndView add(Integer produtoId, TipoPreco tipoPreco) {
        ModelAndView modelAndView = new ModelAndView("redirect:/produto");
        
        CarrinhoItem item = criaItem(produtoId, tipoPreco);
        carrinho.add(item);
        
        return modelAndView; 
    }

    private CarrinhoItem criaItem(Integer produtoId, TipoPreco tipoPreco) {
        Produto produto = repository.find(produtoId);
        
        CarrinhoItem carrinhoItem = new CarrinhoItem(produto, tipoPreco);
        
        return carrinhoItem;
    }
}
