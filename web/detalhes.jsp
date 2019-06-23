<%@page import="java.util.List"%>
<%@page import="controller.Localizacao"%>
<%@page import="controller.Localizacao"%>
<%@page import="model.LocalizacaoDAO"%>
<%@page import="controller.Imovel"%>
<%@page import="model.ImovelDAO"%>
<%@page import="controller.Anuncio"%>
<%@page import="model.AnuncioDAO"%>
<%
    session.invalidate();
%>
<html class="no-js" lang="en" >

    <head>
        <meta charset="utf-8">
        <!-- If you delete this meta tag World War Z will become a reality -->
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Detalhes</title>

        <link href="css/bootstrap.min.css" rel="stylesheet"> <!-- Framework dos icones -->
        <link rel="stylesheet" href="css/normalize.css">
        <link rel="stylesheet" href="css/foundation.css">
        <link href="css/estilo.css" rel="stylesheet" type="text/css"/>


        <script src="js/vendor/modernizr.js"></script>

    </head>
    <body>


        <div id="topo">
            <img src="imagem\topo.jpg">
        </div>

        <div id="menu">


            <nav class="top-bar" data-topbar role="navigation">


                <section class="top-bar-section">
                    <!-- Right Nav Section -->
                    <ul class="right">
                        <li class="has-form">
                            <a href="login.jsp" class="button">Restrito</a>
                        </li>
                    </ul>

                    <!-- Left Nav Section -->
                    <ul class="left">
                        <li class="divider"></li>
                        <li class="active"><a href="index.jsp"> <span class="glyphicon glyphicon-home"></span>&nbsp; Início</a></li>
                        <li class="divider"></li>

                        <li class="divider"></li>
                        <li><a href="venda.jsp?action=acesso"> <span class="glyphicon glyphicon-usd"></span>&nbsp; Venda</a></li>
                        <li class="divider"></li>
                        <li class="has-dropdown">
                            <a href="#"> <span class="glyphicon glyphicon-phone-alt"></span>&nbsp; Fale Conosco</a>
                            <ul class="dropdown">
                                <li class="active"><a href="contato.jsp">Contato</a></li>
                                <li class="active"><a href="localizacao.jsp">Localização</a></li>
                            </ul>
                        </li>
                        <li class="divider"></li>

                    </ul>


                </section>
            </nav>

        </div>



        <div id='conteudoDetalhes1' >
            <div id="conteudoDetalhes" >
                <fieldset>

                    <legend>Venda</legend>







                    <%
                        try {
                            Integer id = new Integer(request.getParameter("idAnuncio"));
                            AnuncioDAO ad = new AnuncioDAO();
                            Anuncio a = ad.buscarId(id);
                            ImovelDAO imd = new ImovelDAO();
                            Imovel i = imd.buscarId(a.getImovel().getIdImovel());
                            LocalizacaoDAO ld = new LocalizacaoDAO();
                            Localizacao l = ld.buscarId(i.getLocalizacao().getIdLocalizacao());

                    %>




                    <table>


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
                        <TR>
                            <TD><b>Valor do Imóvel:</b></TD>
                            <TD>R$ <%=a.getValor()%></TD>
                             <TD><b>Valor do Condomínio:</b></TD>
                            <TD>R$ <%=a.getValorCondominio()%></TD>

                        </TR>
                        <TR>
                           
                            <TD><b>Aceira Financiamento?</b></TD>
                            <TD><%=a.getAceitaFinanciamento()%></TD>
                            <TD><b>Tipo do Anúncio:</b></TD>
                            <TD><%=a.getTipoAnuncio()%></TD>
                        </TR>
                        
                        <TR>
                            <TD><b>Área Útil:</b></TD>
                            <TD><%=i.getAreaUtil()%>m²</TD>
                            <TD><b>Quantidade de Quartos:</b></TD>
                            <TD><%=i.getNumQuartos()%></TD>
                            
                        </TR>
                        <TR>
                            <TD><b>Área do Terreno:</b></TD>
                            <TD><%=i.getAreaTerreno()%>m²</TD>
                            <TD><b>Área Privativa:</b></TD>
                            <TD><%=i.getAreaPrivativa()%>m²</TD>
                            
                        </TR>


                        <TR>
                            
                            <TD><b>Quantidade de banheiros:</b></TD>
                            <TD><%=i.getNumBanheiros()%></TD>
                            <TD><b>Quantidade de Suítes:</b></TD>
                            <TD><%=i.getNumSuites()%></TD>
                        </TR>
                        <TR>
                            <TD><b>Garagem:</b></TD>
                            <TD><%=i.getVagasGaragem()%></TD>
                            <TD><b>Tipo do Imóvel:</b></TD>
                            <TD><%=i.getTipoImovel()%></TD>
                        </TR>
                        <TR>
                            <TD><b>Informações Adicionais:</b></TD>
                            <TD><%=i.getMais()%></TD>
                            <TD></TD>
                            <TD></TD>
                        </TR>
                        <TR>
                            <TD><b>Endereço:</b></TD>
                            <TD><%=l.getEndereco()%></TD>
                            <TD><b>CEP:</b></TD>
                            <TD><%=l.getCep()%></TD>
                        </TR>
                        <TR>
                            <TD><b>Cidade:</b></TD>
                            <TD><%=l.getCidade()%></TD>
                            <TD><b>Bairro:</b></TD>
                            <TD><%=l.getBairro()%></TD>
                        </TR>
                        <TR>
                            <TD><b>UF:</b></TD>
                            <TD><%=l.getUf()%></TD>
                            <TD><b>Número:</b></TD>
                            <TD><%=l.getNumero()%></TD>
                        </TR>
                        

                    </table>





                    <%

                        } catch (Exception e) {
                            out.print("ERRO!" + e.getMessage());
                        }
                    %>
                </fieldset>
            </div>     
        </div>






        <div id='rodape' align='center'>
            <fieldset>
                <rodape>
                    QS 07 Lote 01 - EPCT - 
                    Taguatinga, Brasília/DF - 
                    CEP: 71966-700 - 
                    aemimoveis@gmail.com
                </rodape>
            </fieldset>

        </div>



        <script src="js/vendor/jquery.js"></script>
        <script src="js/foundation.min.js"></script>
        <script>
            $(document).foundation();
        </script>
    </body>
</html>
