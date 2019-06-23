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
        <title>Inserir Perfil</title>
    </head>
    <body>
<script src="javascript/jquery.js"></script>
        <script src="javascript/jquery-ui.js"></script>
        <script language="JavaScript">
            function validar(form_inserir_perfil) {
                if (form_inserir_perfil.perfil.value == "") {
                    alert("CAMPO PERFIL OBRIGATÓRIO");
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
                <legend>Cadastrar Perfil</legend>
                <form  name="form_inserir_perfil" method="post" action="recebePerfil.jsp?action=cadastrar" onsubmit="return validar(this)" >



                    <!--Dados do Imóvel-->
                    <fieldset>

                        <div class="row">
                            <div class="large-12 columns">
                                <label>Novo Perfil:
                                    <input type="text" name="perfil" placeholder="Digite um Perfil"/>
                                </label>
                            </div>
                        </div>
                       
                    </fieldset>
                    <!-- Fim dos dados do Imóvel-->

                    <input type="reset" class="button" value="Limpar"/>
                    <input  type="submit" class="button" value="Inserir" />
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

