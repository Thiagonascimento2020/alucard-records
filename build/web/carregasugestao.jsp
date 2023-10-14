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
            //Declara��o de vari�veis
            String id, sql;
            Connection conexao;
            PreparedStatement st;
            ResultSet resultado;
            //Receber o c�digo do curso digitado no form altcur.html
            id = request.getParameter("id_usuario");
        try {    
            //Conectar com o banco de dados
            Class.forName("com.mysql.cj.jdbc.Driver");
            conexao = DriverManager.getConnection("jdbc:mysql://localhost:3306/sugestoes", "root", "tico0715612!");
            //Buscar o curso de c�digo digitado na tabela do BD
            sql = "SELECT * FROM t_sugestoes WHERE id_usuario = ?";
            st = conexao.prepareStatement(sql);
            st.setString(1, id); //Coloca a vari�vel c no lugar do ? do comando SELECT
            resultado = st.executeQuery(); //Executa o SELECT  
            if(resultado.next()){ //Se o curso foi encontrado na tabela
             //Carregar os dado do curso em um formul�rio HTML
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
            <label class="alinhar" style='color:white' for="gen">G�nero:*</label>
                <select class="alinhar" id="gen" name="genero" required value="<%= resultado.getString("genero")%>">
                    <option value="acao" >A��o</option>
                    <option value="Anime" >Anime</option>
                    <option class="cor_verde" value="Brasileiros" >Brasileiros </option>
                    <option value="Classicos" >Cl�ssicos</option>
                    <option value="Comedia_stand_up" >Com�dia stand-up</option>
                    <option value="Comedias" >Com�dias</option>
                    <option value="Curtas" >Curtas</option>
                    <option value="Documentarios" >Document�rios</option>
                    <option value="Dorama" >Dorama</option>
                    <option value="Drama" >Drama</option>
                    <option value="Esportes" >Esportes</option>
                    <option value="Musica_e_musicais" >M�sica e musicais</option>
                    <option value="Estrangeiros" >Estrangeiros</option>
                    <option value="Fantasia" >Fantasia</option>
                    <option value="Fe_e_espiritualidade" >F� e espiritualidade</option>
                    <option value="Ficcao_cientifica" >Fic��o cient�fica</option>
                    <option value="Halloween" >Halloween</option>
                    <option value="Hollywood" >Hollywood</option>
                    <option value="Independentes" >Independentes</option>
                    <option class="cor_rosa" value="LGBTQIA+" >LGBTQIA+</option>
                    <option value="Para_a_familia_toda" >Para a fam�lia toda</option>
                    <option value="Policial" >Policial</option>
                    <option value="Premiados" >Premiados</option>
                    <option value="Romance" >Romance</option>
                    <option value="Suspense" >Suspense</option>
                    <option class="cor_vermelho" value="Terror" >Terror</option>
                </select>
        </p>
        <p>
            <label class="alinhar" style='color:white' for="nvd">Nome do Sugest�o:*</label>
            <input class="alinhar" id="nvd" type="text" name="nome_video" size="50" maxlength="100" required value="<%= resultado.getString("nome_video") %>">
        </p>
        <p>
            <input class="botao_sugestao" type="submit" value="Alterar Sugest�o">
        </p>
    </form>
        <%
            } else { //Se o curso n�o foi encontrado na tabela
               out.print("<p style='color:blue; text-align: center'>Este curso de c�digo " + id + " n�o est� cadastrado</p>");
            }
       } catch (SQLException erro){
          out.print("<p style='color:blue; text-align: center'>Entre em contato com o suporte e informe o c�digo de erro:</p>" + erro.getErrorCode());
       }
        %>
    </body>
</html> 
  
