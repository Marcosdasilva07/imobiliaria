<%@page import="controller.Endereco"%>
<%@page import="model.EnderecoDAO"%>
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
        <title>Alterar Endereço de Cliente</title>
    </head>
    <body>
<script src="javascript/jquery.js"></script>
        <script src="javascript/jquery-ui.js"></script>
        <script language="JavaScript">
            function validar(form_cadastro_endereco) {
                if (form_cadastro_endereco.endereco.value == "") {
                    alert("CAMPO ENDEREÇO OBRIGATÓRIO");
                    return false
                } else if (form_cadastro_endereco.cidade.value == "") {
                    alert("CAMPO CIDADE OBRIGATÓRIO!");
                    return false
                } else if (form_cadastro_endereco.uf.value == "") {
                    alert("CAMPO UF OBRIGATÓRIO!");
                    return false
                } else if (form_cadastro_endereco.numero.value == "") {
                    alert("CAMPO NÚMERO OBRIGATÓRIO!");
                    return false
                } else if (form_cadastro_endereco.cep.value == "") {
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
              Integer idCliente = new Integer(request.getParameter("idCliente"));
        Integer id = new Integer(request.getParameter("idEndereco"));
        EnderecoDAO ed = new EnderecoDAO();
        Endereco e = ed.buscarId(id);
        if(e.getIdEndereco()>0){


%>

        <div id="conteudoLogin">
            <fieldset>
                <legend>Alterar Endereço do Cliente</legend>
                <form  name="form_cadastro_endereco" method="post" action="recebeEndereco.jsp?action=editar&idCliente=<%=idCliente%>" onsubmit="return validar(this)" >

                 

                    <!--Dados do Endereço--> 
                    <fieldset>

                        <div class="row">
                            <div class="large-3 columns">
                                <label>ID:
                                    <input readonly="true" type="text" name="idEndereco" value="<%=e.getIdEndereco()%>"/>
                                </label>
                            </div>
                            <div class="large-12 columns">
                                <label>Endereço Completo:
                                    <input type="text" name="endereco" value="<%=e.getEndereco()%>" />
                                </label>
                            </div>
                                </div>
                                <div class="row">
                            <div class="large-6 columns">
                                <label>CEP:
                                    <input type="text" name="cep" value="<%=e.getCep()%>"/>
                                </label>
                            </div>
                            <div class="large-6 columns">
                                <label>Cidade:
                                    <input type="text" name="cidade" value="<%=e.getCidade()%>"/>
                                </label>
                            </div>                             
                        </div>
                        <div class="row">
                            <div class="large-6 columns">
                                <label>Bairro:
                                    <input type="text" value="<%=e.getBairro()%>" name="bairro"/>
                                </label>
                            </div>                            
                            <div class="large-6 columns">                                
                                
                                <label>UF
                                <select name="uf">
                                        <option value="<%=e.getUf()%>"><%=e.getUf()%></option>
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
                                    <input type="text" name="numero" value="<%=e.getNumero()%>"/>
                                </label>
                            </div>

                        </div>

                    </fieldset>
                    <!-- Fim dos dados do Endereço-->

                    <input type="reset" class="button" value="Limpar"/>
                    <input  type="submit" class="button" value="Alterar" />
                </form>
            </fieldset>
        </div>


 <%
                        }
                    }catch (Exception e){
                        out.print("ERRO! na pagina editarEnderecoCliente"+e.getMessage());
                        }
%>
 <script src="js/vendor/jquery.js"></script>
        <script src="js/foundation.min.js"></script>
        <script>
            $(document).foundation();
        </script>
    </body>
</html>
