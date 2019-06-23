<%@page import="controller.Endereco"%>
<%@page import="model.EnderecoDAO"%>
<%@page import="controller.Cliente"%>
<%@page import="model.ClienteDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html class="no-js" lang="en" >

    <head>
        <meta charset="utf-8">
        <!-- If you delete this meta tag World War Z will become a reality -->
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Visualizar Cliente</title>

        <link href="css/bootstrap.min.css" rel="stylesheet"> <!-- Framework dos icones -->
        <link rel="stylesheet" href="css/normalize.css">
        <link rel="stylesheet" href="css/foundation.css">
        <link href="css/estilo.css" rel="stylesheet" type="text/css"/>


        <script src="js/vendor/modernizr.js"></script>
 <title>Visualizar Cliente</title>
    </head>
     <body>
        <script src="javascript/jquery.js"></script>
        <script src="javascript/jquery-ui.js"></script>

      
        <div id="topo">
            <img src="imagem\topo.jpg">
        </div>

        <%@include file="validarLogin.jsp" %>
        

  <%         try{
                    Integer id = new Integer (request.getParameter("idCliente"));
                    ClienteDAO cd = new ClienteDAO();
                    Cliente c =  cd.buscarId(id);
                    EnderecoDAO ed = new EnderecoDAO();
                    Endereco e = ed.buscarId(c.getEndereco().getIdEndereco());
                    
                   %>


        <div id="visualizar">
          <table>
            <TR>
                <TD ROWSPAN=9>CLIENTE PROPRIETÁRIO</TD>


                <TD><b>ID Cliente:</b></TD>
                <TD><%=c.getIdCliente()%></TD>
                <TD><b>Nome:</b></TD>
                <TD><%=c.getNome()%></TD>
            </TR>
            <TR>
                <TD><b>RG:</b></TD>
                <TD><%=c.getRg()%></TD>
                <TD><b>CPF/CNPJ:</b></TD>
                <TD><%=c.getCpfCnpj()%></TD>
            </TR>
            <TR>
                <TD><b>Telefone:</b></TD>
                <TD><%=c.getTelefone()%></TD>
                <TD><b>Celular1:</b></TD>
                <TD><%=c.getCelular1()%></TD>
            </TR>
            <TR>
                <TD><b>Celular2:</b></TD>
                <TD><%=c.getCelular2()%></TD>
                <TD><b>E-mail:</b></TD>
                <TD><%=c.getEmail()%></TD>
            </TR>
            <TR>
                <TD><b>Data de Nascimento:</b></TD>
                <TD><%=c.getDataNasc()%></TD>
                <TD><b>Estado Civil:</b></TD>
                <TD><%=c.getEstadoCivil()%></TD>
            </TR>
            <TR>
                <TD><b>Profissão:</b></TD>
                <TD><%=c.getProfissao()%></TD>
                <TD><b>Empresa Trabalho:</b></TD>
                <TD><%=c.getEmpresaTrabalho()%></TD>
            </TR>
             <TR>
                <TD><b>ID Endereço:</b></TD>
                <TD><%=c.getEndereco().getIdEndereco()%></TD>
                <TD><b>Endereço:</b></TD>
                <TD><%=e.getEndereco()%></TD>
            </TR>
             <TR>
                <TD><b>Bairro:</b></TD>
                <TD><%=e.getBairro()%></TD>
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
