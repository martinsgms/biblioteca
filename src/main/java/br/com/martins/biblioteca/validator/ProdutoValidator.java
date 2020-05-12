package br.com.martins.biblioteca.validator;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import br.com.martins.biblioteca.bean.Produto;

public class ProdutoValidator implements Validator {

    @Override
    public boolean supports(Class<?> clazz) {
        return Produto.class.isAssignableFrom(clazz);
    }

    @Override
    public void validate(Object target, Errors errors) {
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "titulo", "field.invalid");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "autor", "field.invalid");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "paginas", "field.invalid");
        
        Produto p = (Produto) target;
        if(p.getPaginas() != null && p.getPaginas() <= 0)
            errors.rejectValue("paginas", "field.invalid");
    }

}
