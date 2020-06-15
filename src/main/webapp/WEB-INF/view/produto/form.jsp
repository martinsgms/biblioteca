<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<%@ taglib tagdir="/WEB-INF/tags" prefix="t"%>

<t:template>
    <h1>Produto</h1>
    <hr>
    
    <style>
        .red { color: #F00 }
    </style>
    
    <p>
        <span class="red">*</span>: Campos obrigatórios
    </p>
    
    <form:form commandName="produto" method="POST" action="${s:mvcUrl('PC#gravar').build()}" enctype="multipart/form-data">
        <div class="form-row">
            <div class="col-12">
                <form:label path="titulo"><span class="red">*</span>Título:</form:label>
                <form:input path="titulo" class="form-control" />
                <form:errors path="titulo" class="red" />
            </div>
        </div>
        <div class="form-row">
            <div class="col-4">
                <form:label path="autor"><span class="red">*</span>Autor:</form:label>
                <form:input path="autor" class="form-control" />
                <form:errors path="autor" class="red" />
            </div>
            
            <div class="col-4">
                <form:label path="paginas"><span class="red">*</span>Páginas:</form:label>
                <form:input path="paginas" class="form-control" />
                <form:errors path="paginas" class="red" />
            </div>

            <div class="col-4">
                <form:label path="dataLancamento">Data de Lançamento:</form:label>
                <form:input path="dataLancamento" class="form-control"/>
                <form:errors path="dataLancamento" class="red" />
            </div>
        </div>
        
        <div class="form-row">
            <div class="col-12">
                <form:label path="descricao">Descrição:</form:label>
                <form:textarea path="descricao" rows="10" cols="20" class="form-control" />
            </div>
        </div>
        
        <div class="form-row">
            <c:forEach items="${tipos}" var="t" varStatus="status">
                <div class="col-4">
                    <form:label path="precos[${status.index}].valor"><span class="red">*</span>${t}</form:label>
                    
                    <div class="input-group mb-2">
                    <div class="input-group-prepend">
                      <div class="input-group-text">R$</div>
                    </div>
                        <form:input path="precos[${status.index}].valor" class="form-control" type="number" placeholder="Ex: 29,90" step="0.01" min="0" max="999"/>
                    </div>
                    <form:errors path="precos[${status.index}].valor" class="red" />
                    <form:hidden path="precos[${status.index}].tipo" value="${t}"/>
                </div>
            </c:forEach>
        </div>
        
        <div class="form-row" style="margin-top: 2%; margin-bottom: 2%">
            <div class="col-12">
                <button type="submit" class="btn btn-primary">Gravar</button>
            </div>
        </div>
        
    </form:form>    
</t:template>