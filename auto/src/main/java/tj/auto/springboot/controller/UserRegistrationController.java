package tj.auto.springboot.controller;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import tj.auto.springboot.entity.User;
import tj.auto.springboot.model.UserRegistrationDto;
import tj.auto.springboot.security.UserContext;
import tj.auto.springboot.service.UserService;

import javax.validation.Valid;

@Controller
public class UserRegistrationController {

       private UserService userService;
       private UserContext userContext;
       @Autowired
       public UserRegistrationController(UserContext userContext, UserService userService) {
           if (userContext == null) {
               throw new IllegalArgumentException("userContext cannot be null");
           }
           if (userService == null) {
               throw new IllegalArgumentException("userService cannot be null");
           }
           this.userContext = userContext;
           this.userService = userService;
       }

    @RequestMapping("/registration/form")
    public String gistration(@ModelAttribute(name="user") UserRegistrationDto user) {
        return "/registration";
    }


    @RequestMapping(value="/registration/new",method=RequestMethod.POST)
    public String registerNewUser(@Valid UserRegistrationDto user, BindingResult result, RedirectAttributes redirectAttributes) {
        if(result.hasErrors()) {
            return "/registration";
        }

        String email = user.getEmail();
        if(userService.findByEmail(email) != null) {
            result.rejectValue("email", "errors.signup.email", "Email address is already in use.");
            return "/registration/form";
        }

        User user1=userService.save(user);
		/*
		 * int id =user.getId().intValue(); user.setId(id);
		 */
        userContext.setCurrentUser(user1);
        return "redirect:/";
    }
    
}
