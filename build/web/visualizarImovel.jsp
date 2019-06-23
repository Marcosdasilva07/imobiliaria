<%@page import="controller.Localizacao"%>
<%@page import="model.LocalizacaoDAO"%>
<%@page import="controller.Imovel"%>
<%@page import="model.ImovelDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="en" >

    <head>
        <meta charset="utf-8">
        <!-- If you delete this meta tag World War Z will become a reality -->
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Visualizar Imóvel</title>

        <link href="css/bootstrap.min.css" rel="stylesheet"> <!-- Framework dos icones -->
        <link rel="stylesheet" href="css/normalize.css">
        <link rel="stylesheet" href="css/foundation.css">
        <link href="css/estilo.css" rel="stylesheet" type="text/css"/>


        <script src="js/vendor/modernizr.js"></script>
 <title>Visualizar Imóvel</title>
    </head>
     <body>
        <script src="javascript/jquery.js"></script>
        <script src="javascript/jquery-ui.js"></script>

      
        <div id="topo">
            <img src="imagem\topo.jpg">
        </div>

        <%@include file="validarLogin.jsp" %>
        

  <%         try{
                    Integer idImovel = new Integer (request.getParameter("idImovel"));
                    ImovelDAO id = new ImovelDAO();
                    Imovel i =  id.buscarId(idImovel);
                    LocalizacaoDAO ld = new LocalizacaoDAO();
                    Localizacao l = ld.buscarId(i.getLocalizacao().getIdLocalizacao());
                    
                   %>


        <div id="visualizar">
          <table>
            <TR>
                <TD ROWSPAN=9>IMÓVEL</TD>

 
                <TD><b>ID Imóvel</b></TD>
                <TD><%=i.getIdImovel()%></TD>
                <TD><b>Área Útil:</b></TD>
                <TD><%=i.getAreaUtil()%></TD>
            </TR>
            <TR>
                <TD><b>Quantidade de Quartos:</b></TD>
                <TD><%=i.getNumQuartos()%></TD>
                <TD><b>Quantidade de banheiros:</b></TD>
                <TD><%=i.getNumBanheiros()%></TD>
            </TR>
            <TR>
                <TD><b>Quantidade de Suítes:</b></TD>
                <TD><%=i.getNumSuites()%></TD>
                <TD><b>Garagem:</b></TD>
                <TD><%=i.getVagasGaragem()%></TD>
            </TR>
             <TR>
                <TD><b>Tipo do Imóvel:</b></TD>
                <TD><%=i.getTipoImovel()%></TD>
                <TD><b>Informações Adicionais:</b></TD>
                <TD><%=i.getMais()%></TD>
            </TR>
             <TR>
                <TD><b>ID Localização:</b></TD>
                <TD><%=i.getLocalizacao().getIdLocalizacao()%></TD>
                <TD><b>Endereço:</b></TD>
                <TD><%=l.getEndereco()%></TD>
            </TR>
             <TR>
                <TD><b>CEP:</b></TD>
                <TD><%=l.getCep()%></TD>
                <TD><b>Cidade:</b></TD>
                <TD><%=l.getCidade()%></TD>
            </TR>
            <TR>
                <TD><b>Bairro:</b></TD>
                <TD><%=l.getBairro()%></TD>
                <TD><b>UF:</b></TD>
                <TD><%=l.getUf()%></TD>
            </TR>
            <TR>
                <TD><b>Número:</b></TD>
                <TD><%=l.getNumero()%></TD>
                <TD></TD>
                <TD></TD>
            </TR>
          
                    </table>


        </div>

                     <%

                    }catch (Exception e){
                        out.print("ERRO!"+e.getMessage());
                        }
%>

       

        <script src="js/vendor/jquery.js"></script>
        <script src="js/foundation.min.js"></script>
        <script>
            $(document).foundation();
        </script>
    </body>
</html>
