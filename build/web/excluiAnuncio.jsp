<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Exclui Anúncio</title>
    </head>
    <body>
      
        <%
                    int idAnuncio = Integer.parseInt(request.getParameter("idAnuncio"));
        %>
        <script type="text/javascript" language="javascript">
            confirmar = window.confirm("Tem certeza que deseja excluir?");
            if (confirmar==true){
                location.href = "recebeAnuncio.jsp?action=excluir&idAnuncio=<%=idAnuncio%>";
            } else if (confirmar==false){
                window.alert("Exclusão cancelada!");
                location.href = "anunciosCadastrados.jsp";
            }
        </script>
    </body>
</html>
