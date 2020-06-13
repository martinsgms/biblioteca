<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="t"%>

<t:template>
    <h1>Produto</h1>

    <form:form commandName="produto" method="POST" action="${s:mvcUrl('PC#gravar').build()}" enctype="multipart/form-data">
        <div>
            <form:label path="titulo">Título:</form:label>
            <form:input path="titulo" />
            <form:errors path="titulo"/>
        </div>
        <div>
            <form:label path="autor">Autor:</form:label>
            <form:input path="autor"/>
            <form:errors path="autor"/>
        </div>
        <div>
            <form:label path="paginas">Páginas:</form:label>
            <form:input path="paginas"/>
            <form:errors path="paginas"/>
        </div>
        <div>
            <form:label path="dataLancamento">Data de Lançamento:</form:label>
            <form:input path="dataLancamento"/>
            <form:errors path="dataLancamento"/>
        </div>
        <div>
            <form:label path="descricao">Descrição:</form:label>
            <form:textarea path="descricao" rows="10" cols="20"/>
        </div>
        
        <c:forEach items="${tipos}" var="t" varStatus="status">
            <div>
                <form:label path="precos[${status.index}].valor">${t}</form:label>
                <form:input path="precos[${status.index}].valor" />
                <form:hidden path="precos[${status.index}].tipo" value="${t}"/>
            </div>
        </c:forEach>
        
        <div>
            <button type="submit">Gravar</button>
        </div>
    </form:form>    
</t:template>