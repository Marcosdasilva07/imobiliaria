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
        <title>Vender</title>

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
                        <li><a href="#"> <span class="glyphicon glyphicon-usd"></span>&nbsp; Venda</a></li>
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

        <div id="pesquisa">


            <fieldset>
                <legend>Pesquisar Imóvel</legend>
                <form method="post" action="venda.jsp?action=pesquisa" >


                    <label><b>Cidade:</b>
                        <select name="cidade">
                            <option value="" >Selecione</option>
                            <option value="%">Todas</option>
                            <option value="aguas claras">Águas Claras</option>
                            <option value="brasilia">Brasília</option>
                            <option value="brazlandia">Brazlândia</option>
                            <option value="candangolandia">Candangolândia</option>
                            <option value="ceilandia">Ceilândia</option>
                            <option value="cruzeiro">Cruzeiro</option>
                            <option value="fercal">Fercal</option>
                            <option value="gama">Gama</option>
                            <option value="guara">Guará</option>
                            <option value="itapoa">Itapoã</option>
                            <option value="jardim botanico">Jardim Botânico</option>
                            <option value="lago norte">Lago Norte</option>
                            <option value="lago sul">Lago Sul</option>
                            <option value="nucleo bandeirante">Núcleo Bandeirante</option>
                            <option value="paranoa">Paranoá</option>
                            <option value="park way">Park Way</option>
                            <option value="planaltina">Planaltina</option>
                            <option value="recanto das emas">Recanto das Emas</option>
                            <option value="riacho fundo i">Riacho Fundo I</option>
                            <option value="riacho fundo ii">Riacho Fundo II</option>
                            <option value="samambaia">Samambaia</option>
                            <option value="santa maria">Santa Maria</option>
                            <option value="sao sebastiao">São Sebastião</option>
                            <option value="scia">SCIA</option>
                            <option value="sia">SIA</option>
                            <option value="%sobradinho%">Sobradinho</option>
                            <option value="sudoeste">Sudoeste</option>
                            <option value="taguatinga">Taguatinga</option>
                            <option value="varjao">Varjão</option>
                            <option value="vicente pires">Vicente Pires</option>

                        </select>
                    </label>




                    <label><b>Tipo:</b>
                        <select name="tipo">
                            <option value="" >Selecione</option>
                            <option value="%">Todas</option>
                            <option value="apartamento">Apartamento</option>
                            <option value="casa">Casa</option>
                            <option value="chacara">Chácara</option>
                            <option value="condominio">Condominio</option>
                            <option value="cobertura">Cobertura</option>
                            <option value="kitnet">Kitnet</option>
                            <option value="loja">Loja</option>
                            <option value="salao">Salão</option>                                
                            <option value="sitio">Sítio</option>
                            <option value="sobrado">Sobrado</option>
                            <option value="terreno">Terreno</option>
                        </select>
                    </label>

                    <label><b>Preço:</b><br>
                        <div  class="large-6 columns"> 
                            de: <select name="inicio">
                                <option value="0.0">0</option>
                                <option value="50000.0">50 mil</option>
                                <option value="100000.0">100 mil</option>
                                <option value="150000.0">150 mil</option>
                                <option value="200000.0">200 mil</option>
                                <option value="300000.0">300 mil</option>
                                <option value="400000.0">400 mil</option>
                                <option value="500000.0">500 mil</option>
                                <option value="800000.0">800 mil</option>                                
                                <option value="1000000.0">1 milhão</option>
                            </select>
                        </div>
                        <div  class="large-6 columns"> 
                            até:<select name="fim">
                                <option value="1000000000000000000.0"></option>
                                <option value="50000.0">50 mil</option>
                                <option value="100000.0">100 mil</option>
                                <option value="150000.0">150 mil</option>
                                <option value="200000.0">200 mil</option>
                                <option value="300000.0">300 mil</option>
                                <option value="400000.0">400 mil</option>
                                <option value="500000.0">500 mil</option>
                                <option value="800000.0">800 mil</option>                                
                                <option value="1000000.0">1 milhão</option>
                                <option value="2000000.0">2 milhões</option>
                                <option value="3000000.0">3 milhões</option>

                            </select>
                        </div>
                    </label>



                    <input   type="submit" class="button" value="Pesquisar" />



                </form>
            </fieldset>


        </div>

        <div id='conteudoVenda1' >
            <div id="conteudoVenda" >
                <fieldset>

                    <legend>Venda</legend>







                    <%
                        String action = request.getParameter("action");
                        if (action.equalsIgnoreCase("pesquisa")) {

                            String cidade = new String(request.getParameter("cidade"));
                            String tipo = new String(request.getParameter("tipo"));
                            Double inicio = new Double(request.getParameter("inicio"));
                            Double fim = new Double(request.getParameter("fim"));

                            LocalizacaoDAO ld = new LocalizacaoDAO();
                            ImovelDAO id = new ImovelDAO();
                            AnuncioDAO ad = new AnuncioDAO();

                            List<Anuncio> Lista = ad.LeTodosPorPesquisa(tipo, cidade, inicio, fim);

                            for (Anuncio a : Lista) {
                                Imovel i = id.buscarId(a.getImovel().getIdImovel());
                                Localizacao l = ld.buscarId(i.getLocalizacao().getIdLocalizacao());


                    %>

                    <table border="2">
                        <tr>
                            <td rowspan="7">
                               
                                   <%out.print("<a href=detalhes.jsp?idAnuncio=" + a.getIdAnuncio() + ">     <img src=imagens/" + a.getImagem1() + " width=230 >      </a>");%>
                            </td>
                            <td align=center>
                                <b><%=l.getEndereco()%></b>       
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <b>   <%=i.getTipoImovel()%> </b> 
                            </td>
                        </tr>
                        <tr>      
                            <td>
                                <b><%=l.getCidade()%></b> 
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <b> Bairro</b> <%=l.getBairro()%>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <b> Quartos:</b>   <%=i.getNumQuartos()%>  
                                <b> Suítes:</b>  <%=i.getNumSuites()%> 
                                <b> Garagem:</b>  <%=i.getVagasGaragem()%>  
                            </td>
                        </tr>
                        <tr>
                            <td align=center>
                                <b>  R$ <%=a.getValor()%> </b>
                            </td>
                        </tr>
                        <tr >
                            <td >
                                <%out.print("<a href=detalhes.jsp?idAnuncio=" + a.getIdAnuncio() + ">Mais Detalhes</a>"); %>

                            </td>
                        </tr>
                    </table>

                    <%  }
                    } else if (action.equalsIgnoreCase("acesso")) {

                        LocalizacaoDAO ld = new LocalizacaoDAO();
                        ImovelDAO id = new ImovelDAO();
                        AnuncioDAO ad = new AnuncioDAO();

                        List<Anuncio> Lista = ad.LeTodosPorPesquisa("%", "%", 0.0, 0.0);

                        for (Anuncio a : Lista) {
                            Imovel i = id.buscarId(a.getImovel().getIdImovel());
                            Localizacao l = ld.buscarId(i.getLocalizacao().getIdLocalizacao());


                    %>
                    <table border="2">
                        <tr>
                            <td rowspan="7">
                                  <%out.print("<a href=detalhes.jsp?idAnuncio=" + a.getIdAnuncio() + ">     <img src=imagens/" + a.getImagem1() + " width=230 >      </a>");%>
                               
                            </td>
                            <td align=center>
                                <b><%=l.getEndereco()%></b>       
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <b>   <%=i.getTipoImovel()%> </b> 
                            </td>
                        </tr>
                        <tr>      
                            <td>
                                <b><%=l.getCidade()%></b> 
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <b> Bairro</b> <%=l.getBairro()%>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <b> Quartos:</b>   <%=i.getNumQuartos()%>  
                                <b> Suítes:</b>  <%=i.getNumSuites()%> 
                                <b> Garagem:</b>  <%=i.getVagasGaragem()%>  
                            </td>
                        </tr>
                        <tr>
                            <td align=center>
                                <b>  R$ <%=a.getValor()%> </b>
                            </td>
                        </tr>
                        <tr >
                            <td >
                                <%out.print("<a href=detalhes.jsp?idAnuncio=" + a.getIdAnuncio() + ">Mais Detalhes</a>"); %>

                            </td>
                        </tr>
                    </table> 

                    <%    }
                      }%>

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