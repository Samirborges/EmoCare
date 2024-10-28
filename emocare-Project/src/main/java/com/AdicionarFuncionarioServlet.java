/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author anaxi
 */
@WebServlet("/telas_funcionarios/telas_gerente/AdicionarFuncionarioServlet")
public class AdicionarFuncionarioServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String email = request.getParameter("email");
        String especialidade = request.getParameter("especialidade");
        
        Connection connection = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        
        try{
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbemocare", "root", "senha");
            
            //Verifica se o e-mail existe na tabela Tbl_usuarios
            String query = "SELECT id_usuario, nome FROM tbl_usuarios WHERE email = ?";
            stmt = connection.prepareStatement(query);
            stmt.setString(1, email);
            rs = stmt.executeQuery();
            
            if(rs.next()){
                int idUsuario = rs.getInt("id_usuario");
                String nome = rs.getString("nome");
                
                // Fecha o statement e o ResultSet anterior para reusar
                rs.close();
                stmt.close();
                
                // Adicionar o funcionário na tabela tbl_funcionarios
                String insertQuery = "INSERT INTO tbl_funcionarios (id_funcionario, nome, especialidade) VALUES (?, ?, ?)";
                stmt = connection.prepareStatement(insertQuery);
                stmt.setInt(1, idUsuario);
                stmt.setString(2, nome);
                stmt.setString(3, especialidade);
                stmt.executeUpdate();
                
                response.setContentType("text/html;charset=UTF-8");
                try(PrintWriter out = response.getWriter()){
                    out.println("<html>");
                    out.println("<head>");
                    out.println("<title>Funcionário Adicionado</title>");
                    // Redireciona para a página de cadastro após 3 segundos
                    out.println("<meta http-equiv='refresh' content='3;URL=adicionarFuncionario.jsp'>");
                    out.println("</head>");
                    out.println("<body>");
                    out.println("<h1>Funcionário adicionado com sucesso!</h1>");
                    out.println("<p>Você será redirecionado para a página de cadastro em instantes...</p>");
                    out.println("</body>");
                    out.println("</html>");
                }
            } else{
                response.getWriter().println("Erro: E-mail não encontrado na tabela de usuários.");
            }
        } catch(ClassNotFoundException | SQLException e){
            e.printStackTrace();
            response.getWriter().println("Erro ao adicionar funcionário.");
        }finally{
            try {
             if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (connection != null) connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }   
    }
    
    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet AdicionarFuncionarioServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet AdicionarFuncionarioServlet at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
