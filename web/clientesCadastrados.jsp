<%@page import="com.sun.xml.wss.saml.internal.saml11.jaxb10.ConfirmationMethod"%>
<%@page import="java.util.List"%>
<%@page import="model.EnderecoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="controller.Cliente, model.ClienteDAO"%>

<!DOCTYPE html>
<html>
    <head>
        <%--  <meta charset="utf-8"> --%>

        <%--  <meta name="viewport" content="width=device-width, initial-scale=1.0"> --%>


        <link href="css/bootstrap.min.css" rel="stylesheet"> <!-- Framework dos icones -->

        <link rel="stylesheet" href="css/normalize.css">
        <link rel="stylesheet" href="css/foundation.css">
        <link href="css/estilo.css" rel="stylesheet" type="text/css"/>
        <script src="js/vendor/modernizr.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/estilo.css" type="text/css" rel="stylesheet">

        <script type="text/javascript" src="javascript/jquery.js"></script>
        <script type="text/javascript" src="javascript/jquery-masked.js"></script>
        <script type="text/javascript" src="javascript/mascara.js"></script>
        <script type="text/javascript" src="script.js"></script>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>Clientes Cadastrados</title>
    </head>
    <body>
        <script src="javascript/jquery.js"></script>
        <script src="javascript/jquery-ui.js"></script>

      
        <div id="topo">
            <img src="imagem\topo.jpg">
        </div>

       <%@include file="validarLogin.jsp" %>
       
<div id="clientesCadastrados">
            <table border="2">
            <tr>
                <td>ID</td>
                <td>Nome</td>                
                <td>CPF</td>
                <td>Telefone</td>
            <td>Celular 1</td>
                              
                <td>ID Endereço</td>
                
                
                
                <td colspan="3" align="middle">OPÇÃO</td>
            </tr>
            <%
                try{
                    ClienteDAO cd = new ClienteDAO();
                    List<Cliente> Lista = cd.listarCliente();
                    for(Cliente c: Lista){
                   %>
                        <tr>
                            <td><%=c.getIdCliente()%></td>
                            <td><%=c.getNome()%></td>                            
                            <td><%=c.getCpfCnpj()%></td>
                            <td><%=c.getTelefone()%></td>
                            <td><%=c.getCelular1()%></td>
                                                      
                            <td><%=c.getEndereco().getIdEndereco()%></td>
                            
                            
                            <td><%out.print("<a href=editarEnderecoCliente.jsp?idCliente="+c.getIdCliente()+"&idEndereco="+c.getEndereco().getIdEndereco()+">Editar</a>");%></td>
                            <td><%out.print("<a href=excluiCliente.jsp?idCliente="+c.getIdCliente()+"&idEndereco="+c.getEndereco().getIdEndereco()+">Excluir</a>"); %></td>
                            <td><%out.print("<a href=visualizarCliente.jsp?idCliente="+c.getIdCliente()+">Visualizar</a>"); %></td>
                        </tr>
                        <%
                        }
                    }catch (Exception e){
                        out.print("ERRO!"+e.getMessage());
                        }

%>
        </table>
   
         
            
            
            

       
</div>

<script src="js/vendor/jquery.js"></script>
        <script src="js/foundation.min.js"></script>
        <script>
            $(document).foundation();
        </script>

    </body>
</html>
