<%@page import="controller.Perfil"%>
<%@page import="model.PerfilDAO"%>
<%@page import="controller.Funcionario"%>
<%@page import="java.util.List"%>
<%@page import="model.FuncionarioDAO"%>
<%@page import="model.EnderecoDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta charset="utf-8">

        <meta name="viewport" content="width=device-width, initial-scale=1.0">


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

        <title>Funcionários Cadastrados</title>
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
                <td>Perfil</td>
                <td>Nome</td>
                <td>CPF</td>
                <td>Telefone</td>
            <td>E-mail</td>
            
                <td colspan="3" align="middle">OPÇÃO</td>
            </tr>
            <%
                try{
                   
                    FuncionarioDAO fd = new FuncionarioDAO();
                    PerfilDAO pd = new PerfilDAO();
                    List<Funcionario> Lista = fd.listarFuncionario();
                    for(Funcionario f: Lista){
                        
                        Perfil p = pd.buscarId(f.getPerfil().getIdPerfil());
                   %>
                        <tr>
                            <td><%=f.getIdFuncionario()%></td>
                            <td><%=p.getPerfil()%></td> 
                            <td><%=f.getNome()%></td>                            
                            <td><%=f.getCpf()%></td>
                            <td><%=f.getTelefone()%></td>
                            <td><%=f.getEmail()%></td>   

                            <td><%out.print("<a href=editarEnderecoFuncionario.jsp?idFuncionario="+f.getIdFuncionario()+"&idEndereco="+f.getEndereco().getIdEndereco()+">Editar</a>");%></td>
                            <td><%out.print("<a href=excluiFuncionario.jsp?idFuncionario="+f.getIdFuncionario()+"&idEndereco="+f.getEndereco().getIdEndereco()+">Excluir</a>");%></td>
                            <td><%out.print("<a href=visualizarFuncionario.jsp?idFuncionario="+f.getIdFuncionario()+">Visualizar</a>"); %></td>
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
