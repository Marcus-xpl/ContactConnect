<%@page language="java" import="java.sql.*" %>



<!DOCTYPE html>
<html lang="pt-br">
<head>
       <meta charset="UTF-8">
       <title>Vizualizar</title>

<style>
body{
background-color: rgb(189, 189, 189);
}
</style>
</head>
<body>
   <% 
       // Variáveis para o banco de dados
    String banco = "web";
    String endereco = "jdbc:mysql://localhost:3306/" + banco;
    String usuario = "root";
    String senha = "";

       // Variável para o Driver
    String driver = "com.mysql.jdbc.Driver";

    // Carregar o driver na memória
    Class.forName(driver);

   // Cria a variável para conectar com o banco de dados
    Connection conexao;

   // Abrir a conexão com o banco de dados
    conexao = DriverManager.getConnection(endereco, usuario, senha);

    String sql ="SELECT * FROM pessoas";
    PreparedStatement stm = conexao.prepareStatement(sql);

    ResultSet dados = stm.executeQuery();

    out.print("<table border=1 width='500'>");
     out.print("<tr>");
          out.print("<th>Nome</th>");
          out.print("<th>Sobrenome</th>");
          out.print("<th>Numero</th>");
          out.print("<th>email</th>");
      out.print("</tr>");
  
  while( dados.next() ){

out.print("<tr>");

    out.print("<td>");
       out.print(dados.getString("Nome"));
    out.print("</td>");
    out.print("<td>");
       out.print(dados.getString("Sobrenome"));
    out.print("</td>");
        out.print("<td>");
       out.print(dados.getString("Numero"));
    out.print("</td>");
        out.print("<td>");
       out.print(dados.getString("email"));
    out.print("</td>");

out.print("<tr>");
      }


    out.print("</table>");

   
   %>


</body>
</html>