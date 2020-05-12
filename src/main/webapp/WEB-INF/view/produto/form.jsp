<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>

<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <title>Biblioteca :: Cadastro Produto</title>
<style>
    *{font-family: verdana}
    div{margin: 10px}
</style>
</head>
<body>
    
    <h1>Produto</h1>

    <form:form commandName="produto" method="POST" action="${s:mvcUrl('PC#gravar').build()}">
        <div>
            <label for="titulo">Título:</label>
            <input type="text" name="titulo" id="titulo">
            <form:errors path="titulo"/>
        </div>
        <div>
            <label for="autor">Autor:</label>
            <input type="text" name="autor" id="autor">
            <form:errors path="autor"/>
        </div>
        <div>
            <label for="paginas">Páginas:</label>
            <input type="text" name="paginas" id="paginas">
            <form:errors path="paginas"/>
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
    </form:form>    
</body>
</html>