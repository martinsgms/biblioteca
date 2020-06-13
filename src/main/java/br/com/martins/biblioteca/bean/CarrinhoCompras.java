package br.com.martins.biblioteca.bean;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Collection;
import java.util.LinkedHashMap;
import java.util.Map;

import org.springframework.context.annotation.Scope;
import org.springframework.context.annotation.ScopedProxyMode;
import org.springframework.stereotype.Component;
import org.springframework.web.context.WebApplicationContext;

@Component
@Scope(value = WebApplicationContext.SCOPE_SESSION, proxyMode=ScopedProxyMode.TARGET_CLASS)
public class CarrinhoCompras implements Serializable {

    private static final long serialVersionUID = -7014985820018936368L;
    
    private Map<CarrinhoItem, Integer> items = new LinkedHashMap<>();
    
    public void add(CarrinhoItem item) {
        items.put(item, getQuantidade(item) + 1);
    }
    
    public void remove(Integer id) {
//        for (CarrinhoItem item : items.keySet()) {
//            if(item.getProduto().getId() == id)
//                items.remove(item);
//        }
        items.remove(items.keySet().stream().filter(i -> i.getProduto().getId().equals(id)).findFirst().get());
    }

    public Integer getQuantidade(CarrinhoItem item) {
        if (!items.containsKey(item)) 
            items.put(item, 0);
        
        return items.get(item);
    }
    
    public Integer getQuantidade() {
        return items.size();
    }
    
    public BigDecimal getTotal(CarrinhoItem item) {
        return item.getTotal(getQuantidade(item));  
    }
    
    public BigDecimal getTotal() {
        BigDecimal total = BigDecimal.ZERO;
        
        for (CarrinhoItem item : items.keySet()) {
            total = total.add(getTotal(item));
        }
        
        return total;
    }
    
    public void esvaziar() {
        this.items = new LinkedHashMap<>();
    }
    
    public Collection<CarrinhoItem> getItems() {
        return items.keySet();
    }
}
