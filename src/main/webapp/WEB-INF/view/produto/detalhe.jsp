<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8" />
    <title>${produto.titulo}</title>
</head>
<body>
	<article id="${produto.id}">
		<header id="product-highlight" class="clearfix">
			<div id="product-overview" class="container">
				<h1 class="product-title">${produto.titulo} - ${produto.autor}</h1>
				<p class="book-description">${produto.descricao}</p>
			</div>
		</header>
        
        <hr>
        
		<section class="buy-options clearfix">
			<form action="<c:url value='/carrinho/add'/>" method="post" class="container">
				<input type="hidden" value="${produto.id}" name="produtoId" >

                <p>Formatos disponíveis</p>
				<ul id="variants" class="clearfix">
                <c:forEach items="${produto.precos}" var="preco">
						<li class="buy-option">
							<input type="radio" name="tipoPreco" class="variant-radio" id="tipoPreco" value="${preco.tipo}" checked="checked" /> 
							<label class="variant-label">${preco.tipo}</label> 
							<small style="text-decoration:line-through">R$ ${preco.valor + 10}</small>
							<p class="variant-price">R$ ${preco.valor}</p>
						</li>
				</c:forEach>
				</ul>
				<button type="submit">Compre Agora ${produto.titulo}</button>
                <p>Seu carrinho (${carrinhoCompras.quantidade})</p>
			</form>
		</section>

		<div class="container">
			<section class="summary">
				<ul>
					<li>
						Veja o sumário
					</li>
				</ul>
			</section>

			<section class="data product-detail">
				<h2 class="section-title">Dados do livro:</h2>
				<p>
					Número de páginas: <span>${produto.paginas}</span>
				</p>
				<p></p>
				<p>Data de publicação: <fmt:formatDate pattern="dd/MM/yyyy" value="${produto.dataLancamento.time}"/></p>
			</section>
		</div>
	</article>
</body>
</html>