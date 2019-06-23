<%@page import="controller.Localizacao"%>
<%@page import="model.LocalizacaoDAO"%>
<%@page import="controller.Imovel"%>
<%@page import="java.util.List"%>
<%@page import="model.ImovelDAO"%>
<%@page import="controller.Anuncio"%>
<%@page import="model.AnuncioDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
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


        <title>Editar Anúncio</title>
    </head>
    <body>
        <div id="topo">
            <img src="imagem\topo.jpg">
        </div>

        <%@include file="validarLogin.jsp" %>
        <%
                    try {
                        Integer id = new Integer(request.getParameter("idAnuncio"));
                        AnuncioDAO ad = new AnuncioDAO();
                        Anuncio a = ad.buscarId(id);
                        if (a.getIdAnuncio() > 0) {


        %>
        <div id="conteudoLogin">
            <fieldset>
                <legend>Alterar Anúncio</legend>
                <form  name="form_cadastro_anuncio" method="post" action="recebeAnuncio.jsp?action=editar"  onsubmit="return validar(this)">

                    <!-- Dados do Anúncio-->
                    <fieldset>
                        <legend>Dados do Anúncio</legend>
                        <div class="row">
                            <div class="large-3 columns">
                                <label>ID Anúncio:
                                    <input readonly="true" type="text" name="idAnuncio"  value="<%=a.getIdAnuncio()%>"/>
                                </label>
                            </div>
                        </div>
                        <div class="row">

                            <div class="large-6 columns">
                                <label>Valor do Imóvel:
                                    <input type="text" name="valor"  value="<%=a.getValor()%>"/>
                                </label>
                            </div>


                            <div class="large-6 columns">
                                <label>Valor do Condomínio:
                                    <input type="text" name="valorCondominio" value="<%=a.getValorCondominio()%>"/>
                                </label>
                            </div>


                        </div>
                        <div class="large-6 columns">
                            <label>Aceita Financiamento?
                                <input type="text" name="aceitaFinanciamento" value="<%=a.getAceitaFinanciamento()%>"/>
                            </label>
                        </div>
                        <div>
                            <div class="large-6 columns">
                                <label>Tipo:
                                    <input type="text" name="tipoAnuncio" value="<%=a.getTipoAnuncio()%>"/>
                                </label>
                            </div>
                           

                            <div class="large-4 columns">
                                <label>ID Funcionário:
                                    <input type="text" value="<%=a.getFuncionario().getIdFuncionario()%>"  name="idFuncionario"/>
                                </label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="large-4 columns">
                                <label>Imóvel:
                                     <select  name="idImovel">
                                         
                                        <option value="<%=a.getImovel().getIdImovel()%>">
                                        <tr>
                                            
                                            
                                            
                                            <td><%=a.getImovel().getIdImovel()%></td>
                                            <td></td>
                                            
                                            
                                        </tr>
                                        </option>
                                        
                                        <%
                                                    try {
                                                        ImovelDAO cd = new ImovelDAO();
                                                        List<Imovel> lista = cd.listarImovel();
                                                         LocalizacaoDAO ld = new LocalizacaoDAO();
                                                        for (Imovel i : lista) {
                                                             Localizacao l = ld.buscarId(i.getLocalizacao().getIdLocalizacao());
                                        %>
                                       
                                        <option value="<%=i.getIdImovel()%>">

                                        <tr>
                                            <td><%=i.getIdImovel()%> /</td>
                                           <td><%=l.getEndereco()%></td>
                                        </tr>
                                        </option>
                                        <%
                                                        }

                                                    } catch (Exception erro) {
                                                        out.print(erro);
                                                    }
                                        %>
                                    </select>
                                </label>
                            </div>
                                        

                                    <div class="large-12 columns">
                                        <label>Imagem 1:
                                            <input type="file" value="<%=a.getImagem1()%>" accept="image/jpeg; image/gif; image/bmp; image/png" name="imagem1"/>
                                        </label>
                                    </div>
                                    <div class="large-12 columns">
                                        <label>Imagem 2:
                                            <input type="file" value="<%=a.getImagem2()%>" accept="image/jpeg; image/gif; image/bmp; image/png" name="imagem2"/>
                                        </label>
                                    </div>
                                    <div class="large-12 columns">
                                        <label>Imagem 3:
                                            <input type="file" value="<%=a.getImagem3()%>" accept="image/jpeg; image/gif; image/bmp; image/png" name="imagem3"/>
                                        </label>
                                    </div>
                                    <div class="large-12 columns">
                                        <label>Imagem 4:
                                            <input type="file" value="<%=a.getImagem4()%>" accept="image/jpeg; image/gif; image/bmp; image/png" name="imagem4"/>
                                        </label>
                                    </div>

                        </div>



                    </fieldset>
                    <!-- Fim dos dados do Anúncio-->


                    <input type="reset" class="button" value="Limpar"/>
                    <input  type="submit" class="button" value="Alterar" />
                </form>
            </fieldset>
        </div>

        <script src="js/vendor/jquery.js"></script>
        <script src="javascript/mascara.js"></script>
        <script src="js/foundation.min.js"></script>
        <script>
            $(document).foundation();
        </script>
        <%
                        }
                    } catch (Exception e) {
                        out.print("ERRO!" + e.getMessage());
                    }

        %>
    </body>
</html>
