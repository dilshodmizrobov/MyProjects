package tj.auto.springboot.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import tj.auto.springboot.service.MarkService;
@Controller
@RequestMapping("/marks")
public class MarkController {
    @Autowired
    private MarkService markService;
    @RequestMapping
    public  String getMarks(Model model){
        model.addAttribute("marks",markService.getMarks());
        return "markView";
    }

}
