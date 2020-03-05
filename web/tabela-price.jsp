<%-- 
    Document   : tabela-price
    Created on : 05/03/2020, 11:23:33
    Author     : Giovanni
--%>
<%@page import="java.text.DecimalFormat"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tabela Price</title>
    </head>
    <body>
        
        <%@include file="WEB-INF/jspf/cabecalho.jspf" %>
        <%@include file="WEB-INF/jspf/menu.jspf" %>
        
        <h2>Tabela Price</h2>
        
        <%if (request.getParameter("enviar") == null){  %>
        
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
            int mes = 0;
            double juros = 0;
            double base = (1 + taxaJuros/100);
            DecimalFormat ft = new DecimalFormat("0.00"); 

            double valorParcelas = saldoDevedor*((Math.pow(base, qtdParcelas) * (taxaJuros/100)) / (Math.pow(base, qtdParcelas) - 1));

        %>
        
        <h2>Resultado:</h2>
        <hr/>
        
        <table border="1">
            
            <tr>
                
                <th>Mês</th>
                <th>Saldo devedor (R$)</th>
                <th>Amortização (R$)</th>
                <th>Juros</th>
                <th>Prestação (R$)</th>
                
            </tr> 
            
            <%do{%>
            
                <tr>

                    <%if(mes == 0){%>

                        <td><%= mes %></td>
                        <td><%= ft.format(saldoDevedor) %></td>
                        <td>-</td>
                        <td>-</td>
                        <td>-</td>                

                    <%}else{%>
                    
                        <td><%= mes %></td>
                        <%
                            juros = taxaJuros/100 * saldoDevedor;
                            saldoDevedor -= (valorParcelas - juros);
                        %>
                        <td><%= ft.format(saldoDevedor) %></td>
                        <td><%= ft.format(valorParcelas - juros) %></td>
                        <td><%= ft.format(juros) %></td>
                        <td><%= ft.format(valorParcelas) %></td>
                        
                    <%}
                        mes++;
                    %>
                    
                </tr>
            
            <%}while(saldoDevedor >= 0 && mes <= qtdParcelas);}%>
            
        </table>
            
        <%@include file="WEB-INF/jspf/rodape.jspf" %>
        
    </body>
</html>
