package com;


import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

@WebServlet("/telas_cliente/AgendarConsultaServlet") 
public class AgendarConsultaServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);
        if (session == null || session.getAttribute("id_paciente") == null) {
            response.sendRedirect("login.jsp");  // Redirecionar para login se o paciente não estiver logado
            return;
        }
        
        String[] consultaSelecionada = request.getParameter("consulta").split("-");
        int idDia = Integer.parseInt(consultaSelecionada[0]);
        int idHorario = Integer.parseInt(consultaSelecionada[1]); // Pegar o horário selecionado
        String tipoTratamento = request.getParameter("tipoTratamento");
        int idPaciente = (int) session.getAttribute("id_paciente");
        
        Connection connection = null;
        PreparedStatement stmt = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbemocare", "root", "senha"); // Mudar senha para conectar no banco de dados

            // Inserir na tabela tbl_consultas_marcadas
            String query = "INSERT INTO tbl_consultas_marcadas (id_dia_consulta, horario_agendado, id_paciente, tipo_tratamento) VALUES (?, ?, ?, ?)";
            stmt = connection.prepareStatement(query);
            stmt.setInt(1, idDia);
            stmt.setInt(2, idHorario);  // Inserir o horário agendado
            stmt.setInt(3, idPaciente);
            stmt.setString(4, tipoTratamento);
            stmt.executeUpdate();

            response.sendRedirect("agendarConsulta.jsp?success=true");
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            response.sendRedirect("agendarConsulta.jsp?error=true");
        } finally {
            try {
                if (stmt != null) stmt.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
