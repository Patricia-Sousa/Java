<%@page import="java.sql.Connection"%> <%@page
import="java.sql.PreparedStatement"%> <%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%> <%@page import="java.sql.SQLException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
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
    <% //Inicialização dos recursos da base de dados Connection conexao = null;
    PreparedStatement st = null; ResultSet rs = null; try{ //Detalhes da conexão
    à base de dados String url = "jdbc:mysql://localhost:3306/tarefas_bd";
    String utilizador = "root"; String pass = ""; //Load the JDBC driver and
    establish connection Class.forName("com.mysql.cj.jdbc.Driver"); conexao =
    DriverManager.getConnection(url, utilizador, pass); //Executar a query à
    base de dados st = conexao.prepareStatement("SELECT * FROM tarefa"); rs =
    st.executeQuery(); %>
    <h1 style="margin: 20px 20px 20px 20px">Tarefas</h1>
    <table class="table">
      <thead>
        <tr>
          <th scope="col">#</th>
          <th scope="col">Descrição</th>
          <th scope="col">Categoria</th>
          <th scope="col">Prioridade</th>
        </tr>
      </thead>
      <% while(rs.next()){ %>
      <tbody>
        <tr>
          <th scope="row"><%= rs.getInt("id") %></th>
          <td><%= rs.getString("descricao") %></td>
          <td><%= rs.getString("categoria") %></td>
          <td><%= rs.getString("prioridade") %></td>
        </tr>
        <% } %>
      </tbody>
    </table>
    <a
      class="btn btn-outline-primary"
      role="button"
      aria-disabled="true"
      style="margin: 10px 10px 10px 20px"
      href="index.html"
      >Voltar</a
    >
    <% } catch (ClassNotFoundException e){ out.println("Driver JDBC não
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
