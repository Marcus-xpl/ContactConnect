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

<%
    //para usar o jsp, vc precisa deixar tudo na mesma pasta com todos arquivos que vc queira usar, e fazer o download das ferramentas necessarias.
    // Cria as variáveis para armazenar as informações 
    // digitadas pelo usuário

    String vnome = request.getParameter("txtNome");
    String vsobrenome = request.getParameter("txtSobrenome");
    String vnumero = request.getParameter("txtNumero");
    String vemail = request.getParameter("txtEmail");

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

    // Cria a variável sql como o comando INSERT
    String sql = "INSERT INTO pessoas (nome, sobrenome, numero, email) VALUES (?, ?, ?, ?)";

    PreparedStatement stm = conexao.prepareStatement(sql);
    stm.setString(1, vnome);
    stm.setString(2, vsobrenome);
    stm.setString(3, vnumero);
    stm.setString(4, vemail);
    stm.executeUpdate(); // Use executeUpdate() para instruções SQL que alteram dados
    stm.close();

    out.print("Dados gravados");
    out.print("<br><br>");
    out.print("<a href='cadastro.html'>Voltar</a>");

    // Fechar a conexão no bloco finally
    try {
        if (conexao != null && !conexao.isClosed()) {
            conexao.close();
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }
%>
