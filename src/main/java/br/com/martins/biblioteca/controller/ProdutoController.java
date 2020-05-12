package br.com.martins.biblioteca.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.com.martins.biblioteca.bean.Produto;
import br.com.martins.biblioteca.bean.TipoPreco;
import br.com.martins.biblioteca.repository.ProdutoRepository;
import br.com.martins.biblioteca.validator.ProdutoValidator;

@Controller
@RequestMapping("/produto")
public class ProdutoController {

    @Autowired
    private ProdutoRepository repository;

    @InitBinder
    public void init(WebDataBinder binder) {
        binder.addValidators(new ProdutoValidator());
    }

    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView listAll() {
        ModelAndView modelAndView = new ModelAndView("produto/produtos");
        modelAndView.addObject("produtos", repository.findAll());

        return modelAndView;
    }

    @RequestMapping(method = RequestMethod.POST)
    public ModelAndView gravar(@Valid Produto produto, BindingResult bindingResult,
            RedirectAttributes redirectAttributes) {
        
        if (bindingResult.hasErrors()) 
            return form();
            
        repository.gravar(produto);
        redirectAttributes.addFlashAttribute("message", "Produto cadastrado com sucesso!");

        return new ModelAndView("redirect:produto");
    }

    @RequestMapping(value = "/form")
    public ModelAndView form() {
        ModelAndView modelAndView = new ModelAndView("produto/form");
        modelAndView.addObject("tipos", TipoPreco.values());

        return modelAndView;
    }
}
