<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Exclui Imóvel</title>
    </head>
    <body>
         <%
                    int idImovel= Integer.parseInt(request.getParameter("idImovel"));
                    int idLocalizacao= Integer.parseInt(request.getParameter("idLocalizacao"));
        %>
        <script type="text/javascript" language="javascript">
            confirmar = window.confirm("Tem certeza que deseja excluir?");
            if (confirmar==true){
                location.href = "recebeImovel.jsp?action=excluir&idImovel=<%=idImovel%>&idLocalizacao=<%=idLocalizacao%>";
            } else if (confirmar==false){
                window.alert("Exclusão cancelada!");
                location.href = "imoveisCadastrados.jsp";
            }
        </script>
    </body>
</html>
