<%@page import="model.PerfilDAO"%>
<%@page import="controller.Perfil"%>
<%@page import="controller.Funcionario"%>
<%@page import="model.FuncionarioDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <%
   
    String login = (String) session.getAttribute("login");
      String nome = (String) session.getAttribute("nome");
     String perfil = (String) session.getAttribute("perfil");
    try {
    if (login == "" || login == null){
         out.print("<script language='javascript'>");
                    out.print("alert('Funcionário não Logado!');");
                    out.print("location.href='login.jsp';");
                    out.print("</script>");
               
        
        }else {
               if( perfil.equalsIgnoreCase("administrador")){
        
                 %>
                 
                 <div id="menu">


            <nav class="top-bar" data-topbar role="navigation">


                <section class="top-bar-section">
                    <!-- Right Nav Section -->
                    <ul class="right">
                        <li class="has-form">
                            <a href="index.jsp" class="button [secondary alert success]">Sair</a>
                        </li>
                    </ul>

                    <!-- Left Nav Section   -->
                    <ul class="left">
                        <li class="divider"></li>
                        <li class="active"><a href="index.jsp"> <span class="glyphicon glyphicon-home"></span>&nbsp; Início</a></li>

                        <li class="divider"></li>


                        <li class="has-dropdown">
                            <a href="#"> <span class="glyphicon glyphicon-user"></span>&nbsp; Cliente</a>
                            <ul class="dropdown">
                                <li class="active"><a href="cadastrarEnderecoCliente.jsp">Cadastrar Cliente</a></li>
                                <li class="active"><a href="clientesCadastrados.jsp">Clientes Cadastrados</a></li>
                            </ul>
                        </li>
                       
                        <li class="has-dropdown">
                            <a href="#"> <span class="glyphicon glyphicon-picture"></span>&nbsp; Imóvel</a>
                            <ul class="dropdown">
                                <li class="active"><a href="cadastrarLocalizacao.jsp">Cadastrar Imóvel</a></li>
                                <li class="active"><a href="imoveisCadastrados.jsp">Imóveis Cadastrados</a></li>
                            </ul>
                        </li>
                        <li class="has-dropdown">
                            <a href="#"> <span class="glyphicon glyphicon-picture"></span>&nbsp; Anúncio</a>
                            <ul class="dropdown">
                                <li class="active"><a href="cadastrarAnuncio.jsp">Cadastrar Anúncio</a></li>
                                <li class="active"><a href="anunciosCadastrados.jsp">Anúncios Cadastrados</a></li>
                            </ul>
                        </li>

                        <li class="has-dropdown">
                            <a href="#"> <span class="glyphicon glyphicon-user"></span>&nbsp; Funcionário</a>
                            <ul class="dropdown">
                                <li class="active"><a href="cadastrarEnderecoFuncionario.jsp">Cadastrar Funcionário</a></li>
                                <li class="active"><a href="funcionariosCadastrados.jsp">Funcionários Cadastrados</a></li>
                            </ul>
                        </li>
                        
                         <li class="has-dropdown">
                            <a href="#"> <span class="glyphicon glyphicon-user"></span>&nbsp; Perfil</a>
                            <ul class="dropdown">
                                <li class="active"><a href="inserirPerfil.jsp">Inserir Perfil</a></li>
                                <li class="active"><a href="perfisCadastrados.jsp">Perfis Cadastrados</a></li>
                            </ul>
                        </li>
                    </ul>
                </section>

            </nav>
        </div>
                 
                 
                 <%
               }else{
                 %>
                 
                 
                 
                  <div id="menu">


            <nav class="top-bar" data-topbar role="navigation">


                <section class="top-bar-section">
                    <!-- Right Nav Section -->
                    <ul class="right">
                        <li class="has-form">
                            <a href="#" class="button [secondary alert success]">Sair</a>
                        </li>
                    </ul>

                    <!-- Left Nav Section   -->
                    <ul class="left">
                        <li class="divider"></li>
                        <li class="active"><a href="index.jsp"> <span class="glyphicon glyphicon-home"></span>&nbsp; Início</a></li>

                        <li class="divider"></li>


                        <li class="has-dropdown">
                            <a href="#"> <span class="glyphicon glyphicon-user"></span>&nbsp; Cliente</a>
                            <ul class="dropdown">
                                <li class="active"><a href="cadastrarEnderecoCliente.jsp">Cadastrar Cliente</a></li>
                                <li class="active"><a href="clientesCadastrados.jsp">Clientes Cadastrados</a></li>
                            </ul>
                        </li>
                       
                        <li class="has-dropdown">
                            <a href="#"> <span class="glyphicon glyphicon-picture"></span>&nbsp; Imóvel</a>
                            <ul class="dropdown">
                                <li class="active"><a href="cadastrarLocalizacao.jsp">Cadastrar Imóvel</a></li>
                                <li class="active"><a href="imoveisCadastrados.jsp">Imóveis Cadastrados</a></li>
                            </ul>
                        </li>
                        <li class="has-dropdown">
                            <a href="#"> <span class="glyphicon glyphicon-picture"></span>&nbsp; Anúncio</a>
                            <ul class="dropdown">
                                <li class="active"><a href="cadastrarAnuncio.jsp">Cadastrar Anúncio</a></li>
                                <li class="active"><a href="anunciosCadastrados.jsp">Anúncios Cadastrados</a></li>
                            </ul>
                        </li>

                       
                    </ul>
                </section>

            </nav>
        </div>
                 
                 
                 <%
               }
                 
                 %>
                 <div id="login">   <%
                out.print("<bv>Bem Vindo </bv>"+perfil+ " "+nome);
                 %></div>   <%
            } 
        
        } catch (NullPointerException erro) {
                out.print(erro.getMessage());
            }
    %>
    </body>
</html>
