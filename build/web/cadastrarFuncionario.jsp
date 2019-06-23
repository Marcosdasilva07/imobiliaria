<%@page import="controller.Perfil"%>
<%@page import="java.util.List"%>
<%@page import="model.PerfilDAO"%>
<%@page import="controller.Funcionario"%>
<%@page import="model.FuncionarioDAO"%>
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
       
        <title>Cadastrar Funcionário</title>
    </head>
    <body>
        
        <script language="JavaScript">
            function validar (form_cadastro_funcionario){
                if(form_cadastro_funcionario.nome.value==""){
                    alert("CAMPO NOME OBRIGATÓRIO");
                    return false
                }else if(form_cadastro_funcionario.telefone.value==""){
                    alert("CAMPO TELEFONE OBRIGATÓRIO!");
                    return false
                }else if(form_cadastro_funcionario.rg.value==""){
                    alert("CAMPO RG OBRIGATÓRIO!");
                    return false
                }else if(form_cadastro_funcionario.cpf.value==""){
                    alert("CAMPO CPF OBRIGATÓRIO!");
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
                <legend>Cadastrar Funcionário</legend>
                <form  name="form_cadastro_funcionario" method="post" action="recebeFuncionario.jsp?action=cadastrar"  onsubmit="return validar(this)">

                    <!-- Dados do propietário-->
                    <fieldset>
                        <legend>Dados do Funcionário</legend>
                        <div class="row">
                            <div class="large-12 columns">
                                <label>Nome:
                                    <input type="text" name="nome"  placeholder="Digite o nome do funcionário"/>
                                </label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="large-6 columns">
                                <label>RG:
                                    <input type="text" name="rg" placeholder="Digite o RG do funcionário"/>
                                </label>
                            </div>
                            <div class="large-6 columns">
                                <label>CPF:
                                    <input type="text" name="cpf" placeholder="Digite o CPF do funcionário"/>
                                </label>
                            </div>
                        </div>
                        <div>
                            <div class="large-6 columns">
                                <label>Telefone:
                                    <input type="text" name="telefone" placeholder="Digite o Telefone do funcionário" id='Telefone'/>
                                </label>
                            </div>                            
                        </div>
                        <div class="row">
                            <div class="large-6 columns">
                                <label>Data de Nacimento:
                                    <input type="text" placeholder="Digite a data de nascimento do funcionário" id="Data" name="dataNasc"/>
                                </label>
                            </div>
                            <div class="large-12 columns">
                                <label>E-mail:
                                    <input type="text" placeholder="Digite o e-mail do funcionário" name="email"/>
                                </label>
                            </div>
                        
                            <div class="large-8 columns">
                                <label>Estado Civil:
                                    <input type="text" placeholder="Digite o estado civil do funcionário"  name="estadoCivil"/>
                                </label>
                            </div>
                            <div class="large-8 columns">
                                <label>Login:
                                    <input type="text" placeholder="Digite o login"  name="login"/>
                                </label>
                            </div>
                            
                       <div class="large-6 columns">
                                <label>Senha:
                                    <input type="password" placeholder="Digite a Senha"  name="senha"/>
                                </label>
                            </div>
                            
                            <div class="large-4 columns">
                                <label>
                                       <% Integer id = new Integer(request.getParameter("idEndereco"));  %>

                                    <input  type="hidden"  value="<%=id%>"  name="idEndereco"/>
                                </label>
                        </div>
                                <div class="large-6 columns">
                                <label>Perfil:
                                    <select  name="idPerfil">
                                        <option>
                                        <tr>
                                            <td>ID /</td>
                                            <td>Perfil </td>
                                            
                                        </tr>
                                        </option>
                                        <%
                                                    try {
                                                        PerfilDAO pd = new PerfilDAO();
                                                        List<Perfil> lista = pd.listarPerfil();
                                                        for (Perfil p : lista) {
                                        %>
                                        <option value="<%=p.getIdPerfil()%>">
                                        <tr>
                                            <td><%=p.getIdPerfil()%> /</td>
                                            <td><%=p.getPerfil()%> </td>
                                            
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

                    </fieldset>
                    <!-- Fim dos dados de propietário-->

                    
                        <input type="reset" class="button" value="Limpar"/>
                    <input  type="submit" class="button" value="Cadastrar"/>
                </form>
            </fieldset>
        </div>
 
 <script src="js/vendor/jquery.js"></script>
        <script src="js/foundation.min.js"></script>
        <script>
            $(document).foundation();
        </script>

    </body>
</html>
