
package asw;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet(name = "Login", urlPatterns = {"/Login"})
public class Login extends HttpServlet {

    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String name = request.getParameter("name");
        String id = request.getParameter("id");
        String pass = request.getParameter("Password");

        HttpSession session  = request.getSession();
        
        DAO dao = new DAO();
        
        int b = dao.validateUser(name, id, pass);
        
        session.setAttribute("verifacao", b);
                
        switch (b) {
            case 0:
                response.sendRedirect("Gestor.jsp");
                session.setAttribute("id", id);
                session.setAttribute("name", name);
                break;
            case 1:
                response.sendRedirect("Cliente.jsp");
                session.setAttribute("id", id);
                session.setAttribute("name", name);
                
                break;
            default:
                response.sendRedirect("Login.jsp");
                break;
        }
        
        

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
