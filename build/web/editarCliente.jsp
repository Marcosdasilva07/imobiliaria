<%@page import="controller.Cliente"%>
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
       
    
        <title>Editar Cliente</title>
    </head>
    <body>
        <div id="topo">
            <img src="imagem\topo.jpg">
        </div>

      <%@include file="validarLogin.jsp" %>
        
          <%
            try{
        Integer idCliente = new Integer(request.getParameter("idCliente"));
        ClienteDAO cd = new ClienteDAO();
        Cliente c = cd.buscarId(idCliente);
        if(c.getIdCliente()>0){


%>
               <div id="conteudoLogin">
            <fieldset>
                <legend>Alterar Cliente</legend>
                <form  name="form_cadastro_cliente" method="post" action="recebeCliente.jsp?action=editar"  onsubmit="return validar(this)">

                    <!-- Dados do propietário-->
                    <fieldset>
                        <legend>Dados do Cliente</legend>
                        <div class="row">
                            <div class="large-3 columns">
                                <label>ID:
                                    <input readonly="true" type="text" name="idCliente"  value="<%=c.getIdCliente() %>"/>
                                </label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="large-12 columns">
                                <label>Nome:
                                    <input type="text" name="nome"  value="<%=c.getNome() %>"/>
                                </label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="large-6 columns">
                                <label>RG:
                                    <input type="text" name="rg" value="<%=c.getRg() %>"/>
                                </label>
                            </div>
                            <div class="large-6 columns">
                                <label>CPF:
                                    <input type="text" name="cpf" value="<%=c.getCpfCnpj()%>"/>
                                </label>
                            </div>
                        </div>
                        <div>
                            <div class="large-4 columns">
                                <label>Telefone:
                                    <input type="text" name="telefone" value="<%=c.getTelefone() %>"/>
                                </label>
                            </div>
                            <div class="large-4 columns">
                                <label>Celular 1:
                                    <input type="text" name="celular1" value="<%=c.getCelular1()%>"/>
                                </label>
                            </div>
                            <div class="large-4 columns">
                                <label>Celular 2:
                                    <input type="text" name="celular2" value="<%=c.getCelular2()%>"/>
                                </label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="large-4 columns">
                                <label>Data de Nacimento:
                                    <input type="text" value="<%=c.getDataNasc()%>" id="Data" name="dataNasc"/>
                                </label>
                            </div>
                            <div class="large-8 columns">
                                <label>E-mail:
                                    <input type="text" value="<%=c.getEmail()%>" name="email"/>
                                </label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="large-6 columns">
                                <label>Estado Civil:
                                    <input type="text" value="<%=c.getEstadoCivil()%>"  name="estadoCivil"/>
                                </label>
                            </div>
                            <div class="large-6 columns">
                                <label>Profissão:
                                    <input type="text" value="<%=c.getProfissao()%>" name="profissao"/>
                                </label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="large-6 columns">
                                <label>Empresa onde trabalha:
                                    <input type="text" value="<%=c.getEmpresaTrabalho()%>"  name="empresaTrabalho"/>
                                </label>
                            </div>
                            <div class="large-6 columns">
                                <label>
                                    <input  type="hidden" value="<%=c.getEndereco().getIdEndereco()%>"  name="idEndereco"/>
                                </label>
                            </div>
                        </div>

                    </fieldset>
                    <!-- Fim dos dados de propietário-->

                    
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
        }catch(Exception e){
            out.print("ERRO!"+e.getMessage());
        }

%>
    </body>
</html>
