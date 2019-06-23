<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Exclui Funcionário</title>
    </head>
    <body>
       <%
                    int idFuncionario= Integer.parseInt(request.getParameter("idFuncionario"));
                    int idEndereco= Integer.parseInt(request.getParameter("idEndereco"));
        %>
        <script type="text/javascript" language="javascript">
            confirmar = window.confirm("Tem certeza que deseja excluir?");
            if (confirmar==true){
                location.href = "recebeFuncionario.jsp?action=excluir&idFuncionario=<%=idFuncionario%>&idEndereco=<%=idEndereco%>";
            } else if (confirmar==false){
                window.alert("Exclusão cancelada!");
                location.href = "funcionariosCadastrados.jsp";
            }
        </script>
    </body>
</html>
