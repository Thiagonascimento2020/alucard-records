<%@page import="java.sql.Connection" %>
<%@page import="java.sql.DriverManager" %>
<%@page import="java.sql.PreparedStatement" %>
<%@page import="java.sql.ResultSet" %>
<%@page import="java.sql.SQLException" %>
<%@page contentType="text/html" pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="pt-br">
    <head>
        <link rel="stylesheet" type="text/css" href="cadsugestao.css"/> 
        <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>Dados do curso</title>
    </head>
    <body>
        <%
            //Declaração de variáveis
            String id, sql;
            Connection conexao;
            PreparedStatement st;
            ResultSet resultado;
            //Receber o código do curso digitado no form altcur.html
            id = request.getParameter("id_usuario");
        try {    
            //Conectar com o banco de dados
            Class.forName("com.mysql.cj.jdbc.Driver");
            conexao = DriverManager.getConnection("jdbc:mysql://localhost:3306/sugestoes", "root", "tico0715612!");
            //Buscar o curso de código digitado na tabela do BD
            sql = "SELECT * FROM t_sugestoes WHERE id_usuario = ?";
            st = conexao.prepareStatement(sql);
            st.setString(1, id); //Coloca a variável c no lugar do ? do comando SELECT
            resultado = st.executeQuery(); //Executa o SELECT  
            if(resultado.next()){ //Se o curso foi encontrado na tabela
             //Carregar os dado do curso em um formulário HTML
        %>
        <form method = "post" action="altsugestao.jsp">
            <p>
                <label class="alinhar_id" style='color:white' for="cod">ID:*</label>
                <input class="alinhar_id" style='background-color: red'; id="cod" type="text" name="id_usuario" size="5" maxlength="5" required value="<%= resultado.getString("id_usuario") %>" readonly>
            </p>
            <p>
                <label class="alinhar" style='color:white' for="ncp">Seu Nome Completo:*</label>
                <input class="alinhar" id="ncp" type="text" name="nome_completo" size="50" maxlength="100" required value="<%= resultado.getString("nome_completo")%>">
            </p>
            <p>
            <label class="alinhar" style='color:white' for="gen">Gênero:*</label>
                <select class="alinhar" id="gen" name="genero" required value="<%= resultado.getString("genero")%>">
                    <option value="acao" >Ação</option>
                    <option value="Anime" >Anime</option>
                    <option class="cor_verde" value="Brasileiros" >Brasileiros </option>
                    <option value="Classicos" >Clássicos</option>
                    <option value="Comedia_stand_up" >Comédia stand-up</option>
                    <option value="Comedias" >Comédias</option>
                    <option value="Curtas" >Curtas</option>
                    <option value="Documentarios" >Documentários</option>
                    <option value="Dorama" >Dorama</option>
                    <option value="Drama" >Drama</option>
                    <option value="Esportes" >Esportes</option>
                    <option value="Musica_e_musicais" >Música e musicais</option>
                    <option value="Estrangeiros" >Estrangeiros</option>
                    <option value="Fantasia" >Fantasia</option>
                    <option value="Fe_e_espiritualidade" >Fé e espiritualidade</option>
                    <option value="Ficcao_cientifica" >Ficção científica</option>
                    <option value="Halloween" >Halloween</option>
                    <option value="Hollywood" >Hollywood</option>
                    <option value="Independentes" >Independentes</option>
                    <option class="cor_rosa" value="LGBTQIA+" >LGBTQIA+</option>
                    <option value="Para_a_familia_toda" >Para a família toda</option>
                    <option value="Policial" >Policial</option>
                    <option value="Premiados" >Premiados</option>
                    <option value="Romance" >Romance</option>
                    <option value="Suspense" >Suspense</option>
                    <option class="cor_vermelho" value="Terror" >Terror</option>
                </select>
        </p>
        <p>
            <label class="alinhar" style='color:white' for="nvd">Nome do Sugestão:*</label>
            <input class="alinhar" id="nvd" type="text" name="nome_video" size="50" maxlength="100" required value="<%= resultado.getString("nome_video") %>">
        </p>
        <p>
            <input class="botao_sugestao" type="submit" value="Alterar Sugestão">
        </p>
    </form>
        <%
            } else { //Se o curso não foi encontrado na tabela
               out.print("<p style='color:blue; text-align: center'>Este curso de código " + id + " não está cadastrado</p>");
            }
       } catch (SQLException erro){
          out.print("<p style='color:blue; text-align: center'>Entre em contato com o suporte e informe o código de erro:</p>" + erro.getErrorCode());
       }
        %>
    </body>
</html> 
  
