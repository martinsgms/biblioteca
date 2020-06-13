package br.com.martins.biblioteca.controller;

import java.math.BigDecimal;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import br.com.martins.biblioteca.bean.CarrinhoCompras;

@Controller
@RequestMapping("/pagamento")
public class PagamentoController {

    @Autowired
    private CarrinhoCompras carrinho;

    @RequestMapping(value = "/finalizar", method = RequestMethod.POST)
    public ModelAndView finalizar(RedirectAttributes redirectAttr) {

        String response = pagamentoServiceFake(carrinho.getTotal());

        redirectAttr.addFlashAttribute("message", response);
        
        carrinho.esvaziar();

        return new ModelAndView("redirect:/produto");
    }

    private String pagamentoServiceFake(BigDecimal total) {
        return total.compareTo(new BigDecimal(500.00)) < 0 ?
                "Compra realizada com sucesso" : "Erro ao finalizar compra";
    }
}
