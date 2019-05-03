package tj.auto.springboot.controller;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.support.RequestContext;
import tj.auto.springboot.entity.Car;
import tj.auto.springboot.entity.Mark;
import tj.auto.springboot.model.CarMinDTO;
import tj.auto.springboot.model.MarkInfo;

import tj.auto.springboot.service.CarService;
import tj.auto.springboot.service.FilterService;
import tj.auto.springboot.service.MarkService;
import tj.auto.springboot.service.ModelService;
import javax.persistence.Tuple;
import javax.servlet.http.HttpServletRequest;
import java.util.*;
import java.util.stream.Collectors;

@Controller
public class HomeController {
    @Autowired
    private FilterService filterService;
    @Autowired
    private MarkService markService;
    @Autowired
    private CarService carService;
    @Autowired
    private ModelMapper modelMapper;
    @Autowired
    private ModelService modelService;
    @GetMapping(value = "/")
    public String home(Model model){
        List<Car> cars=carService.getCars(
        PageRequest.of(0,4, Sort.Direction.DESC,"dateAdd","price"));
        List<Tuple> tuples=carService.getCountMarkCar();
        List<MarkInfo> markInfos=new ArrayList<>();
        for (Tuple tuple : tuples){
            MarkInfo markInfo=new MarkInfo();
            markInfo.setName(tuple.get("markName").toString());
            markInfo.setQuantity(Integer.valueOf(tuple.get("countMark").toString()));
            markInfos.add(markInfo);
        }
        Map<String,List<?>> listMap=new LinkedHashMap<>();
        listMap.put("engineCapacities",filterService.getEngineCapacities());
        listMap.put("fuels",filterService.getFuels());
        listMap.put("driveUnits",filterService.getDriveUnits());
        listMap.put("transmissions",filterService.getTransmissions());
        listMap.put("carcases",filterService.getCarcases());
        listMap.put("marks",markService.getMarks());
        listMap.put("cars",cars);
        listMap.put("markInfos", markInfos);
        model.addAllAttributes(listMap);

        /*model.addAttribute("engineCapacities",filterService.getEngineCapacities());
         model.addAttribute("fuels",filterService.getFuels());
         model.addAttribute("driveUnits",filterService.getDriveUnits());
         model.addAttribute("transmissions",filterService.getTransmissions());
         model.addAttribute("carcases",filterService.getCarcases());
         model.addAttribute("marks",markService.getMarks());
         model.addAttribute("cars",cars);
         model.addAttribute("markInfos", markInfos)*/;
         return "pages/home";

}
    @GetMapping("/login")
    public String login(Model model) {
        return "login";
    }
}
