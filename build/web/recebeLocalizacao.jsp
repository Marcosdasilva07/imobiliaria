<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="controller.Localizacao, model.LocalizacaoDAO" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
         <%
             
             
              
             
            try{
                String action = request.getParameter("action");
                if (action.equalsIgnoreCase("cadastrar")){
                   
                    Localizacao l = new Localizacao();
                    l.setEndereco(request.getParameter("endereco"));
                    l.setCep(request.getParameter("cep")); 
                    l.setCidade(request.getParameter("cidade"));
                   l.setBairro(request.getParameter("bairro"));
                   l.setUf(request.getParameter("uf"));
                   l.setNumero(Integer.parseInt(request.getParameter("numero")));
                LocalizacaoDAO ld = new LocalizacaoDAO();
                    try{
                       ld.cadastrar(l);

                        l =  ld.buscarIdLocalizacao();
                       
                        request.getRequestDispatcher("cadastrarImovel.jsp");
                        out.print("<script language='javascript'>");
                    out.print("alert('Localização Cadastrada com Sucesso!!');");
                    out.print("location.href='cadastrarImovel.jsp?idLocalizacao="+l.getIdLocalizacao()+"';");
                    out.print("</script>");

                        }catch (Exception ex){
                             out.print("ERRO!!"+ex.getMessage());
                        }
                    
                    
                    
                      }else if(action.equalsIgnoreCase("excluir")){
                    Integer id = Integer.parseInt(request.getParameter("idLocalizacao"));
                    LocalizacaoDAO ld = new LocalizacaoDAO();
                    Localizacao l = ld.buscarId(id);
                    if(id>0){
                        ld.excluir(l);
                        request.getRequestDispatcher("ImoveisCadastrados.jsp").forward(request, response);
                    }
                   }else if(action.equalsIgnoreCase("editar")){
                        Integer idImovel = new Integer(request.getParameter("idImovel"));
                       Localizacao l = new Localizacao();
                       l.setIdLocalizacao( new Integer(request.getParameter("idLocalizacao")));
                        l.setCep(request.getParameter("cep"));
                        l.setEndereco(request.getParameter("endereco"));
                        l.setBairro(request.getParameter("bairro"));
                        l.setNumero(new Integer(request.getParameter("numero")));
                        l.setCidade(request.getParameter("cidade"));
                        l.setUf(request.getParameter("uf"));
                        
                        
                       LocalizacaoDAO ld = new LocalizacaoDAO();
                       try{
                           ld.editar(l);
                        
                        
                           out.print("<script language='javascript'>");
                    out.print("alert('Localização Alterada com Sucesso!!');");
                    out.print("location.href='editarImovel.jsp?idImovel="+idImovel+"';");
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
