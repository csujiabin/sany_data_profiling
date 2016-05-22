package controller;

import javax.servlet.http.HttpServletResponse;

import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import domain.User;
import form.UserLoginForm;

@Controller
public class LoginController {
    
    private static final Log logger = LogFactory.getLog(LoginController.class);
    
    @RequestMapping(value="/login")
    public String verifyUser(UserLoginForm userLoginForm, Model model, 
            HttpServletResponse response) {
        
        logger.info("verifyUser called");
        
        // create model
        User user = new User();
        user.setUsername(userLoginForm.getUsername());
        user.setPassword(userLoginForm.getPassword());
        
//        if (!"mro".equals(user.getUsername()) || !"mro".equals(user.getPassword())) {
//            try {
//                response.sendRedirect("index.jsp");
//            } catch (IOException e) {
//                e.printStackTrace();
//            }
//        }
        
        return "dashboard";
    }
}
