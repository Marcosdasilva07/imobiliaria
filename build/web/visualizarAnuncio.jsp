<%@page import="controller.Localizacao"%>
<%@page import="model.LocalizacaoDAO"%>
<%@page import="controller.Imovel"%>
<%@page import="model.ImovelDAO"%>
<%@page import="sun.management.resources.agent"%>
<%@page import="controller.Anuncio"%>
<%@page import="model.AnuncioDAO"%>
<%@page import="controller.Cliente"%>
<%@page import="java.util.List"%>
<%@page import="model.ClienteDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="en" >

    <head>
        <meta charset="utf-8">
        <!-- If you delete this meta tag World War Z will become a reality -->
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Visualizar Anúncio</title>

        <link href="css/bootstrap.min.css" rel="stylesheet"> <!-- Framework dos icones -->
        <link rel="stylesheet" href="css/normalize.css">
        <link rel="stylesheet" href="css/foundation.css">
        <link href="css/estilo.css" rel="stylesheet" type="text/css"/>


        <script src="js/vendor/modernizr.js"></script>
 <title>Visualizar Anúncio</title>
    </head>
    <body>
        <script src="javascript/jquery.js"></script>
        <script src="javascript/jquery-ui.js"></script>

      
        <div id="topo">
            <img src="imagem\topo.jpg">
        </div>

      <%@include file="validarLogin.jsp" %>

  <%         try{
                    Integer id = new Integer (request.getParameter("idAnuncio"));
                    AnuncioDAO ad = new AnuncioDAO();
                    Anuncio a =  ad.buscarId(id);
                    ImovelDAO imd = new ImovelDAO();
                    Imovel i = imd.buscarId(a.getImovel().getIdImovel());
                    LocalizacaoDAO ld = new LocalizacaoDAO();
                    Localizacao l = ld.buscarId(i.getLocalizacao().getIdLocalizacao());
                   %>


        <div id="visualizar">
          <table>
            <TR>
                <TR >
                            <td >
                                <%out.print("<a href=# data-reveal-id=imagem1 class=radius button> <img src=imagens/" + a.getImagem1() + "> </a>"); %>
                                <div id="imagem1" class="reveal-modal" data-reveal>
                                    <% out.print("<img src=imagens/" + a.getImagem1() + ">");  %>
                                </div>
                            </td>
                            <td >
                                <%out.print("<a href=# data-reveal-id=imagem2 class=radius button> <img src=imagens/" + a.getImagem2() + "> </a>"); %>
                                <div id="imagem2" class="reveal-modal" data-reveal>
                                    <% out.print("<img src=imagens/" + a.getImagem2() + ">");  %>
                                </div>
                            </td>
                            <td >
                                <%out.print("<a href=# data-reveal-id=imagem3 class=radius button> <img src=imagens/" + a.getImagem3() + "> </a>"); %>
                                <div id="imagem3" class="reveal-modal" data-reveal>
                                    <% out.print("<img src=imagens/" + a.getImagem3() + ">");  %>
                                </div>
                            </td>
                            <td >
                                <%out.print("<a href=# data-reveal-id=imagem4 class=radius button> <img src=imagens/" + a.getImagem4() + "> </a>");%>
                                <div id="imagem4" class="reveal-modal" data-reveal>
                                    <% out.print("<img src=imagens/" + a.getImagem4() + ">");%>
                                </div>
                            </td>

                        </TR>
               








                <TD><b>ID Anuncio:</b></TD>
                <TD><%=a.getIdAnuncio()%></TD>
                <TD><b>Valor do Imóvel:</b></TD>
                <TD><%=a.getValor()%></TD>
            </TR>
            <TR>
                <TD><b>Valor do Condomínio:</b></TD>
                <TD><%=a.getValorCondominio()%></TD>
                <TD><b>Aceira Financiamento?</b></TD>
                <TD><%=a.getAceitaFinanciamento()%></TD>
            </TR>
            <TR>
                <TD><b>Tipo do Anúncio:</b></TD>
                <TD><%=a.getTipoAnuncio()%></TD>
                <TD></TD>
                <TD></TD>
            </TR>
            <TR>
                <TD><b>ID Imóvel:</b></TD>
                <TD><%=a.getImovel().getIdImovel()%></TD>
                <TD><b>Área Útil:</b></TD>
                <TD><%=i.getAreaUtil()%>m²</TD>
            </TR>
             <TR>
                            <TD><b>Área do Terreno:</b></TD>
                            <TD><%=i.getAreaTerreno()%>m²</TD>
                            <TD><b>Área Privativa:</b></TD>
                            <TD><%=i.getAreaPrivativa()%>m²</TD>

                        </TR>
            <TR>
                <TD><b>Quantidade de Quartos:</b></TD>
                <TD><%=i.getNumQuartos()%></TD>
                <TD><b>Quantidade de banheiros:</b></TD>
                <TD><%=i.getNumBanheiros()%></TD>
            </TR>
            <TR>
                <TD><b>Quantidade de Suítes:</b></TD>
                <TD><%=i.getNumSuites()%></TD>
                <TD><b>Garagem:</b></TD>
                <TD><%=i.getVagasGaragem()%></TD>
            </TR>
             <TR>
                <TD><b>Tipo do Imóvel:</b></TD>
                <TD><%=i.getTipoImovel()%></TD>
                <TD><b>Informações Adicionais:</b></TD>
                <TD><%=i.getMais()%></TD>
            </TR>
             <TR>
                <TD><b>ID Localização:</b></TD>
                <TD><%=i.getLocalizacao().getIdLocalizacao()%></TD>
                <TD><b>Endereço:</b></TD>
                <TD><%=l.getEndereco()%></TD>
            </TR>
             <TR>
                <TD><b>CEP:</b></TD>
                <TD><%=l.getCep()%></TD>
                <TD><b>Cidade:</b></TD>
                <TD><%=l.getCidade()%></TD>
            </TR>
            <TR>
                <TD><b>Bairro:</b></TD>
                <TD><%=l.getBairro()%></TD>
                <TD><b>UF:</b></TD>
                <TD><%=l.getUf()%></TD>
            </TR>
            <TR>
                <TD><b>Número:</b></TD>
                <TD><%=l.getNumero()%></TD>
                <TD></TD>
                <TD></TD>
            </TR>
          
                    </table>
            

        </div>

                     <%

                    }catch (Exception e){
                        out.print("ERRO!"+e.getMessage());
                        }
%>

        

        <script src="js/vendor/jquery.js"></script>
        <script src="js/foundation.min.js"></script>
        <script>
            $(document).foundation();
        </script>
    </body>
</html>