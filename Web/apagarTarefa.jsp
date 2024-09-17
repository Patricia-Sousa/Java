<%@page import="java.sql.Connection"%> <%@page
import="java.sql.PreparedStatement"%> <%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%> <%@page import="java.sql.SQLException" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
    <% //Perceber se o parâmetro 'id' está presente para eliminar o registo na
    base de dados e na aplicação Web String idParam =
    request.getParameter("id"); int id = 0; if(idParam != null){ id =
    Integer.parseInt(idParam); } //Inicialização dos recursos da base de dados
    Connection conexao = null; PreparedStatement st = null; ResultSet rs = null;
    try{ //Detalhes da conexão à base de dados String url =
    "jdbc:mysql://localhost:3306/tarefas_bd"; String utilizador = "root"; String
    pass = ""; //Load the JDBC driver and establish connection
    Class.forName("com.mysql.cj.jdbc.Driver"); conexao =
    DriverManager.getConnection(url, utilizador, pass); //Prepare and execute
    DELETE statement String query = "DELETE FROM tarefa WHERE id = ?"; st =
    conexao.prepareStatement(query); st.setInt(1, id); int resultado =
    st.executeUpdate(); if(resultado == 0){ out.println("Erro"); } else{ st =
    conexao.prepareStatement("SELECT * FROM tarefa"); rs = st.executeQuery(); %>
    <h1 style="margin: 20px 20px 20px 20px">Tarefas</h1>
    <table class="table">
      <thead>
        <tr>
          <th scope="col">#</th>
          <th scope="col">Descrição</th>
          <th scope="col">Categoria</th>
          <th scope="col">Prioridade</th>
          <th scope="col">Opções</th>
        </tr>
      </thead>
      <% while(rs.next()){ %>
      <tbody>
        <tr>
          <th scope="row"><%= rs.getInt("id") %></th>
          <td><%= rs.getString("descricao") %></td>
          <td><%= rs.getString("categoria") %></td>
          <td><%= rs.getString("prioridade") %></td>
          <td>
            <form
              action="editarTarefa.jsp"
              method="post"
              style="display: inline-block; margin-right: 5px"
            >
              <input type="hidden" name="id" value="<%= rs.getInt("id") %>">
              <button class="btn btn-outline-primary" type="submit">
                Editar
              </button>
            </form>
            <form
              action="apagarTarefa.jsp"
              method="post"
              style="display: inline-block; margin-right: 5px"
            >
              <input type="hidden" name="id" value="<%= rs.getInt("id") %>">
              <button class="btn btn-outline-primary" type="submit">
                Eliminar
              </button>
            </form>
          </td>
        </tr>
        <% } %>
      </tbody>
    </table>
    <% } } catch (ClassNotFoundException e){ out.println("Driver JDBC não
    encontrado: " + e.getMessage()); } catch (SQLException e){ out.println("Erro
    ao aceder à base de dados: " + e.getMessage()); } finally { //Fechar
    recursos if(rs != null){ try { rs.close(); } catch (SQLException e) {
    out.println("Erro ao fechar o ResultSet: " + e.getMessage()); } } if(st !=
    null){ try { st.close(); } catch (SQLException e) { out.println("Erro ao
    fechar o PreparedStatement: " + e.getMessage()); } } if(conexao != null){
    try { conexao.close(); } catch (SQLException e) { out.println("Erro ao
    fechar a conexão: " + e.getMessage()); } } } %>
  </body>
</html>
