package br.com.martins.biblioteca.bean;

import java.util.LinkedHashMap;
import java.util.Map;

import org.springframework.stereotype.Component;

@Component
public class CarrinhoCompras {

    private Map<CarrinhoItem, Integer> items = new LinkedHashMap<>();
    
    public void add(CarrinhoItem item) {
        items.put(item, getQtde(item) + 1);
    }

    private Integer getQtde(CarrinhoItem item) {
        if (!items.containsKey(item)) 
            items.put(item, 0);
        
        return items.get(item);
    }
    
    public Integer getQuantidade() {
        return items.size();
    }
}
