<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Exclui Cliente</title>
    </head>
    <body>
     
        <%
                    int idCliente= Integer.parseInt(request.getParameter("idCliente"));
                    int idEndereco= Integer.parseInt(request.getParameter("idEndereco"));
        %>
        <script type="text/javascript" language="javascript">
            confirmar = window.confirm("Tem certeza que deseja excluir?");
            if (confirmar==true){
                location.href = "recebeCliente.jsp?action=excluir&idCliente=<%=idCliente%>&idEndereco=<%=idEndereco%>";
            } else if (confirmar==false){
                window.alert("Exclusão cancelada!");
                location.href = "clientesCadastrados.jsp";
            }
        </script>
    </body>
</html>
