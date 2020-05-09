<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset='utf-8'>
    <title>Biblioteca :: Cadastro Produto</title>
</head>
<body>
    
    <h1>Produto</h1>

    <form method="POST" action="/biblioteca/produto/gravar">
        <div>
            <label for="titulo">T�tulo:</label>
            <input type="text" name="titulo" id="titulo">
        </div>
        <div>
            <label for="autor">Autor:</label>
            <input type="text" name="autor" id="autor">
        </div>
        <div>
            <label for="paginas">P�ginas:</label>
            <input type="number" name="paginas" id="paginas">
        </div>
        <div>
            <label for="descricao">Descri��o:</label>
            <textarea name="descricao" id="descricao" rows="10" cols="20"></textarea>
        </div>
        <div>
            <button type="submit">Gravar</button>
        </div>
    </form>    
</body>
</html>