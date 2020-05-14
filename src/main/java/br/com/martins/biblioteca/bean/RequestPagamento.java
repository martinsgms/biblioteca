package br.com.martins.biblioteca.bean;

import java.math.BigDecimal;

public class RequestPagamento {

    private BigDecimal value;
    
    public RequestPagamento() {}
    
    public RequestPagamento(BigDecimal value) {
        this.value = value;
    }

    public BigDecimal getValue() {
        return value;
    }

    public void setValue(BigDecimal value) {
        this.value = value;
    }
}
