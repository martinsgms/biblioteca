package br.com.martins.biblioteca.controller;

import java.util.concurrent.Callable;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.com.martins.biblioteca.bean.CarrinhoCompras;
import br.com.martins.biblioteca.bean.RequestPagamento;

@Controller
@RequestMapping("/pagamento")
public class PagamentoController {

    @Autowired
    private CarrinhoCompras carrinho;
    
    @Autowired
    private RestTemplate rest;

    @RequestMapping(value = "/finalizar", method = RequestMethod.POST)
    public Callable<ModelAndView> finalizar(RedirectAttributes redirectAttr) {
        
        return () -> {
            try {
                RequestPagamento requestData = new RequestPagamento(carrinho.getTotal());
                String response = rest.postForObject("http://book-payment.herokuapp.com/payment", requestData, String.class);
                
                redirectAttr.addFlashAttribute("message", response);
                
            } catch (RestClientException e) {
                redirectAttr.addFlashAttribute("message", "Erro ao realizar o pagamento");
                System.err.println("Causa: A transação excede o máximo permitido (>500)");
                
                e.printStackTrace();
            }
            
            return new ModelAndView("redirect:/produto");
        };
    }
}
