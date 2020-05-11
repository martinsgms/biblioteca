<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <title>Biblioteca :: Cadastro Produto</title>
</head>
<body>
    
    <h1>Produto</h1>

    <form method="POST" action="/biblioteca/produto">
        <div>
            <label for="titulo">Título:</label>
            <input type="text" name="titulo" id="titulo">
        </div>
        <div>
            <label for="autor">Autor:</label>
            <input type="text" name="autor" id="autor">
        </div>
        <div>
            <label for="paginas">Páginas:</label>
            <input type="number" name="paginas" id="paginas">
        </div>
        <div>
            <label for="descricao">Descrição:</label>
            <textarea name="descricao" id="descricao" rows="10" cols="20"></textarea>
        </div>
        
        <c:forEach items="${tipos}" var="t" varStatus="status">
            <div>
                <label for="precos[${status.index}].valor">${t}</label>
                <input type="text" name="precos[${status.index}].valor" id="precos[${status.index}].valor">
                <input type="hidden" name="precos[${status.index}].tipo" id="precos[${status.index}].tipo" value="${t}">
            </div>
        </c:forEach>
        
        <div>
            <button type="submit">Gravar</button>
        </div>
    </form>    
</body>
</html>