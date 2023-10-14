<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="exsugestao.css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Exclusão Sugestão</title>
    </head>
    <body>
        <%
            //Declaração de variáveis  
            String id;
            Connection conexao;
            PreparedStatement st;
            int resultado;
            //Receber o código digitado no form excur.html
            id = request.getParameter("id_usuario");
            try {
                //Conectar com o banco de dados
                Class.forName("com.mysql.cj.jdbc.Driver");
                conexao = DriverManager.getConnection("jdbc:mysql://localhost:3306/sugestoes", "root", "tico0715612!");
                //Excluir o curso de código informado
                st = conexao.prepareStatement("DELETE FROM t_sugestoes WHERE id_usuario = ?");
                st.setString(1, id); //completa o Delete no lugar do ?
                resultado = st.executeUpdate(); //executa o comando delete
                if (resultado == 1) {
                    //Mostra a mensagem de confirmação de exclusão
                    out.print("<p style='color:blue; text-align: center'>O curso " + id + " foi apagado com sucesso</p>");
                } else {
                    out.print("<p style='color:blue; text-align: center'>O curso de código " + id + " não está cadastrado</p>");
                }
            } catch (SQLException x) {
                out.print("Entre em contato com o suporte e informe o erro: " + x.getErrorCode());
            }
        %>
    </body>
</html>
