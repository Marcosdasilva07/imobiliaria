<%@page import="controller.Imovel"%>
<%@page import="controller.Funcionario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="controller.Anuncio, model.AnuncioDAO" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Tratar Anúncio</title>
    </head>
    <body>
        <%

            try{
                String action = request.getParameter("action");
                if (action.equalsIgnoreCase("cadastrar")){
                    Anuncio a = new Anuncio();                    
                    Funcionario f = new Funcionario();
                    Imovel i =new Imovel();
                    a.setValor(Double.parseDouble(request.getParameter("valor")));
                    a.setValorCondominio(Double.parseDouble(request.getParameter("valorCondominio")));
                    a.setAceitaFinanciamento(request.getParameter("aceitaFinanciamento"));
                   a.setTipoAnuncio(request.getParameter("tipoAnuncio"));                  
                   a.setImagem1(request.getParameter("imagem1"));
                   a.setImagem2(request.getParameter("imagem2"));
                   a.setImagem3(request.getParameter("imagem3"));
                   a.setImagem4(request.getParameter("imagem4"));
                   
                   
                   f.setIdFuncionario(Integer.parseInt(request.getParameter("idFuncionario")));
                        a.setFuncionario(f);
                   i.setIdImovel(Integer.parseInt(request.getParameter("idImovel")));
                        a.setImovel(i);


                   AnuncioDAO ad = new AnuncioDAO();
                    try{
                       ad.cadastrar(a);

                        request.getRequestDispatcher("anunciosCadastrados.jsp");
                        out.print("<script language='javascript'>");
                    out.print("alert('Anúncio Cadastrado com Sucesso!!');");
                    out.print("location.href='anunciosCadastrados.jsp';");
                    out.print("</script>");

                        }catch (Exception ex){
                             out.print("ERRO!!"+ex.getMessage());
                        }



                      }else if(action.equalsIgnoreCase("excluir")){
                    Integer id = Integer.parseInt(request.getParameter("idAnuncio"));
                    AnuncioDAO ad = new AnuncioDAO();
                    Anuncio a = ad.buscarId(id);
                    if(id>0){
                        ad.excluir(a);
                        
                         out.print("<script language='javascript'>");
                    out.print("alert('Anúncio Excluído!!');");
                    out.print("location.href='anunciosCadastrados.jsp';");
                    out.print("</script>");
                       
                    }
                   }else if(action.equalsIgnoreCase("editar")){
                       Anuncio a = new Anuncio();
                       a.setIdAnuncio( new Integer(request.getParameter("idAnuncio")));
                       
                 
                    Funcionario f = new Funcionario();
                    Imovel i = new Imovel();
                    a.setValor(Double.parseDouble(request.getParameter("valor")));
                    a.setValorCondominio(Double.parseDouble(request.getParameter("valorCondominio")));
                    a.setAceitaFinanciamento(request.getParameter("aceitaFinanciamento"));
                   a.setTipoAnuncio(request.getParameter("tipoAnuncio"));
                   
                   a.setImagem1(request.getParameter("imagem1"));
                   a.setImagem2(request.getParameter("imagem2"));
                   a.setImagem3(request.getParameter("imagem3"));
                   a.setImagem4(request.getParameter("imagem4"));
                   
                   
                   f.setIdFuncionario(Integer.parseInt(request.getParameter("idFuncionario")));
                        a.setFuncionario(f);
                         i.setIdImovel(Integer.parseInt(request.getParameter("idImovel")));
                        a.setImovel(i);

                       AnuncioDAO ad = new AnuncioDAO();
                       try{
                           ad.editar(a);
                          out.print("<script language='javascript'>");
                    out.print("alert('Anúncio Alterado com Sucesso!!');");
                    out.print("location.href='anunciosCadastrados.jsp';");
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
