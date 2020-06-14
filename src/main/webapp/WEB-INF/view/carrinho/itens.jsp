<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="t"%>

<t:template>
	<h1 id="cart-title">Seu carrinho de compras</h1>
    
    <c:if test="${message != null}">
        <div class="alert alert-primary alert-dismissible fade show" role="alert">
            ${message}
            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                <span aria-hidden="true">&times;</span>
            </button>
        </div>
    </c:if>
    
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
					<td>R$ ${item.preco }</td>
					<td>
					  <input type="number" min="0" id="quantidade" name="quantidade" onchange="modifyQtdValue()" value="${carrinhoCompras.getQuantidade(item) }" style="width: 97%"/>
					</td>
					<td >${carrinhoCompras.getTotal(item) }</td>
					<td>
						<form action="${s:mvcUrl('CCC#remover').arg(0, item.produto.id).build()}" method="POST">
                            <button type="submit" class="btn btn-danger">Remover</button>
                        </form>	
					</td>
				</tr>
			</c:forEach>
		</tbody>
		<tfoot>
			<tr>
            <td colspan="3">
            <form action="${s:mvcUrl('PC#finalizar').build()}" method="POST"> 
				<button type="submit" class="btn btn-primary" name="checkout">Finalizar compra</button>
            </form>
            </td>
				<td class="numeric-cell">R$ ${carrinhoCompras.total }</td>
				<td></td>
			</tr>
		</tfoot>
	</table>
</t:template>