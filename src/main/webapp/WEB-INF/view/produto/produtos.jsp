<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="t"%>

<t:template>
    <h1>Lista de Produtos</h1>
    <a href="${s:mvcUrl('PC#form').build()}">Adicionar novo</a>
    <p>${message}</p>
    
    <table class="table">
    <thead>
        <tr>
            <th scope="col">Titulo</th>
            <th scope="col">Autor</th>
            <th scope="col">Páginas</th>
            <th scope="col">Descrição</th>
        </tr>
    </thead>
    <tbody>
        <tr> 
        <c:forEach items="${produtos}" var="p">
       
        <tr>
            <td>
                <a href="${s:mvcUrl('PC#detalhe').arg(0, p.id).build()}">${p.titulo}</a>
            </td>
            <td>${p.autor}</td>
            <td>${p.paginas}</td>
            <td>${p.descricao}</td>
        </tr>
        
        </c:forEach>
        </tr>
    </tbody>
    </table>
</t:template>
