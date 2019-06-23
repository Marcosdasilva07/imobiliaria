<%@page import="controller.Perfil"%>
<%@page import="model.EnderecoDAO"%>
<%@page import="model.FuncionarioDAO"%>
<%@page import="controller.Funcionario"%>
<%@page import="controller.Endereco"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
   <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
    </head>
    <body>
        <%

            try{
                String action = request.getParameter("action");
                if (action.equalsIgnoreCase("cadastrar")){
                    Endereco e = new Endereco();
                    Perfil p = new Perfil();
                    Funcionario f = new Funcionario();
                    f.setNome(request.getParameter("nome"));
                    f.setRg(request.getParameter("rg"));
                    f.setCpf(request.getParameter("cpf"));
                   f.setTelefone(request.getParameter("telefone"));
                   f.setDataNasc(request.getParameter("dataNasc"));
                   f.setEmail(request.getParameter("email"));
                   f.setEstadoCivil(request.getParameter("estadoCivil"));
                   f.setLogin(request.getParameter("login"));
                   f.setSenha(request.getParameter("senha"));
                  


                   e.setIdEndereco(Integer.parseInt(request.getParameter("idEndereco")));
                        f.setEndereco(e);
                   p.setIdPerfil(Integer.parseInt(request.getParameter("idPerfil")));
                        f.setPerfil(p);

                   FuncionarioDAO fd = new FuncionarioDAO();
                    try{
                       fd.cadastrar(f);

                        request.getRequestDispatcher("funcionariosCadastrados.jsp");
                        out.print("<script language='javascript'>");
                    out.print("alert('Funcionário Cadastrado com Sucesso!!');");
                    out.print("location.href='funcionariosCadastrados.jsp';");
                    out.print("</script>");

                        }catch (Exception ex){
                             out.print("ERRO!!"+ex.getMessage());
                        }



                      }else if(action.equalsIgnoreCase("excluir")){
                    Integer id = Integer.parseInt(request.getParameter("idFuncionario"));
                    Integer idEndereco = Integer.parseInt(request.getParameter("idEndereco"));
                    FuncionarioDAO fd = new FuncionarioDAO();
                    Funcionario f = fd.buscarId(id);
                    EnderecoDAO ed = new EnderecoDAO();
                    Endereco e =  ed.buscarId(idEndereco);
                    if(id>0 && idEndereco>0){
                        fd.excluir(f);
                        ed.excluir(e);
                         out.print("<script language='javascript'>");
                    out.print("alert('Funcionário Excluído!!');");
                    out.print("location.href='funcionariosCadastrados.jsp';");
                    out.print("</script>");
                       
                    }
                   }else if(action.equalsIgnoreCase("editar")){
                        Endereco e = new Endereco();
                    Funcionario f = new Funcionario();
                    Perfil p = new Perfil();
                    
                    f.setIdFuncionario( new Integer (request.getParameter("idFuncionario")));
                    f.setNome(request.getParameter("nome"));
                    f.setRg(request.getParameter("rg"));
                    f.setCpf(request.getParameter("cpf"));
                   f.setTelefone(request.getParameter("telefone"));
                   f.setDataNasc(request.getParameter("dataNasc"));
                   f.setEmail(request.getParameter("email"));
                   f.setEstadoCivil(request.getParameter("estadoCivil"));
                   f.setLogin(request.getParameter("login"));
                   f.setSenha(request.getParameter("senha"));
                   e.setIdEndereco(Integer.parseInt(request.getParameter("idEndereco")));
                        f.setEndereco(e);
                        p.setIdPerfil(Integer.parseInt(request.getParameter("idPerfil")));
                        f.setPerfil(p);


                   FuncionarioDAO fd = new FuncionarioDAO();
                       try{
                           fd.editar(f);
                          
                           out.print("<script language='javascript'>");
                    out.print("alert('Funcionário Alterado com Sucesso!!');");
                    out.print("location.href='funcionariosCadastrados.jsp';");
                    out.print("</script>");
                           
                        }catch( Exception ex){
                            out.print("ERRO no banco!!"+ex.getMessage());
                            }




                }
                }catch (NullPointerException npe){
                      out.print("ERRO!!"+npe.getMessage());
                 }

%>
    </body>
</html>
