package tj.auto.springboot.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import tj.auto.springboot.entity.Car;
import tj.auto.springboot.service.CarService;

@Controller
@RequestMapping("/car")
public class CarController  {
    @Autowired
    private CarService carService;
    @RequestMapping("/{id}")
    public String getCarById(@PathVariable Long id, Model model){
        Car car=carService.getById(id);
        model.addAttribute("car",car);
        System.out.println(car);
        return "pages/car";
    }
    @RequestMapping
    public String getCar(Model model){
         return "pages/search";
    }
}
