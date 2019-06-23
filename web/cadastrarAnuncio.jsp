<%@page import="controller.Endereco"%>
<%@page import="controller.Localizacao"%>
<%@page import="model.LocalizacaoDAO"%>
<%@page import="controller.Imovel"%>
<%@page import="java.util.List"%>
<%@page import="model.ImovelDAO"%>
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
        <title>Cadastrar Anúncio</title>
    </head>
    <body>

        <script language="JavaScript">
            function validar(form_cadastro_anuncio) {
                if (form_cadastro_anuncio.valor.value == "") {
                    alert("CAMPO VALOR DO IMÓVEL OBRIGATÓRIO");
                    return false
                } else if (form_cadastro_anuncio.aceitaFinanciamento.value == "") {
                    alert("CAMPO ACEITA FINANCIAMENTO? OBRIGATÓRIO!");
                    return false
                } else if (form_cadastro_anuncio.tipoAnuncio.value == "") {
                    alert("CAMPO TIPO DE ANÚNCIO OBRIGATÓRIO!");
                    return false

                } else if (form_cadastro_anuncio.idImovel.value == "") {
                    alert("CAMPO ID DO IMÓVEL OBRIGATÓRIO!");
                    return false
                }


            }
        </script>

        <div id="topo">
            <img src="imagem\topo.jpg">
        </div>

        <%@include file="validarLogin.jsp" %>

        <div id="conteudoLogin">
            <fieldset>
                <legend>Cadastrar Anúncio</legend>
                <form  name="form_cadastro_anuncio" method="post" action="recebeAnuncio.jsp?action=cadastrar"  onsubmit="return validar(this)">

                    <!-- Dados do Anuncio-->
                    <fieldset>
                        <legend>Dados do Anúncio</legend>
                        <div class="row">
                            <div class="large-6 columns">
                                <label>Valor do Imóvel:
                                    <input type="text" placeholder="Digite o Valor do Imóvel" name="valor"/>
                                </label>
                            </div>
                            <div class="large-6 columns">
                                <label>Valor do Condomínio:
                                    <input  type="text" placeholder="Digite o Valor do Condomínio" name="valorCondominio"/>
                                </label>
                            </div>
                            <div class="large-6 columns">
                                <label>Financiamento:
                                    <select name="aceitaFinanciamento">
                                        <option disabled selected>Selecionar</option>
                                        <option value="sim">Sim</option>
                                        <option value="nao">Não</option>
                                    </select>
                                </label>
                            </div>

                            <div class="large-6 columns">
                                <label>Tipo:
                                    <select name="tipoAnuncio">
                                        <option disabled selected>Selecionar</option>
                                        <option  value="venda">Venda</option>
                                        <option value="permuta">Permuta</option>
                                    </select>
                                </label>
                            </div>
                        </div>
                        <div class="row">

                            <div class="large-8 columns">
                                <label>Funcionário:
                                    <select name="idFuncionario">
                                        <option>
                                        <tr>
                                            <td>ID /</td>
                                            <td>Perfil /</td>
                                            <td>Nome</td>
                                        </tr>
                                        </option>
                                        
                                        <%  FuncionarioDAO fd = new FuncionarioDAO();
                                        PerfilDAO pf = new PerfilDAO();
                                        List<Funcionario> f = fd.listarFuncionario();
                                        for (Funcionario func : f) {
                                            Perfil p = pf.buscarId(func.getPerfil().getIdPerfil());
                                        %>

                                        <option value="<%=func.getIdFuncionario()%>">
                                            <tr>
                                            <td><%=func.getIdFuncionario()%></td>
                                            <td><%=p.getPerfil()%></td>
                                             <td><%=func.getNome()%></td>
                                        </tr>
                                        
                                        </option>
                                        <% } %>
                                    </select>
                                </label>
                            </div>
                            <div class="large-4 columns">
                                <label>Imóvel:

                                    <select  name="idImovel">
                                        <option>
                                        <tr>
                                            <td>ID /</td> 
                                            <td>Localização</td>




                                        </tr>
                                        </option>
                                        <%
                                            try {

                                                ImovelDAO id = new ImovelDAO();
                                                List<Imovel> lista = id.listarImovel();
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
                                    <input type="file" accept="image/jpeg; image/gif; image/bmp; image/png" name="imagem1"/>
                                </label>
                            </div>
                            <div class="large-12 columns">
                                <label>Imagem 2:
                                    <input type="file" accept="image/jpeg; image/gif; image/bmp; image/png" name="imagem2"/>
                                </label>
                            </div>
                            <div class="large-12 columns">
                                <label>Imagem 3:
                                    <input type="file" accept="image/jpeg; image/gif; image/bmp; image/png" name="imagem3"/>
                                </label>
                            </div>
                            <div class="large-12 columns">
                                <label>Imagem 4:
                                    <input type="file" accept="image/jpeg; image/gif; image/bmp; image/png" name="imagem4"/>
                                </label>
                            </div>

                        </div>


                    </fieldset>
                    <!-- Fim dos dados do anuncioo-->


                    <input type="reset" class="button" value="Limpar"/>
                    <input  type="submit" class="button" value="Cadastrar"/>
                </form>
            </fieldset>
        </div>




        <script src="js/vendor/jquery.js"></script>
        <script src="javascript/mascara.js"></script>
        <script src="js/foundation.min.js"></script>
        <script>
                    $(document).foundation();
        </script>
    </body>
</html>
