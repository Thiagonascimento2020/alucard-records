<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.io.FileWriter"%>
<%@page import="java.io.IOException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consultar Sugestão</title>
        <link rel="stylesheet" href="tabela.css">
    </head>
    <body>
        <%
            //Recebe o nome do genero digiado no formulario consugestao.html
            String g;
            g = request.getParameter("genero");
            PreparedStatement st;
            
            //Conectar com o Banco de dados
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conexao = DriverManager.getConnection("jdbc:mysql://localhost:3306/sugestoes", "root", "tico0715612!");

            // Buscar totos os dados da tabela curso do BD
            String sql = "SELECT * FROM t_sugestoes WHERE genero LIKE ? ORDER By nome_completo";
            st = conexao.prepareStatement(sql);
            st.setString(1, "%" + g + "%");
            ResultSet resultado = st.executeQuery(); //Executa o SELECT
        %>
        <form>
            <input class="poiter" type="submit" value="Exportar para CSV">
        </form>
        <table> 
            <tr>
                <th> # </th> 
                <th> Nome </th> 
                <th> Gênero </th>
                <th> Sugestão </th>
                <th> Editar </th>
                <th> Exclusão </th>
            </tr>
            
            
            <%
                // Exibindo os cursos um por um
                while (resultado.next()) {
            %>
            <tr>  
                <td> <%= resultado.getString("id_usuario")%> </td>
                <td> <%= resultado.getString("nome_completo")%> </td>
                <td> <%= resultado.getString("genero")%> </td>
                <td> <%= resultado.getString("nome_video")%> </td>
                <td> <a href="carregasugestao.jsp?id_usuario=<%= resultado.getString("id_usuario")%>"> Alterar </a> </td>
                <td> <a href="exsugestao.jsp?id_usuario=<%= resultado.getString("id_usuario")%>"> Excluir </a> </td>
            </tr>
            
            <%
                }
            %>   
        </table> 
    </body>
</html>
