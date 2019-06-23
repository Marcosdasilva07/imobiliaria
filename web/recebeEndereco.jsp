<%@page import="java.util.List"%>
<%@page import="model.ClienteDAO"%>
<%@page import="controller.Cliente"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="controller.Endereco, model.EnderecoDAO" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tratar Endereço</title>
    </head>
    <body>
        <%          
             
            
             
            try{
                String action = request.getParameter("action");
                if (action.equalsIgnoreCase("cadastrar")){
                    EnderecoDAO ed = new EnderecoDAO();
                    Endereco e = new Endereco();
                    
                    e.setEndereco(request.getParameter("endereco"));
                    e.setCep(request.getParameter("cep")); 
                    e.setCidade(request.getParameter("cidade"));
                   e.setBairro(request.getParameter("bairro"));
                   e.setUf(request.getParameter("uf"));
                   e.setNumero(Integer.parseInt(request.getParameter("numero")));
             
                    try{
                       ed.cadastrar(e);
                       
              
                 e =  ed.buscarIdEndereco();
                     

                       
                        request.getRequestDispatcher("cadastrarCliente.jsp");
                        out.print("<script language='javascript'>");
                    out.print("alert('Endereço Cadastrado com Sucesso!!');");
                    out.print("location.href='cadastrarCliente.jsp?idEndereco="+e.getIdEndereco()+"';");
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
                        request.getRequestDispatcher("clientesCadastrados.jsp").forward(request, response);
                    }
                   }else if(action.equalsIgnoreCase("editar")){
                        Integer idCliente = new Integer(request.getParameter("idCliente"));
                       Endereco e = new Endereco();
                       
                      
                       e.setIdEndereco( new Integer(request.getParameter("idEndereco")));                        
                        e.setEndereco(request.getParameter("endereco"));
                    e.setCep(request.getParameter("cep")); 
                    e.setCidade(request.getParameter("cidade"));
                   e.setBairro(request.getParameter("bairro"));
                   e.setUf(request.getParameter("uf"));
                   e.setNumero(new Integer(request.getParameter("numero")));
                     
                      
                       EnderecoDAO ed = new EnderecoDAO();
                       try{
                           ed.editar(e);
                                
                                 out.print("<script language='javascript'>");
                    out.print("alert('Endereço Alterado com Sucesso!!');");
                    out.print("location.href='editarCliente.jsp?idCliente="+idCliente+"';");
                    out.print("</script>");
                                
                               
                        }catch( Exception ex){
                            out.print("ERRO no banco!!"+ex.getMessage());
                            } 
                    
                    
                    
                   
                }
                }catch (NullPointerException npe){
                      out.print("ERRO total!!"+npe.getMessage());
                 }
   
%>
    </body>
</html>
