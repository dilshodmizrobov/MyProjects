package tj.auto.springboot.service;


import org.springframework.security.core.userdetails.UserDetailsService;
import tj.auto.springboot.entity.User;
import tj.auto.springboot.model.UserRegistrationDto;

public interface UserService extends UserDetailsService {

    User findByEmail(String email);

    User save(UserRegistrationDto registration);
}
