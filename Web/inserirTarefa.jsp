<%@page import="java.sql.Connection"%> <%@page
import="java.sql.PreparedStatement"%> <%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.SQLException" %> <%@page contentType="text/html"
pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="PT-pt">
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Tarefas</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta name="author" content="Patrícia Sousa" />
    <meta name="keywords" content="HTML, CSS, JAVA" />
    <meta name="description" content="Projeto Final" />
    <link rel="shortcut icon" type="image/ico" href="favicon.ico" />
    <link rel="stylesheet" href="styles.css" />
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
      integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
      crossorigin="anonymous"
    />
  </head>
  <body>
    <% //Recuperar valores do formulário criarNova.html String descricao =
    request.getParameter("descricao"); String categoria =
    request.getParameter("categoria"); String prioridade =
    request.getParameter("prioridade"); //Inicialização dos recursos da base de
    dados Connection conexao = null; PreparedStatement st = null; try{
    //Detalhes da conexão à base de dados String url =
    "jdbc:mysql://localhost:3306/tarefas_bd"; String utilizador = "root"; String
    pass = ""; //Load the JDBC driver and establish connection
    Class.forName("com.mysql.cj.jdbc.Driver"); conexao =
    DriverManager.getConnection(url, utilizador, pass); //Inserir Tarefa na base
    de dados String query = "INSERT INTO tarefa (descricao, categoria,
    prioridade) VALUES (?, ?, ?)"; st = conexao.prepareStatement(query);
    st.setString(1, descricao); st.setString(2, categoria); st.setString(3,
    prioridade); st.executeUpdate(); } catch(ClassNotFoundException e){
    out.println("Driver JDBC não encontrado: " + e.getMessage()); }
    catch(SQLException e){ out.println("Erro ao aceder à base de dados: " +
    e.getMessage()); } finally{ //Fechar recursos if(st != null){ try{
    st.close(); } catch (SQLException e){ out.println("Erro ao fechar o
    PreparedStatement: " + e.getMessage()); } } if (conexao != null){ try{
    conexao.close(); } catch (SQLException e){ out.println("Erro ao fechar a
    conexão: " + e.getMessage()); } } } %>
    <h1 style="margin: 20px 20px 20px 20px">Tarefa guardada</h1>
  </body>
</html>
