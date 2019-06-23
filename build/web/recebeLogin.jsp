<%@page import="model.PerfilDAO"%>
<%@page import="controller.Perfil"%>
<%@page import="controller.Perfil"%>
<%@page import="model.FuncionarioDAO"%>
<%@page import="controller.Funcionario"%>
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
       session = request.getSession();
        String login = request.getParameter("login");
        String senha = request.getParameter("senha");

        

              FuncionarioDAO fd = new FuncionarioDAO();
              
              Funcionario f = fd.validaLogin(login, senha);
             
                

              if(f.getIdFuncionario() > 0){                         
                   session.setAttribute("login", login);
                    session.setAttribute("nome", f.getNome());
                   session.setAttribute("perfil", f.getPerfil().getPerfil());
                  
                  response.sendRedirect("anunciosCadastrados.jsp");
              } else {

                  out.print("<script language='javascript'>");
                    out.print("alert('Cadastro Inválido!');");
                    out.print("location.href='login.jsp';");
                    out.print("</script>");

              }

          

        %>
    </body>
</html>
