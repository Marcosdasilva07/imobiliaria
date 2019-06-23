<%@page import="controller.Funcionario"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="model.FuncionarioDAO"%>
<%
    session.invalidate();
%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta charset="utf-8">

        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Login</title>

        <link href="css/bootstrap.min.css" rel="stylesheet"> <!-- Framework dos icones -->

        <link rel="stylesheet" href="css/normalize.css">
        <link rel="stylesheet" href="css/foundation.css">
        <link href="css/estilo.css" rel="stylesheet" type="text/css"/>


        <script src="js/vendor/modernizr.js"></script>

    </head>
    <body>
    

        <script language="javascript" type="text/javascript">
            function validar() {
                var login = formLogin.login.value;
                var senha = formLogin.senha.value;


                if (login == "" || login == null) {
                    alert('Preencha o campo com o Login!');
                    formLogin.login.focus();
                    return false;
                }

                if (senha == "" || senha == null) {
                    alert('Preencha o campo com a Senha!');
                    formLogin.senha.focus();
                    return false;
                }

            }
             
        </script>
      
        

        <div id='geral'>  
             <div id="topo">
            <img src="imagem\topo.jpg">
        </div>

            <div id="menu">


            <nav class="top-bar" data-topbar role="navigation">
                

                <section class="top-bar-section">
                    <!-- Right Nav Section -->
                    <ul class="right">
                        <li class="has-form">
                            <a href="login.jsp" class="button">Restrito</a>
                        </li>
                    </ul>

                    <!-- Left Nav Section   -->
                    <ul class="left">
                        <li class="divider"></li>
                        <li class="active"><a href="index.jsp"> <span class="glyphicon glyphicon-home"></span>&nbsp; Início</a></li>
                        <li class="divider"></li>
                        
                        <li class="divider"></li>
                        <li><a href="venda.jsp?action=acesso"> <span class="glyphicon glyphicon-usd"></span>&nbsp; Venda</a></li>
                        <li class="divider"></li>
                        <li class="has-dropdown">
                            <a href="#"> <span class="glyphicon glyphicon-phone-alt"></span>&nbsp; Fale Conosco</a>
                            <ul class="dropdown">
                                <li class="active"><a href="contato.jsp">Contato</a></li>
                                <li class="active"><a href="localizacao.jsp">Localização</a></li>
                            </ul>
                        </li>
                        <li class="divider"></li>

                    </ul>


                </section>
            </nav>

        </div>
          
           

           
                
                <div id="conteudoLogin">

            <fieldset>
                <legend>Login</legend>

                <form method="post" action="recebeLogin.jsp" name="formLogin" >

                    <div class="row">
                        <div class="large-6 columns">
                            <label>Login:
                                <input type="text" name="login"/>
                            </label>
                        </div>
                        <div class="large-6 columns">
                            <label>Senha:
                                <input type="password" name="senha"/>
                            </label>
                        </div>
                    </div>
                    <center>
                        <div class="row">
                            <input type="submit" class="button" value='Entrar' onclick="return validar()">
                        </div>
                    </center>

                </form>

        </div>
        
        </div>
        <div id='rodapeLogin' align='center'>
            <fieldset>
            <rodape>
                QS 07 Lote 01 - EPCT - 
                Taguatinga, Brasília/DF - 
                CEP: 71966-700 - 
                aemimoveis@gmail.com
            </rodape>
            </fieldset>

        </div>
        
         <script src="js/vendor/jquery.js"></script>
        <script src="js/foundation.min.js"></script>
        <script>
            $(document).foundation();
        </script>
</body>
</html>
