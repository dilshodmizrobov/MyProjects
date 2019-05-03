package tj.auto.springboot.security;

import tj.auto.springboot.entity.User;


public interface UserContext {

   
    User getCurrentUser();

  
    void setCurrentUser(final User user);
}
