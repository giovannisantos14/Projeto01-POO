<%-- 
    Document   : armotizacao-constante
    Created on : 05/03/2020, 11:22:38
    Author     : Giovanni
--%>

<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Armotização Constante</title>
    </head>
    <body>
        
        <%@include file="WEB-INF/jspf/cabecalho.jspf" %>
        <%@include file="WEB-INF/jspf/menu.jspf" %>
        
        <h2>Amortização Constante</h2>
        
        <%if (request.getParameter("enviar") == null){ %>
        
            <form>
                Digite o valor do saldo: <input type="number" step="any" name="x" /><br/>
                Digite a quantidade de parcelas: <input type="number" name="y" /><br/>
                Digite a taxa de juros: <input type="number" name="z" /><br/>
                <input type="submit" name="enviar" value="Enviar"/>
            </form>
        
        <%}else{

            double saldoDevedor = Double.parseDouble(request.getParameter("x")); //colocar valor saldo "x"
            int qtdParcelas = Integer.parseInt(request.getParameter("y")); //colocar qtd parcelas "y"
            double taxaJuros = Double.parseDouble(request.getParameter("z")); //colocar taxa juros "z"
            int meses = 0;
            double juros;
            double prestacao;
            double mesAnt = 0;
            double totalAmortizacao = saldoDevedor;
            double acuJuros = 0;
            double valorParcelas = saldoDevedor / qtdParcelas;
            DecimalFormat ft = new DecimalFormat("0.00");

        %>
        
        <h2>Resultado:</h2>
        <hr/>
        
        <table border="1">
            
            <tr>
                
                <th>Mês</th>
                <th>Saldo devedor (R$)</th>
                <th>Amortização (R$)</th>
                <th>Juros</th>
                <th>Prestação (amortização + juros)</th>
                
            </tr>
            
            <%do{%>
            
                <tr>

                    <%if(meses == 0){%>
                        <td><%= meses %></td>
                        <td><%= ft.format(saldoDevedor) %></td>
                        <td>-</td>
                        <td>-</td>
                        <td>-</td>
                    <%}else{%>
                        <td><%= meses %></td>
                        <td><%= ft.format(saldoDevedor) %></td>
                        <td><%= ft.format(valorParcelas) %></td>
                        <%
                            juros = mesAnt * (taxaJuros/100);
                            acuJuros += juros;
                            prestacao = (mesAnt * (taxaJuros/100)) + valorParcelas;
                        %>
                        <td><%= ft.format(juros) %></td>
                        <td><%= ft.format(prestacao) %></td>
                   <%}
                     meses++;
                     mesAnt = saldoDevedor;
                     saldoDevedor -= valorParcelas;
                   %>
                   
                </tr>
                
            <%}while(saldoDevedor >= 0);%>
            
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
                <td><%= totalAmortizacao %></td>
                <td><%= acuJuros %></td>
                <td><%= totalAmortizacao + acuJuros %></td>
            </tr>
            
            <%}%>
            
        </table>
            
        <%@include file="WEB-INF/jspf/rodape.jspf" %>
        
    </body>
</html>