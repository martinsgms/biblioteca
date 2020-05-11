<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <title>Biblioteca :: Produtos</title>
</head>

<style>
    table, tr, td{border: 1px solid; padding: 5px;}
</style>
<body>
    
    <h1>Lista de Produtos</h1>
    <a href="produto/form">Adicionar novo</a>
    <p>${message}</p>
    <table>
        <tr>
            <td>Titulo</td>
            <td>Autor</td>
            <td>Páginas</td>
            <td>Descrição</td>
        </tr>
        <tr> 
            <c:forEach items="${produtos}" var="p">
                <tr>
                    <td>${p.titulo}</td>
                    <td>${p.autor}</td>
                    <td>${p.paginas}</td>
                    <td>${p.descricao}</td>
                </tr>
            </c:forEach>
        </tr>
    </table>

</body>
</html>
