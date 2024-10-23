/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.time.LocalDate;

/**
 *
 * @author anaxi
 */
//@WebServlet(urlPatterns = {"/CadastroServlet"})
@WebServlet("/CadastroServlet") // Alteração da IA
public class CadastroServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException{
        System.out.println("Entrou no método doPost");
        String nome = request.getParameter("nome");
        String email = request.getParameter("email");
        String senha = request.getParameter("senha");
        LocalDate dataCadastro = LocalDate.now();
        
        System.out.println("Dados recebidos: Nome=" + nome +", Email=" + email + ", Senha=" + senha + ", Data de Cadastro=" + dataCadastro);
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");  // Certifique-se de que o driver está sendo carregado
            try (Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/dbemocare", "root", "senha"); // Mudar senha para conectar no banco de dados
                 PreparedStatement preparedStatement = connection.prepareStatement("INSERT INTO tbl_usuarios (nome, email, senha, data_cadastramento) VALUES (?, ?, ?, ?)")) {
                preparedStatement.setString(1, nome);
                preparedStatement.setString(2, email);
                preparedStatement.setString(3, senha);
                preparedStatement.setDate(4, java.sql.Date.valueOf(dataCadastro));
                int rowsAffected = preparedStatement.executeUpdate();
                System.out.println("Inserção realizada, linhas afetadas: " + rowsAffected);
                response.sendRedirect("login.jsp");
            }
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            response.sendRedirect("cadastro.jsp?error=true");
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("cadastro.jsp?error=true");
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
            out.println("<title>Servlet CadastroServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet CadastroServlet at " + request.getContextPath() + "</h1>");
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
