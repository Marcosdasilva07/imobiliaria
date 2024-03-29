<%
    session.invalidate();
%>
<html class="no-js" lang="en" >

    <head>
        <meta charset="utf-8">

        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Contato</title>
        <link href="css/bootstrap.min.css" rel="stylesheet"> <!-- Framework dos icones -->
        <link rel="stylesheet" href="css/normalize.css">
        <link rel="stylesheet" href="css/foundation.css">
        <link href="css/estilo.css" rel="stylesheet" type="text/css"/>


        <script src="js/vendor/modernizr.js"></script>

    </head>
    <body>
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

                    <!-- Left Nav Section -->
                    <ul class="left">
                        <li class="divider"></li>
                        <li class="active"><a href="index.jsp"> <span class="glyphicon glyphicon-home"></span>&nbsp; In�cio</a></li>
                        <li class="divider"></li>
                        
                        <li class="divider"></li>
                        <li><a href="venda.jsp?action=acesso"> <span class="glyphicon glyphicon-usd"></span>&nbsp; Venda</a></li>
                        <li class="divider"></li>
                        <li class="has-dropdown">
                            <a href="#"> <span class="glyphicon glyphicon-phone-alt"></span>&nbsp; Fale Conosco</a>
                            <ul class="dropdown">
                                <li class="active"><a href="#">Contato</a></li>
                                <li class="active"><a href="localizacao.jsp">Localiza��o</a></li>
                            </ul>
                        </li>
                        <li class="divider"></li>

                    </ul>


                </section>
            </nav>

        </div>

        <div id="pesquisa">

            
                <fieldset>
                    <legend>Pesquisar Im�vel</legend>
<form method="post" action="venda.jsp?action=pesquisa" >

                                          
                        <label><b>Cidade:</b>
                            <select name="cidade">
                                <option value="" >Selecione</option>
                                <option value="%">Todas</option>
                                <option value="aguas claras">�guas Claras</option>
                                 <option value="brasilia">Bras�lia</option>
                                <option value="brazlandia">Brazl�ndia</option>
                                <option value="candangolandia">Candangol�ndia</option>
                                <option value="ceilandia">Ceil�ndia</option>
                                <option value="cruzeiro">Cruzeiro</option>
                                <option value="fercal">Fercal</option>
                                <option value="gama">Gama</option>
                                <option value="guara">Guar�</option>
                                <option value="itapoa">Itapo�</option>
                                <option value="jardim botanico">Jardim Bot�nico</option>
                                <option value="lago norte">Lago Norte</option>
                                <option value="lago sul">Lago Sul</option>
                                <option value="nucleo bandeirante">N�cleo Bandeirante</option>
                                <option value="paranoa">Parano�</option>
                                <option value="park way">Park Way</option>
                                <option value="planaltina">Planaltina</option>
                                <option value="recanto das emas">Recanto das Emas</option>
                                <option value="riacho fundo i">Riacho Fundo I</option>
                                <option value="riacho fundo ii">Riacho Fundo II</option>
                                <option value="samambaia">Samambaia</option>
                                <option value="santa maria">Santa Maria</option>
                                <option value="sao sebastiao">S�o Sebasti�o</option>
                                <option value="scia">SCIA</option>
                                <option value="sia">SIA</option>
                                <option value="%sobradinho%">Sobradinho</option>
                                <option value="sudoeste">Sudoeste</option>
                                <option value="taguatinga">Taguatinga</option>
                                <option value="varjao">Varj�o</option>
                                <option value="vicente pires">Vicente Pires</option>
                                
                            </select>
                        </label>
                  


                                           
                        <label><b>Tipo:</b>
                            <select name="tipo">
                                <option value="" >Selecione</option>
                                <option value="%">Todas</option>
                                <option value="apartamento">Apartamento</option>
                                <option value="casa">Casa</option>
                                <option value="chacara">Ch�cara</option>
                                <option value="condominio">Condominio</option>
                                <option value="cobertura">Cobertura</option>
                                <option value="kitnet">Kitnet</option>
                                <option value="loja">Loja</option>
                                <option value="salao">Sal�o</option>                                
                                <option value="sitio">S�tio</option>
                                <option value="sobrado">Sobrado</option>
                                <option value="terreno">Terreno</option>
                            </select>
                        </label>
                              
                        <label><b>Pre�o:</b><br>
                           <div  class="large-6 columns"> 
                            de: <select name="inicio">
                                <option value="0.0">0</option>
                                <option value="50000.0">50 mil</option>
                                <option value="100000.0">100 mil</option>
                                <option value="150000.0">150 mil</option>
                                <option value="200000.0">200 mil</option>
                                <option value="300000.0">300 mil</option>
                                <option value="400000.0">400 mil</option>
                                <option value="500000.0">500 mil</option>
                                <option value="800000.0">800 mil</option>                                
                                <option value="1000000.0">1 milh�o</option>
                            </select>
                            </div>
                            <div  class="large-6 columns"> 
                            at�:<select name="fim">
                                <option value="1000000000000000000.0"></option>
                                <option value="50000.0">50 mil</option>
                                <option value="100000.0">100 mil</option>
                                <option value="150000.0">150 mil</option>
                                <option value="200000.0">200 mil</option>
                                <option value="300000.0">300 mil</option>
                                <option value="400000.0">400 mil</option>
                                <option value="500000.0">500 mil</option>
                                <option value="800000.0">800 mil</option>                                
                                <option value="1000000.0">1 milh�o</option>
                                <option value="2000000.0">2 milh�es</option>
                                <option value="3000000.0">3 milh�es</option>
                                
                            </select>
                           </div>
                        </label>
                    
    
    
    <input   type="submit" class="button" value="Pesquisar" />

                   

     </form>
                </fieldset>
       

        </div>

        <div id="conteudo">

            <fieldset>
                <legend>Contato</legend>

                <h4 align="center">Solicite a avalia��o do seu im�vel</h4>

                <p>Talvez a mais importante pergunta do propriet�rio seja: <b>"Qual o valor do meu im�vel?"</b></p>

                <p>Como voc� pode obter uma avalia��o de seu im�vel sem compromisso?
                    <br> Basta entrar em contato e faremos <b>Gr�tis</b> a avalia��o do seu im�vel.
                    Estamos � disposi��o para sanar d�vidas.
                </p>
                <div id="textocontato">
                <fieldset>
                    <legend> <span class="glyphicon glyphicon-user"></span> Corretor Davy Galv�o &nbsp CRECI: 18.701</legend>

                    <span class="glyphicon glyphicon-phone"></span>&nbsp;(61) 8584-2966 (Oi)
                    <br><span class="glyphicon glyphicon-phone"></span>&nbsp;(61) 9104-7415 (Claro)
                </fieldset>
                    </div>
                <div id="textocontato">
                <fieldset>
                    <legend><span class="glyphicon glyphicon-user"></span> Corretor Luiz Carlos &nbsp CRECI: 10959/8� REGI�O</legend>

                    <span class="glyphicon glyphicon-phone"></span>&nbsp;(61) 8624-6210
                    <br><span class="glyphicon glyphicon-phone"></span>&nbsp;(61) 3359-0156
                    <br><span class="glyphicon glyphicon-phone"></span>&nbsp;(61) 8418-4557
                    <br><span class="glyphicon glyphicon-phone"></span>&nbsp;(61) 9631-7958
                    <br><span class="glyphicon glyphicon-phone"></span>&nbsp;(61) 9100-4013

                </fieldset>
</div>

        </div>


        <div id='rodapeContato' align='center'>
            <fieldset>

            <rodape>
                QS 07 Lote 01 - EPCT - 
                Taguatinga, Bras�lia/DF - 
                CEP: 71966-700 - 
                emimoveis@gmail.com
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