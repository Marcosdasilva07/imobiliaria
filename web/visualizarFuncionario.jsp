<%@page import="controller.Perfil"%>
<%@page import="model.PerfilDAO"%>
<%@page import="controller.Endereco"%>
<%@page import="model.EnderecoDAO"%>
<%@page import="controller.Funcionario"%>
<%@page import="model.FuncionarioDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html class="no-js" lang="en" >

    <head>
        <meta charset="utf-8">
        <!-- If you delete this meta tag World War Z will become a reality -->
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Vender</title>

        <link href="css/bootstrap.min.css" rel="stylesheet"> <!-- Framework dos icones -->
        <link rel="stylesheet" href="css/normalize.css">
        <link rel="stylesheet" href="css/foundation.css">
        <link href="css/estilo.css" rel="stylesheet" type="text/css"/>


        <script src="js/vendor/modernizr.js"></script>
 <title>Visualizar Funcionário</title>
    </head>
     <body>
        <script src="javascript/jquery.js"></script>
        <script src="javascript/jquery-ui.js"></script>

      
        <div id="topo">
            <img src="imagem\topo.jpg">
        </div>

       <%@include file="validarLogin.jsp" %>

  <%         try{
                    Integer id = new Integer (request.getParameter("idFuncionario"));
                    FuncionarioDAO fd = new FuncionarioDAO();
                    Funcionario f =  fd.buscarId(id);
                    EnderecoDAO ed = new EnderecoDAO();
                    Endereco e = ed.buscarId(f.getEndereco().getIdEndereco());
                    PerfilDAO pd = new PerfilDAO();
                    Perfil pf = pd.buscarId(f.getPerfil().getIdPerfil());
                    
                   %>


        <div id="visualizar">
          <table>
            <TR>
                <TD ROWSPAN=9>Funcionário</TD>


                <TD><b>ID Funcionário:</b></TD>
                <TD><%=f.getIdFuncionario()%></TD>
                <TD><b>Nome:</b></TD>
                <TD><%=f.getNome()%></TD>
            </TR>
            <TR>
                <TD><b>RG:</b></TD>
                <TD><%=f.getRg()%></TD>
                <TD><b>CPF:</b></TD>
                <TD><%=f.getCpf()%></TD>
            </TR>
            <TR>
                <TD><b>Telefone:</b></TD>
                <TD><%=f.getTelefone()%></TD>
                <TD><b>E-mail:</b></TD>
                <TD><%=f.getEmail()%></TD>
            </TR>            
            <TR>
                <TD><b>Data de Nascimento:</b></TD>
                <TD><%=f.getDataNasc()%></TD>
                <TD><b>Estado Civil:</b></TD>
                <TD><%=f.getEstadoCivil()%></TD>
            </TR>
            <TR>
                <TD><b>Login:</b></TD>
                <TD><%=f.getLogin()%></TD>
                <TD><b>Perfil</b></TD>
                <TD><%=pf.getPerfil()%></TD>
            </TR>
             <TR>
                  <TD><b>ID Endereço:</b></TD>
                <TD><%=f.getEndereco().getIdEndereco()%></TD>
                <TD><b>Endereço:</b></TD>
                <TD><%=e.getEndereco()%></TD>
                
            </TR>
            <TR>
                <TD><b>Bairro:</b></TD>
                <TD><%=e.getBairro()%></TD>
                <TD><b>CEP:</b></TD>
                <TD><%=e.getCep()%></TD>
                
            </TR>
             <TR>
                 <TD><b>Cidade:</b></TD>
                <TD><%=e.getCidade()%></TD>
                <TD><b>UF:</b></TD>
                <TD><%=e.getUf()%></TD>
              </TR>
            <TR>
                  <TD><b>Número:</b></TD>
                <TD><%=e.getNumero()%></TD>
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
