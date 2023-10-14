<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="cadsugestao.css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Alteração de Sugestão</title>
    </head>
    <body>
        <%

            //Declaração de variáveis
            String id, nc, g, nv,sql;
            Connection conexao;
            PreparedStatement st;
            //Receber os dados alterados no formulario carregacurso.jsp
            
            id = request.getParameter("id_usuario");
            nc = request.getParameter("nome_completo");
            g = request.getParameter("genero");
            nv = request.getParameter("nome_video");
            try {
                //Conectar com o Banco de dados
                Class.forName("com.mysql.cj.jdbc.Driver");
                conexao = DriverManager.getConnection("jdbc:mysql://localhost:3306/sugestoes", "root", "tico0715612!");
                //Enviar os dados alteradoss/recebidos acima, na tabela do BD
                sql = "UPDATE t_sugestoes SET nome_completo= ?, genero= ?, nome_video= ? WHERE id_usuario= ?";
                st = conexao.prepareStatement(sql);
                st.setString(1, nc);
                st.setString(2, g);
                st.setString(3, nv);
                st.setString(4, id);
                st.executeUpdate(); // Executa o UPDATE gerado acima
                out.print("<p style='color:blue; text-align: center'>O curso de código " + id + " foi alterado com sucesso</p>");
            } catch (SQLException erro) {
                out.print("<p style='color:blue; text-align: center'>Entre em contato com o suporte e informe o código de erro:</p>" + erro.getErrorCode());
            }
        %>
    </body>
</html>
