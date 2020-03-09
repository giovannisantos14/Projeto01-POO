<%-- 
    Document   : home
    Created on : 05/03/2020, 10:55:58
    Author     : Giovanni
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Amortização - Home</title>
        <link href="css/cssAmortizacao.css" rel="stylesheet">
    </head>
    <body>
        <%@include file="WEB-INF/jspf/cabecalho.jspf" %>
        <%@include file="WEB-INF/jspf/menu.jspf" %>
        <h2>Membros da equipe:</h2>
        <ul>
            <li>Giovanni Santos D'Angelo </li>
            <li>Noemi Ribeiro </li>
            <li>Leonardo Santos Filoso </li>
            <li>Yan Matheus Iamamura Andrade </li>
            <li>Giorgio Palaia Pereira </li>
        </ul>
        <h3>O que faz a aplicação?</h3>
        <p>
            Calcula e apresenta o resultado de diferentes tipos de amortização.
        </p>
        <%@include file="WEB-INF/jspf/rodape.jspf" %>
    </body>
</html>
