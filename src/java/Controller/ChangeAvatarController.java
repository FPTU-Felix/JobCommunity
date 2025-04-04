/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controller;

import Dao.DaoUser;
import jakarta.servlet.ServletContext;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.nio.file.Paths;

/**
 *
 * @author sontu
 */
@MultipartConfig(
        fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50 // 50MB
)
public class ChangeAvatarController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            if (request.getParameter("userID").isEmpty()) {
                response.sendRedirect("Login.jsp");
            } else {
                ServletContext context = request.getServletContext();
                /* TODO output your page here. You may use following sample code. */
                String savePath = context.getRealPath("/IMG");

// Kiểm tra và tạo thư mục nếu nó chưa tồn tại
                File uploadDir = new File(savePath);
                if (!uploadDir.exists()) {
                    uploadDir.mkdirs();
                }
// Lấy file từ request (ví dụ thumbnail, img1, img2, img3)
                Part imgPart = request.getPart("img");
                // Hàm để lưu file ảnh và trả về đường dẫn lưu trong DB
// Lưu từng ảnh và lấy đường dẫn để lưu vào database
                String imgPath = saveImage(imgPart, savePath);
                int userID = Integer.parseInt(request.getParameter("userID"));
                String fullName = request.getParameter("fullName");
                if (imgPath == null) {
                    String mess = "Hãy chọn ảnh để cập nhật ảnh đại diện!";
                    request.setAttribute("mess", mess);
                    request.getRequestDispatcher("user_profile?userID=" + userID).forward(request, response);
                } else {
                    DaoUser daoUser = new DaoUser();
                    daoUser.changeAvatarForUser(userID, imgPath, fullName);
                    String mess = "Update Sucessful!";
                    request.setAttribute("mess", mess);
                    response.sendRedirect("user_profile?userID=" + userID);
                }
            }
        }
    }

    private String saveImage(Part filePart, String savePath) throws IOException {
        String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
        if (fileName == null || fileName.isEmpty()) {
            return null; // Nếu người dùng không chọn ảnh, trả về null
        }
        filePart.write(savePath + File.separator + fileName); // Lưu file ảnh vào thư mục
        return "IMG/" + fileName; // Trả về đường dẫn sẽ lưu trong DB
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
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

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
