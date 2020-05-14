package br.com.martins.biblioteca.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.com.martins.biblioteca.bean.CarrinhoCompras;
import br.com.martins.biblioteca.bean.CarrinhoItem;
import br.com.martins.biblioteca.bean.Produto;
import br.com.martins.biblioteca.bean.TipoPreco;
import br.com.martins.biblioteca.repository.ProdutoRepository;

@Controller
@RequestMapping("/carrinho")
@Scope(value = WebApplicationContext.SCOPE_REQUEST)
public class CarrinhoComprasController {

    @Autowired
    private ProdutoRepository repository;

    @Autowired
    private CarrinhoCompras carrinho;

    @RequestMapping("/add")
    public ModelAndView add(Integer produtoId, TipoPreco tipoPreco) {
        ModelAndView modelAndView = new ModelAndView("redirect:/carrinho");

        CarrinhoItem item = criaItem(produtoId, tipoPreco);
        carrinho.add(item);

        return modelAndView;
    }

    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView itens() {
        ModelAndView modelAndView = new ModelAndView("carrinho/itens");

        return modelAndView;
    }
    
    @RequestMapping(value="/remover", method = RequestMethod.POST)
    public ModelAndView remover(Integer id, TipoPreco tipoPreco, RedirectAttributes requestAttr) {
        carrinho.remove(id);
        requestAttr.addFlashAttribute("message", "Produto removido com sucesso!");
        
        return new ModelAndView("redirect:/carrinho");
    }

    private CarrinhoItem criaItem(Integer produtoId, TipoPreco tipoPreco) {
        Produto produto = repository.find(produtoId);

        CarrinhoItem carrinhoItem = new CarrinhoItem(produto, tipoPreco);

        return carrinhoItem;
    }
}
