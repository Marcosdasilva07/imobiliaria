<%@page import="model.FuncionarioDAO"%>
<%@page import="controller.Funcionario"%>
<%@page import="model.FuncionarioDAO"%>
<%@page import="controller.Imovel"%>
<%@page import="model.ImovelDAO"%>
<%@page import="controller.Anuncio"%>
<%@page import="java.util.List"%>
<%@page import="model.AnuncioDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="css/estilo.css" type="text/css" rel="stylesheet">
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
        <title>Anúncios Cadastrados</title>
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
                    <td>ID Anúncio</td>
                    <td>Valor</td>
                    <td>Valor do Condomínio</td>
                    <td>Aceita Financiamento?</td>
                    <td>Tipo do Anúncio</td>                   
                    <td>ID Imóvel</td>                   



                    <td colspan="3" align="middle">OPÇÃO</td>
                </tr>
                <%
                            try {
                                AnuncioDAO cd = new AnuncioDAO();
                                List<Anuncio> Lista = cd.listarAnuncio();
                                for (Anuncio a : Lista) {
                %>
                <tr>
                    <td><%=a.getIdAnuncio()%></td>
                    <td>R$<%=a.getValor()%></td>
                    <td>R$<%=a.getValorCondominio()%></td>
                    <td><%=a.getAceitaFinanciamento()%></td>
                    <td><%=a.getTipoAnuncio()%></td>                   
                    <td><%=a.getImovel().getIdImovel()%></td>                    

                    <td><%out.print("<a href=editarAnuncio.jsp?idAnuncio=" + a.getIdAnuncio() + "&idImovel=" + a.getImovel().getIdImovel() + "&idFuncionario=" + a.getFuncionario().getIdFuncionario() + ">Editar</a>");%></td>
                    <td><%out.print("<a href=excluiAnuncio.jsp?idAnuncio=" + a.getIdAnuncio() + ">Excluir</a>");%></td>
                    <td><%out.print("<a href=visualizarAnuncio.jsp?idAnuncio="+a.getIdAnuncio()+">Visualizar</a>"); %></td>
                </tr>
                <%
                                }
                            } catch (Exception e) {
                                out.print("ERRO!" + e.getMessage());
                            }
                %>
            </table>

        </div>
            
            
        <script src="js/vendor/jquery.js"></script>
        <script src="javascript/mascara.js"></script>
        <script src="js/foundation.min.js"></script>
        <script>
            $(document).foundation();
        </script>

        <%%>
    </body>
</html>
