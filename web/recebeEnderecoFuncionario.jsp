<%@page import="controller.Endereco, model.EnderecoDAO" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tratar Endereço do Funcionário</title>
    </head>
    <body>
         <%
            try{
                String action = request.getParameter("action");
                if (action.equalsIgnoreCase("cadastrar")){
                   
                    Endereco e = new Endereco();
                    e.setEndereco(request.getParameter("endereco"));
                    e.setCep(request.getParameter("cep")); 
                    e.setCidade(request.getParameter("cidade"));
                   e.setBairro(request.getParameter("bairro"));
                   e.setUf(request.getParameter("uf"));
                   e.setNumero(Integer.parseInt(request.getParameter("numero")));
                EnderecoDAO ed = new EnderecoDAO();
                    try{
                       ed.cadastrar(e);
                        e =  ed.buscarIdEndereco();
                       
                        request.getRequestDispatcher("cadastrarFuncionario.jsp");
                        out.print("<script language='javascript'>");
                    out.print("alert('Endereço Cadastrado com Sucesso!!');");
                    out.print("location.href='cadastrarFuncionario.jsp?idEndereco="+e.getIdEndereco()+"';");
                    out.print("</script>");

                        }catch (Exception ex){
                             out.print("ERRO!!"+ex.getMessage());
                        }
                    
                    
                    
                      }else if(action.equalsIgnoreCase("excluir")){
                    Integer id = Integer.parseInt(request.getParameter("idEndereco"));
                    EnderecoDAO ed = new EnderecoDAO();
                    Endereco e = ed.buscarId(id);
                    if(id>0){
                        ed.excluir(e);
                        request.getRequestDispatcher("funcionariosCadastrados.jsp").forward(request, response);
                    }
                   }else if(action.equalsIgnoreCase("editar")){
                       Integer idFuncionario = new Integer(request.getParameter("idFuncionario"));
                       Endereco e = new Endereco();
                       
                       e.setIdEndereco( new Integer(request.getParameter("idEndereco")));
                        e.setCep(request.getParameter("cep"));
                        e.setEndereco(request.getParameter("endereco"));
                        e.setBairro(request.getParameter("bairro"));
                        e.setNumero(new Integer(request.getParameter("numero")));
                        e.setCidade(request.getParameter("cidade"));
                        e.setUf(request.getParameter("uf"));
                        
                        
                       EnderecoDAO ed = new EnderecoDAO();
                       try{
                           ed.editar(e);
                           request.getRequestDispatcher("editarFuncionario.jsp?idFuncionario="+idFuncionario);      
                          
                                 out.print("<script language='javascript'>");
                    out.print("alert('Endereço Alterado com Sucesso!!');");
                    out.print("location.href='editarFuncionario.jsp?idFuncionario="+idFuncionario+"';");
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
