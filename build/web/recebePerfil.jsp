<%@page import="model.PerfilDAO"%>
<%@page import="controller.Perfil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tratar Perfil</title>
    </head>
    <body>
         <%

            try{
                String action = request.getParameter("action");
                if (action.equalsIgnoreCase("cadastrar")){
                    Perfil p = new Perfil();
                    p.setPerfil(request.getParameter("perfil"));
                   
                   PerfilDAO pd = new PerfilDAO();
                    try{
                       pd.cadastrar(p);

                        request.getRequestDispatcher("perfisCadastrados.jsp");
                        out.print("<script language='javascript'>");
                    out.print("alert('Perfil Inserido!!');");
                    out.print("location.href='perfisCadastrados.jsp';");
                    out.print("</script>");

                        }catch (Exception ex){
                             out.print("ERRO!!"+ex.getMessage());
                        }


                      }else if(action.equalsIgnoreCase("excluir")){
                    Integer id = Integer.parseInt(request.getParameter("idPerfil"));
                    PerfilDAO pd = new PerfilDAO();
                    Perfil p = pd.buscarId(id);
                    if(id>0){
                        pd.excluir(p);
                        
                         out.print("<script language='javascript'>");
                    out.print("alert('Perfil Excluído!!');");
                    out.print("location.href='perfisCadastrados.jsp';");
                    out.print("</script>");
                       
                    }
                   }else if(action.equalsIgnoreCase("editar")){
                       
                    Perfil p = new Perfil();
                    
                    p.setIdPerfil( new Integer (request.getParameter("idPerfil")));
                    p.setPerfil(request.getParameter("perfil"));
                   
                   PerfilDAO pd = new PerfilDAO();
                       try{
                           pd.editar(p);
                          
                           out.print("<script language='javascript'>");
                    out.print("alert('Perfil Alterado!!');");
                    out.print("location.href='perfisCadastrados.jsp';");
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
