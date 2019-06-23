<%@page import="controller.Localizacao"%>
<%@page import="model.LocalizacaoDAO"%>
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
        <title>Cadastrar Localização do Imóvel</title>
    </head>
    <body>
        
        <script language="JavaScript">
            function validar (form_cadastro_localizacao){
                if(form_cadastro_localizacao.endereco.value==""){
                    alert("CAMPO ENDEREÇO OBRIGATÓRIO");
                    return false
                }else if(form_cadastro_localizacao.cidade.value==""){
                    alert("CAMPO CIDADE OBRIGATÓRIO!");
                    return false
                }else if(form_cadastro_localizacao.bairro.value==""){
                    alert("CAMPO BAIRRO OBRIGATÓRIO!");
                    return false
                }else if(form_cadastro_localizacao.uf.value==""){
                    alert("CAMPO UF OBRIGATÓRIO!");
                    return false
                }else if(form_cadastro_localizacao.numero.value==""){
                    alert("CAMPO NÚMERO OBRIGATÓRIO!");
                    return false
                }else if(form_cadastro_localizacao.cep.value==""){
                    alert("CAMPO CEP OBRIGATÓRIO!");
                    return false
                }


            }
        </script>
       
      
         

    <div id="topo">
            <img src="imagem\topo.jpg">
        </div>

       <%@include file="validarLogin.jsp" %>

  <%
            try{
              
           Integer idImovel = new Integer(request.getParameter("idImovel"));   
        Integer id = new Integer(request.getParameter("idLocalizacao"));
        LocalizacaoDAO ld = new LocalizacaoDAO();
        Localizacao l = ld.buscarId(id);
        if(l.getIdLocalizacao()>0){


%>

        <div id="conteudoLogin">
            <fieldset>
                <legend>Alterar Localização do Imóvel</legend>
                <form  name="form_cadastro_localizacao" method="post" action="recebeLocalizacao.jsp?action=editar&idImovel=<%=idImovel%>" onsubmit="return validar(this)" >



                    <!--Dados da Localização-->
                    <fieldset>

                        <div class="row">
                            <div class="large-3 columns">
                                <label>ID Localização:
                                    <input readonly="true" type="text" name="idLocalizacao" value="<%=l.getIdLocalizacao()%>"/>
                                </label>
                            </div>
                            <div class="large-12 columns">
                                <label>Endereço Completo:
                                    <input type="text" name="endereco" value="<%=l.getEndereco()%>"/>
                                </label>
                            </div>

                            <div class="large-6 columns">
                                <label>CEP:
                                    <input type="text" name="cep" value="<%=l.getCep()%>"/>
                                </label>
                            </div>
                            <div class="large-6 columns">
                                <label>Cidade:
                                    <input type="text" name="cidade" value="<%=l.getCidade()%>"/>
                                </label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="large-6 columns">
                                <label>Bairro:
                                    <input type="text" value="<%=l.getBairro()%>" name="bairro"/>
                                </label>
                            </div>
                            <div class="large-6 columns">
                                <label>UF:
                                  <select name="uf">
                                        <option value="<%=l.getUf()%>"><%=l.getUf()%></option>
                                        <option value="df"> DF </option>
                                        <option value="go"> GO </option>
                                        <option value="mg"> MG </option>
                                        <option value="mt"> MT </option>
                                        <option value="ms"> MS </option>
                                        <option value="sp"> SP </option>
                                        <option value="to"> TO </option>
                                        
                                                                               
                                    </select>
                                 </label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="large-3 columns">
                                <label>Número:
                                    <input type="text" name="numero" value="<%=l.getNumero()%>"/>
                                </label>
                            </div>

                        </div>

                    </fieldset>
                    <!-- Fim dos dados da Localização-->

                    <input type="reset" class="button" value="Limpar"/>
                    <input  type="submit" class="button" value="Alterar" />
                </form>
            </fieldset>
        </div>
        
           
<%
                        }
                    }catch (Exception e){
                        out.print("ERRO! na pagina editarLocalização"+e.getMessage());
                        }
%>

<script src="js/vendor/jquery.js"></script>
        <script src="js/foundation.min.js"></script>
        <script>
            $(document).foundation();
        </script>
    
    </body>
</html>
