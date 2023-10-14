<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <link rel="stylesheet" type="text/css" href="cadsugestao.css"/>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Cadastrar Sugestões</title>
    </head>
    <body>
        <%

            //Receber os dados digitados no formulário
            String id, nc, g, nv;
            id = request.getParameter("id_usuario");
            nc = request.getParameter("nome_completo");
            g = request.getParameter("genero");
            nv = request.getParameter("nome_video");
            try {
                //Conectar com o Banco de dados
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conexao = DriverManager.getConnection("jdbc:mysql://localhost:3306/sugestoes", "root", "tico0715612!");

                // Inserir os dados recebidos do cadcur.html na tabela curso do BD
                String sql = "INSERT INTO t_sugestoes VALUES(?,?,?,?)";
                PreparedStatement st = conexao.prepareStatement(sql);
                st.setString(1, id);
                st.setString(2, nc);
                st.setString(3, g);
                st.setString(4, nv);
                st.executeUpdate(); // Executa o INSERT gerado acima
                out.print("<p style='color:blue; text-align: center'>Sugestão cadastrada com sucesso</p>");
            } catch (Exception erro) {
                String mensagemErro = erro.getMessage();
                //Duplicate entry 'cc' for key 'curso.PRIMARY'
                if (mensagemErro.contains("Duplicate entry")) {
                    out.print("<p style='color:blue; text-align: center'>Esta sugestão já está cadastrado</p>");
                } else {
                    out.print("<p style='color:blue; text-align: center'>Erro = </p>" + mensagemErro);
                }
            }
        %>
    </body>
</html>
