<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib tagdir="/WEB-INF/tags" prefix="t"%>

<t:template>
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
				
                <div class="container">
                    <div class="row row-cols-3">
                        <c:forEach items="${produto.precos}" var="preco">
                
                        <div class="col">
                            <div class="card" style="width: 18rem;">
                              <div class="card-body">
                                <h5 class="card-title">${preco.tipo}</h5>
                                <p class="card-text">
                                De 
                                    <small style="text-decoration:line-through">
                                        R$ <fmt:formatNumber maxFractionDigits="2" value="${preco.valor * 1.5}"/>
                                    </small>
                                por apenas 
                                    R$ ${preco.valor}
                                </p>
                                
        						<input type="radio" name="tipoPreco" id="tipoPreco" value="${preco.tipo}" checked="checked" /> 
                                <label>Quero este!</label>
                              </div>
                            </div>
                        </div>
                
        				</c:forEach>
                    </div>
                </div>
                
            <div class="container" style="margin-top: 2%">
    			<button type="submit" class="btn btn-primary">Compre Agora ${produto.titulo}</button>
            </div>
            
			</form>
		</section>


		<div class="container" style="margin-top: 2%">

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
</t:template>