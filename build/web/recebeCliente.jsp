<%@page import="model.EnderecoDAO"%>
<%@page import="controller.Endereco"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="controller.Cliente, model.ClienteDAO" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
   "http://www.w3.org/TR/html4/loose.dtd">

<html>
   <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tratar Cliente</title>
    </head>
    <body>
        <%

            try{
                String action = request.getParameter("action");
                if (action.equalsIgnoreCase("cadastrar")){
                    Endereco e = new Endereco();
                    Cliente c = new Cliente();
                    c.setNome(request.getParameter("nome"));
                    c.setRg(request.getParameter("rg"));
                    c.setCpfCnpj(request.getParameter("cpf"));
                   c.setTelefone(request.getParameter("telefone"));
                   c.setCelular1(request.getParameter("celular1"));
                   c.setCelular2(request.getParameter("celular2"));
                   c.setDataNasc(request.getParameter("dataNasc"));
                   c.setEmail(request.getParameter("email"));
                   c.setEstadoCivil(request.getParameter("estadoCivil"));
                   c.setProfissao(request.getParameter("profissao"));
                   c.setEmpresaTrabalho(request.getParameter("empresaTrabalho"));

                   e.setIdEndereco(Integer.parseInt(request.getParameter("idEndereco")));
                        c.setEndereco(e);

                    
                   ClienteDAO cd = new ClienteDAO();
                    try{
                       cd.cadastrar(c);

                        request.getRequestDispatcher("clientesCadastrados.jsp");
                        out.print("<script language='javascript'>");
                    out.print("alert('Cliente Cadastrado com Sucesso!!');");
                    out.print("location.href='clientesCadastrados.jsp';");
                    out.print("</script>");

                        }catch (Exception ex){
                             out.print("ERRO ao cadastrar!!"+ex.getMessage());
                        }



                      }else if(action.equalsIgnoreCase("excluir")){
                          
                    Integer id = Integer.parseInt(request.getParameter("idCliente"));
                    Integer idEndereco = Integer.parseInt(request.getParameter("idEndereco"));
                    ClienteDAO cd = new ClienteDAO();
                    Cliente c = cd.buscarId(id);
                    EnderecoDAO ed = new EnderecoDAO();
                    Endereco e =  ed.buscarId(idEndereco);
                    if(id>0 && idEndereco>0 ){
                        ed.excluir(e);
                        cd.excluir(c);
                        
                        out.print("<script language='javascript'>");
                    out.print("alert('Cliente Excluído!!');");
                    out.print("location.href='clientesCadastrados.jsp';");
                    out.print("</script>");
                        
                    }
                   }else if(action.equalsIgnoreCase("editar")){
                       Cliente c = new Cliente();
                       Endereco e = new Endereco();
                       c.setIdCliente( new Integer(request.getParameter("idCliente")));
                        c.setNome(request.getParameter("nome"));
                       c.setRg(request.getParameter("rg"));
                     c.setCpfCnpj(request.getParameter("cpf"));
                     c.setTelefone(request.getParameter("telefone"));
                     c.setCelular1(request.getParameter("celular1"));
                     c.setCelular2(request.getParameter("celular2"));
                     c.setDataNasc(request.getParameter("dataNasc"));
                     c.setEmail(request.getParameter("email"));
                     c.setEstadoCivil(request.getParameter("estadoCivil"));
                     c.setProfissao(request.getParameter("profissao"));
                     c.setEmpresaTrabalho(request.getParameter("empresaTrabalho"));

                     e.setIdEndereco(Integer.parseInt(request.getParameter("idEndereco")));
                        c.setEndereco(e);
                       ClienteDAO cd = new ClienteDAO();
                       try{
                           cd.editar(c);
                           
                           out.print("<script language='javascript'>");
                    out.print("alert('Cliente Alterado com Sucesso!!');");
                    out.print("location.href='clientesCadastrados.jsp';");
                    out.print("</script>");
                    
                        }catch( Exception ex){
                            out.print("ERRO ao editar!!"+ex.getMessage());
                            }




                }
                }catch (NullPointerException npe){
                      out.print("ERRO no código completo!!"+npe.getMessage());
                 }

%>
    </body>
</html>
