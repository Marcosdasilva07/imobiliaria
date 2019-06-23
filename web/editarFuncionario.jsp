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
            
   <%
            try{
              
        Integer id = new Integer(request.getParameter("idFuncionario"));
        FuncionarioDAO fd = new FuncionarioDAO();
        Funcionario f = fd.buscarId(id);
        PerfilDAO pd = new PerfilDAO();
        
        if(f.getIdFuncionario()>0){


%>              
   
 <div id="conteudoLogin">
            <fieldset>
                <legend>Alterar Funcionário</legend>
                <form  name="form_cadastro_funcionario" method="post" action="recebeFuncionario.jsp?action=editar"  onsubmit="return validar(this)">

                    <!-- Dados do propietário-->
                    <fieldset>
                        <legend>Dados do Funcionário</legend>
                        <div class="row">
                            <div class="large-3 columns">
                                <label>ID Funcionário:
                                    <input readonly="true" type="text" name="idFuncionario" value="<%=f.getIdFuncionario()%>"/>
                                </label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="large-12 columns">
                                <label>Nome:
                                    <input type="text" name="nome"  value="<%=f.getNome() %>"/>
                                </label>
                            </div>
                        </div>
                        <div class="row">
                            <div class="large-6 columns">
                                <label>RG:
                                    <input type="text" name="rg" value="<%=f.getRg() %>"/>
                                </label>
                            </div>
                            <div class="large-6 columns">
                                <label>CPF:
                                    <input type="text" name="cpf" value="<%=f.getCpf() %>"/>
                                </label>
                            </div>
                        </div>
                        <div>
                            <div class="large-6 columns">
                                <label>Telefone:
                                    <input type="text" name="telefone" value="<%=f.getTelefone()%>" id='Telefone'/>
                                </label>
                            </div>                            
                        </div>
                        <div class="row">
                            <div class="large-6 columns">
                                <label>Data de Nacimento:
                                    <input type="text" value="<%=f.getDataNasc()%>" id="Data" name="dataNasc"/>
                                </label>
                            </div>
                            <div class="large-12 columns">
                                <label>E-mail:
                                    <input type="text" value="<%=f.getEmail()%>" name="email"/>
                                </label>
                            </div>
                        
                            <div class="large-8 columns">
                                <label>Estado Civil:
                                    <input type="text" value="<%=f.getEstadoCivil()%>"  name="estadoCivil"/>
                                </label>
                            </div>
                            <div class="large-6 columns">
                                <label>Login:
                                    <input type="text" value="<%=f.getLogin()%>"  name="login"/>
                                </label>
                            </div>
                            
                       <div class="large-6 columns">
                                <label>Senha:
                                    <input type="password" value="<%=f.getSenha()%>"  name="senha"/>
                                </label>
                            </div>
                            
                            <div class="large-4 columns">
                                <label>
                                    <input  type="hidden" value="<%=f.getEndereco().getIdEndereco()%>" name="idEndereco"/>
                                </label>
                            </div>
                        </div>
                                <div class="large-4 columns">
                                 <label>Perfil:
                                    <select  name="idPerfil">
                                        <option value="<%=f.getPerfil().getIdPerfil()%>">
                                        <tr>
                                            <td><%=f.getPerfil().getIdPerfil()%> / </td>

                                            <%
                                        Perfil per = pd.buscarId(f.getPerfil().getIdPerfil());
%>
                                            <td><%=per.getPerfil()%></td>
                                            
                                            
                                        </tr>
                                        </option>
                                        <%
                                                    try {
                                                        
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
                    <input  type="submit" class="button" value="Alterar"/>
                </form>
            </fieldset>
        </div>
<%
                        }
                    }catch (Exception e){
                        out.print("ERRO! na pagina "+e.getMessage());
                        }
%>
 <script src="js/vendor/jquery.js"></script>
        <script src="js/foundation.min.js"></script>
        <script>
            $(document).foundation();
        </script>

    </body>
</html>
