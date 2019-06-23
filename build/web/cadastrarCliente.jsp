<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.LinkedList"%>
<%@page import="java.util.List"%>
<%@page import="model.EnderecoDAO"%>
<%@page import="controller.Endereco"%>
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
       
    
        <title>Cadastrar Cliente</title>
    </head>
    <body>
        <script src="javascript/jquery.js"></script>        
        <script src="javascript/jquery-ui.js"></script>
        <script language="JavaScript">
            function validar (form_cadastro_cliente){
                if(form_cadastro_cliente.nome.value==""){
                    alert("CAMPO NOME OBRIGATÓRIO");
                    return false
                }else if(form_cadastro_cliente.rg.value==""){
                    alert("CAMPO RG OBRIGATÓRIO!");
                    return false
                }else if(form_cadastro_cliente.cpf.value==""){
                    alert("CAMPO CPF OBRIGATÓRIO!");
                    return false
                }else if(form_cadastro_cliente.profissao.value==""){
                    alert("CAMPO PROFISSÃO OBRIGATÓRIO!");
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
                <legend>Cadastrar Cliente</legend>
                <form  name="form_cadastro_cliente" method="post" action="recebeCliente.jsp?action=cadastrar"  onsubmit="return validar(this)">

                    <!-- Dados do propietário-->
                    <fieldset>
                        <legend>Dados do Cliente</legend>
                        <div class="row">
                            <div class="large-12 columns">
                                <label>Nome:
                                    <input type="text" name="nome"  placeholder="Digite o nome do cliente"/>
                                </label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="large-6 columns">
                                <label>RG:
                                    <input type="text" name="rg" placeholder="Digite o RG do cliente"/>
                                </label>
                            </div>
                            <div class="large-6 columns">
                                <label>CPF:
                                    <input type="text" name="cpf" placeholder="Digite o CPF ou CNPJ do cliente"/>
                                </label>
                            </div>
                        </div>
                        <div>
                            <div class="large-4 columns">
                                <label>Telefone:
                                    <input type="text" name="telefone" placeholder="Digite o Telefone do cliente" id='Telefone'/>
                                </label>
                            </div>
                            <div class="large-4 columns">
                                <label>Celular 1:
                                    <input type="text" name="celular1" placeholder="Digite um Celular do cliente" id="Telefone"/>
                                </label>
                            </div>
                            <div class="large-4 columns">
                                <label>Celular 2:
                                    <input type="text" name="celular2" placeholder="Digite um Celular do cliente" id="Telefone"/>
                                </label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="large-4 columns">
                                <label>Data de Nacimento:
                                    <input type="text" placeholder="Digite a data de nascimento do cliente" id="Data" name="dataNasc"/>
                                </label>
                            </div>
                            <div class="large-8 columns">
                                <label>E-mail:
                                    <input type="text" placeholder="Digite o e-mail do cliente" name="email"/>
                                </label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="large-6 columns">
                                <label>Estado Civil:
                                    <input type="text" placeholder="Digite o estado civil do cliente"  name="estadoCivil"/>
                                </label>
                            </div>
                            <div class="large-6 columns">
                                <label>Profissão:
                                    <input type="text" placeholder="Digite a profissão do cliente"  name="profissao"/>
                                </label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="large-6 columns">
                                <label>Empresa onde trabalha:
                                    <input type="text" placeholder="Digite a empresa onde o cliente trabalha"  name="empresaTrabalho"/>
                                </label>
                            </div>
                            <div class="large-6 columns">
                                <label>

                                    <% Integer id = new Integer(request.getParameter("idEndereco"));  %>

                                    <input  type="hidden"  value="<%=id%>"  name="idEndereco"/>
                                    
                                 
                                </label>
                                  
                                    
                            </div>
                        </div>

                    </fieldset>
                    <!-- Fim dos dados de propietário-->

                    
                        <input type="reset" class="button" value="Limpar"/>
                    <input  type="submit" class="button" value="Cadastrar" />
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
