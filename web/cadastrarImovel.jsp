<%@page import="java.util.List"%>
<%@page import="controller.Cliente"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.ClienteDAO"%>
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
        <title>Cadastrar Imóvel</title>
    </head>
    <body>

        <script language="JavaScript">
            function validar (form_cadastro_imovel){
                if(form_cadastro_imovel.areaTerreno.value==""){
                    alert("CAMPO ÁREA DO TERRENO OBRIGATÓRIO");
                    return false
                }else if(form_cadastro_imovel.numQuartos.value==""){
                    alert("CAMPO NÚMERO DE QUARTOS OBRIGATÓRIO!");
                    return false
                }else if(form_cadastro_imovel.numBanheiros.value==""){
                    alert("CAMPO NÚMERO DE BANHEIROS OBRIGATÓRIO!");
                    return false
                }else if(form_cadastro_imovel.tipoImovel.value==""){
                    alert("CAMPO TIPO DO IMÓVEL OBRIGATÓRIO!");
                    return false
                }
                else if(form_cadastro_imovel.idCliente.value==""){
                    alert("CAMPO ID DO CLIENTE RELACIONADO OBRIGATÓRIO!");
                    return false
                }
                else if(form_cadastro_imovel.idLocalizacao.value==""){
                    alert("CAMPO ID DA LOCALIZACAO RELACIONADA OBRIGATÓRIO!");
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
                <legend>Cadastrar Imóvel</legend>
                <form  name="form_cadastro_imovel" method="post" action="recebeImovel.jsp?action=cadastrar"  onsubmit="return validar(this)">

                    <!-- Dados do propietário-->
                    <fieldset>
                        <legend>Dados do Imóvel</legend>
                        <div class="row">
                            <div class="large-12 columns">
                                <label>Área Útil:
                                    <input type="text" name="areaUtil"  placeholder="Digite em m² a Área Útil"/>
                                </label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="large-6 columns">
                                <label>Número de Quartos:
                                    <input type="text" name="numQuartos" placeholder="Digite a Quantidade de Quartos"/>
                                </label>
                            </div>
                            <div class="large-6 columns">
                                <label>Número de Banheiros:
                                    <input type="text" name="numBanheiros" placeholder="Digite a Quantidade de Banheiros"/>
                                </label>
                            </div>
                        </div>
                        <div>
                            <div class="large-4 columns">
                                <label>Vagas na Garagem:
                                    <input type="text" name="vagasGaragem" placeholder="Digite o nº de Vagas na Garagem" />
                                </label>
                            </div>
                            <div class="large-4 columns">
                                <label>Número de Suítes:
                                    <input type="text" name="numSuites" placeholder="Digite nº de Suítes" />
                                </label>
                            </div>
                            <div class="large-4 columns">
                                <label>Área do Terreno:
                                    <input type="text" name="areaTerreno" placeholder="Digite em m² a Área do Terreno" />
                                </label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="large-4 columns">
                                <label>Área Privativa:
                                    <input type="text" placeholder="Digite em m² a Área Privativa" id="Data" name="areaPrivativa"/>
                                </label>
                            </div>
                            <div class="large-8 columns">
                                <label>Tipo de Imóvel:
                                    <input type="text" placeholder="Digite o Tipo de Imóvel" name="tipoImovel"/>
                                </label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="large-12 columns">
                                <label>Mais informações:
                                    <textarea  name="mais" placeholder="Digite informações adicionais sobre o imóvel"></textarea>
                                </label>
                            </div>
                            <div class="large-5 columns">
                                <label>Cliente:
                                    <select  name="idCliente">
                                        <option>
                                        <tr>
                                            <td>ID /</td>
                                            <td>Nome /</td>
                                            <td>RG</td>
                                        </tr>
                                        </option>
                                        <%
                                                    try {
                                                        ClienteDAO cd = new ClienteDAO();
                                                        List<Cliente> lista = cd.listarCliente();
                                                        for (Cliente c : lista) {
                                        %>
                                        <option value="<%=c.getIdCliente()%>">
                                        <tr>
                                            <td><%=c.getIdCliente()%> /</td>
                                            <td><%=c.getNome()%> /</td>
                                            <td><%=c.getRg()%></td>
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

                            <div class="row">
                                <div class="large-5 columns">
                                    <label>
                                          <% Integer id = new Integer(request.getParameter("idLocalizacao"));  %>
                                        <input type="hidden" value="<%=id%>" name="idLocalizacao"/>
                                    </label>
                                </div>

                            </div>
                        </div>
                    </fieldset>
                    <!-- Fim dos dados de propietário-->


                    <input type="reset" class="button" value="Limpar"/>
                    <input  type="submit" class="button" value="Cadastrar" onclick="return validar()"/>
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
