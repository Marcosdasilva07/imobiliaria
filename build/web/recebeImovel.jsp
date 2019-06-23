<%@page import="model.LocalizacaoDAO"%>
<%@page import="model.ImovelDAO"%>
<%@page import="controller.Imovel"%>
<%@page import="controller.Localizacao"%>
<%@page import="controller.Cliente"%>
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
                    Cliente c = new Cliente();
                    Localizacao l = new Localizacao();
                    Imovel i = new Imovel();
                    i.setAreaUtil(Double.parseDouble(request.getParameter("areaUtil")));
                    i.setNumQuartos(Integer.parseInt(request.getParameter("numQuartos")));
                    i.setNumBanheiros(Integer.parseInt(request.getParameter("numBanheiros")));
                   i.setVagasGaragem(Integer.parseInt(request.getParameter("vagasGaragem")));
                   i.setNumSuites(Integer.parseInt(request.getParameter("numSuites")));
                   i.setAreaTerreno(Double.parseDouble(request.getParameter("areaTerreno")));
                   i.setAreaPrivativa(Double.parseDouble(request.getParameter("areaPrivativa")));
                   i.setTipoImovel(request.getParameter("tipoImovel"));
                   i.setMais(request.getParameter("mais"));
                   

                   l.setIdLocalizacao(Integer.parseInt(request.getParameter("idLocalizacao")));
                        i.setLocalizacao(l);
                   c.setIdCliente(Integer.parseInt(request.getParameter("idCliente")));
                        i.setCliente(c);


                   ImovelDAO id = new ImovelDAO();
                    try{
                       id.cadastrar(i);

                        request.getRequestDispatcher("cadastrarAnuncio.jsp");
                        out.print("<script language='javascript'>");
                    out.print("alert('Imóvel Cadastrado com Sucesso!!');");
                    out.print("location.href='imoveisCadastrados.jsp';");
                    out.print("</script>");

                        }catch (Exception ex){
                             out.print("ERRO!!"+ex.getMessage());
                        }



                      }else if(action.equalsIgnoreCase("excluir")){
                    Integer id = Integer.parseInt(request.getParameter("idImovel"));
                    Integer idLocalizacao = Integer.parseInt(request.getParameter("idLocalizacao"));
                    ImovelDAO imd = new ImovelDAO();
                    Imovel i = imd.buscarId(id);
                     LocalizacaoDAO ld = new LocalizacaoDAO();
                    Localizacao l =  ld.buscarId(idLocalizacao);
                    if(id>0 && idLocalizacao>0){
                        ld.excluir(l);
                        imd.excluir(i);
                        
                         out.print("<script language='javascript'>");
                    out.print("alert('Imóvel Excluído!!');");
                    out.print("location.href='imoveisCadastrados.jsp';");
                    out.print("</script>");
                       
                    }
                   }else if(action.equalsIgnoreCase("editar")){
                       Imovel i = new Imovel();
                       Cliente c = new Cliente();
                    Localizacao l = new Localizacao();
                       i.setIdImovel( new Integer(request.getParameter("idImovel")));
                        i.setAreaUtil(Double.parseDouble(request.getParameter("areaUtil")));
                    i.setNumQuartos(Integer.parseInt(request.getParameter("numQuartos")));
                    i.setNumBanheiros(Integer.parseInt(request.getParameter("numBanheiros")));
                   i.setVagasGaragem(Integer.parseInt(request.getParameter("vagasGaragem")));
                   i.setNumSuites(Integer.parseInt(request.getParameter("numSuites")));
                  i.setAreaTerreno(Double.parseDouble(request.getParameter("areaTerreno")));
                   i.setAreaPrivativa(Double.parseDouble(request.getParameter("areaPrivativa")));
                   i.setTipoImovel(request.getParameter("tipoImovel"));
                   i.setMais(request.getParameter("mais"));
                   
                   l.setIdLocalizacao(Integer.parseInt(request.getParameter("idLocalizacao")));
                        i.setLocalizacao(l);
                   c.setIdCliente(Integer.parseInt(request.getParameter("idCliente")));
                        i.setCliente(c);


                       ImovelDAO id = new ImovelDAO();
                       try{
                           id.editar(i);
                          
                           out.print("<script language='javascript'>");
                    out.print("alert('Imóvel Alterado com Sucesso!!');");
                    out.print("location.href='imoveisCadastrados.jsp';");
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
