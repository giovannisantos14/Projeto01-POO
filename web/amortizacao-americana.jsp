<%-- 
    Document   : armotizacao-americana
    Created on : 05/03/2020, 11:23:06
    Author     : Giovanni
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Amortização Americana</title>
        <link href="css/cssAmortizacao.css" rel="stylesheet">
    </head>
    <body>
        
        <%@include file="WEB-INF/jspf/cabecalho.jspf" %>
        <%@include file="WEB-INF/jspf/menu.jspf" %>
        
        <h2>Amortização Americana</h2>
        
        <%@include file="WEB-INF/jspf/form.jspf" %>
        
        <%if (request.getParameter("enviar") != null){

            double saldoDevedor = Double.parseDouble(request.getParameter("x")); //colocar valor saldo "x"
            int qtdParcelas = Integer.parseInt(request.getParameter("y")); //colocar qtd parcelas "y"
            double taxaJuros = Double.parseDouble(request.getParameter("z")); //colocar taxa juros "z"
            int aux = qtdParcelas;
            int mes = 0;
            double juros = saldoDevedor * (taxaJuros/100);
            double totalJuros = juros * qtdParcelas;
            DecimalFormat ft = new DecimalFormat("0.00");

        %>
        
        <h2>Resultado:</h2>
        <hr/>
        
        <table cellspacing="">
            
            <tr>
                
                <th>Mês</th>
                <th>Saldo devedor (R$)</th>
                <th>Amortização (R$)</th>
                <th>Juros</th>
                <th>Prestação (R$)</th>
                
            </tr>
            
            <%do{%>
            
                <tr>

                    <%if(mes < qtdParcelas && mes == 0){ %>
                        <td><%= mes %></td>    
                        <td><%= ft.format(saldoDevedor) %></td>
                        <td>-</td>
                        <td>-</td>
                        <td>-</td>
                    <%}else if(mes < qtdParcelas){%>
                        <td><%= mes %></td>    
                        <td><%= ft.format(saldoDevedor) %></td>
                        <td>-</td>
                        <td><%= ft.format(juros) %></td>
                        <td><%= ft.format(juros) %></td>
                    <%}else{%>
                        <td><%= mes %></td>
                        <td>-</td>
                        <td><%= ft.format(saldoDevedor) %></td>
                        <td><%= juros %></td>
                        <td><%= ft.format(juros + saldoDevedor) %></td>
                    <%}
                      aux--;
                      mes++;
                    %>
                    
                </tr>
                
            <%}while(aux >= 0);%>
            
            <tr>
                <td>-</td>
                <td>-</td>
                <td>-</td>
                <td>-</td>
                <td>-</td>
            </tr>
            
            <tr>
                <th>Total</th>
                <td>-</td>
                <td><%= saldoDevedor %></td>
                <td><%= totalJuros %></td>
                <td><%= totalJuros + saldoDevedor %></td>
            </tr>
            
        </table>
            
    <%}%>
        
    <%@include file="WEB-INF/jspf/rodape.jspf" %>
        
    </body>
</html>
