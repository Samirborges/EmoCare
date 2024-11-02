<%-- 
    Document   : consultasParaTerapeuta
    Created on : 24 de out. de 2024, 14:46:26
    Author     : Samir & Guylherme Lyra
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Time"%>
<%@page import="java.sql.Date"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Consultas Agendadadas</title>
        <link rel="stylesheet" href="../../styles/style_h.css">
    </head>
    <body>
    <div class="exterior">
        <a href="../home_terapeuta.jsp"><button class="voltar">←</button></a>
        <h1>Consultas Agendadas</h1>
    </div>
    <div class="container">
        <table> <!--border="1"-->
            <tr>
                <th>Nome do Paciente</th>
                <th>Data da Consulta</th>
                <th>Horário</th>
                <th>Tipo de Tratamento</th>
                <th>Anotações</th>
            </tr>
            <%
                int idTerapeuta = (int) session.getAttribute("id_terapeuta"); // Obtém o ID do terapeuta logado
                Connection connection = null;
                PreparedStatement stmt = null;
                ResultSet rs = null;

                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbemocare", "root", "senha"); // Colocar senha do mysql

                    // Consulta para buscar as consultas futuras do terapeuta
                    String query = "SELECT tbl_usuarios.nome AS paciente, tbl_dias_consultas.data_dia, " +
                                   "tbl_horarios_disponiveis.horario, tbl_consultas_marcadas.tipo_tratamento, tbl_consultas_terapeuta.anotacoes " +
                                   "FROM tbl_consultas_terapeuta " +
                                   "INNER JOIN tbl_consultas_marcadas ON tbl_consultas_terapeuta.id_dia_consulta = tbl_consultas_marcadas.id_consultas_marcadas " +
                                   "INNER JOIN tbl_dias_consultas ON tbl_consultas_marcadas.id_dia_consulta = tbl_dias_consultas.id_dia " +
                                   "INNER JOIN tbl_horarios_disponiveis ON tbl_consultas_marcadas.horario_agendado = tbl_horarios_disponiveis.id_horario " +
                                   "INNER JOIN tbl_usuarios ON tbl_consultas_marcadas.id_paciente = tbl_usuarios.id_usuario " +
                                   "WHERE tbl_consultas_terapeuta.id_terapeuta = ? AND tbl_dias_consultas.data_dia >= CURDATE()"; // Apenas consultas futuras

                    stmt = connection.prepareStatement(query);
                    stmt.setInt(1, idTerapeuta);
                    rs = stmt.executeQuery();

                    while (rs.next()) {
                        String paciente = rs.getString("paciente");
                        Date dataConsulta = rs.getDate("data_dia");
                        Time horario = rs.getTime("horario");
                        String tipoTratamento = rs.getString("tipo_tratamento");
                        String anotacoes = rs.getString("anotacoes");
            %>
            <tr>
                <td><%= paciente %></td>
                <td><%= dataConsulta %></td>
                <td><%= horario %></td>
                <td><%= tipoTratamento %></td>
                <td><%= anotacoes %></td>
            </tr>
            <%
                    }
                } catch (SQLException | ClassNotFoundException e) {
                    e.printStackTrace();
                } finally {
                    if (rs != null) try { rs.close(); } catch (SQLException ignore) {}
                    if (stmt != null) try { stmt.close(); } catch (SQLException ignore) {}
                    if (connection != null) try { connection.close(); } catch (SQLException ignore) {}
                }
            %>
        </table>
    </div>
    </body>
</html>
