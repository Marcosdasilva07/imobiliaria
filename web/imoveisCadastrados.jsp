<%@page import="controller.Imovel"%>
<%@page import="java.util.List"%>
<%@page import="model.ImovelDAO"%>
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
        <title>Imóveis Cadastrados</title>
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
                    <td>ID Imóvel</td>
                    <td>Área Útil</td>
                    <td>Qtd Quartos</td>
                    <td>Qtd Banheiros</td>
                    <td>Qtd Vagas na Garagem</td>
                    <td>Qtd Suítes</td>
                    <td>Tipo do Imóvel</td>
                    



                    <td colspan="3" align="middle">OPÇÃO</td>
                </tr>
                <%
                            try {
                                ImovelDAO id = new ImovelDAO();
                                List<Imovel> Lista = id.listarImovel();
                                for (Imovel i : Lista) {
                %>
                <tr>
                    <td><%=i.getIdImovel()%></td>
                    <td><%=i.getAreaUtil()%></td>
                    <td><%=i.getNumQuartos()%></td>
                    <td><%=i.getNumBanheiros()%></td>
                    <td><%=i.getVagasGaragem()%></td>
                    <td><%=i.getNumSuites()%></td>
                    <td><%=i.getTipoImovel()%></td>
                    


                    <td><%out.print("<a href=editarLocalizacao.jsp?idImovel=" + i.getIdImovel() + "&idLocalizacao=" + i.getLocalizacao().getIdLocalizacao() + ">Editar</a>");%></td>                   
                    <td><%out.print("<a href=excluiImovel.jsp?idImovel=" + i.getIdImovel() + "&idLocalizacao=" + i.getLocalizacao().getIdLocalizacao() + ">Excluir</a>");%></td>
                     <td><%out.print("<a href=visualizarImovel.jsp?idImovel="+i.getIdImovel()+">Visualizar</a>"); %></td>
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

    </body>
</html>
