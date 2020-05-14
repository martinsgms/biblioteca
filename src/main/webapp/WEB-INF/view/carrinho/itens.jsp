<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>

<!DOCTYPE html>
<html>
<head>

<meta charset="utf-8" />

    <title>Carrinho</title>

<style>
    *{font-family: verdana}
    table{width:100%}
    table, tr, td, th{border: 0.3px solid; padding: 5px;}
    thead{font-weight: bold}
</style>
</head>
<body>
    
    <header>
        <a href="${s:mvcUrl('PC#listAll').build()}">Produtos</a> |
        <a href="${s:mvcUrl('CCC#itens').build()}">Carrinho (${carrinhoCompras.quantidade})</a>
    </header>
    
	<section class="container middle">
		<h2 id="cart-title">Seu carrinho de compras</h2>
        
        <p>${message}</p>
        
		<table id="cart-table">
			<thead>
				<tr>
					<th width="65%">Item</th>
					<th width="10%">Preço</th>
					<th width="10%">Quantidade</th>
					<th width="10%">Total</th>
					<th width="5%">Ações</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${carrinhoCompras.items }" var="item">
					<tr>
						<td>${item.produto.titulo }</td>
						<td>${item.preco }</td>
						<td>
						  <input type="number" min="0" id="quantidade" name="quantidade" value="${carrinhoCompras.getQuantidade(item) }" style="width: 97%"/>
						</td>
						<td >${carrinhoCompras.getTotal(item) }</td>
						<td>
							<form action="${s:mvcUrl('CCC#remover').arg(0, item.produto.id).build()}" method="POST">
                                <button type="submit">Remover</button>
                            </form>	
						</td>
					</tr>
				</c:forEach>
			</tbody>
			<tfoot>
				<tr>
                <td colspan="3">
                <form action="${s:mvcUrl('PC#finalizar').build()}" method="POST"> 
					<input type="submit" class="checkout" name="checkout" value="Finalizar compra" />
                </form>
                </td>
					<td class="numeric-cell">${carrinhoCompras.total }</td>
					<td></td>
				</tr>
			</tfoot>
		</table>
	</section>
    
</body>
</html>