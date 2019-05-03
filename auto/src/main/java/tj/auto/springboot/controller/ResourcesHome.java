package tj.auto.springboot.controller;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.configurationprocessor.json.JSONException;
import org.springframework.boot.configurationprocessor.json.JSONObject;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.context.request.WebRequest;
import tj.auto.springboot.dao.CarDao;
import tj.auto.springboot.dao.ModelDao;
import tj.auto.springboot.entity.Car;
import tj.auto.springboot.entity.Mark;
import tj.auto.springboot.entity.Model;
import tj.auto.springboot.form.SearchForm;
import tj.auto.springboot.form.SearchHelperParameters;
import tj.auto.springboot.form.SearchParameters;
import tj.auto.springboot.model.CarLargeDto;
import tj.auto.springboot.model.CarMinDTO;
import tj.auto.springboot.model.ModelDto;
import tj.auto.springboot.service.CarService;
import tj.auto.springboot.service.GenerationService;
import tj.auto.springboot.service.MarkService;
import tj.auto.springboot.service.ModelService;
import tj.auto.springboot.utils.ConvertorTDO;

import javax.servlet.http.HttpServletRequest;
import java.io.IOException;
import java.util.*;
import java.util.stream.Collectors;
@RestController
public class ResourcesHome {
    @Autowired
    private MarkService markService;
    @Autowired
    private GenerationService generationService;
    @Autowired
    private CarService carService;
    @Autowired
    private ModelService modelService;
    @Autowired
    private ModelMapper modelMapper;
    @Autowired
    private ObjectMapper objectMapper;
    @PostMapping(value = "resourceFilter",produces = MediaType.APPLICATION_JSON_VALUE,consumes =MediaType.APPLICATION_JSON_VALUE )
    public  Map<String,List<?>> filterHome(@RequestParam(required = false, name = "page",defaultValue = "5")  String page ,
                            @RequestBody(required = false)  String jsonSearchForm) throws IOException, JSONException {

        SearchForm searchForm=objectMapper.readValue(jsonSearchForm, SearchForm.class);
        Map<String,List<?>> resultParams=new LinkedHashMap<>();
        if(searchForm.getHelperParameters()!=null){

            if(searchForm.getHelperParameters().getSearchHelpParams().get("markId")!=null)
         {
             System.out.println(searchForm.getHelperParameters().getSearchHelpParams().values().toString());
            List<Model> models=modelService.getModelsByMarkId(Long.valueOf(searchForm.getHelperParameters().getSearchHelpParams().get("markId").toString()));
                        List<ModelDto> modelDtos=models.stream().map(model -> ConvertorTDO.modelTOmodelTdo(modelMapper,model))
                    .collect(Collectors.toList());
            resultParams.put("searchHelperResults",modelDtos);
         }
            if(searchForm.getHelperParameters().getSearchHelpParams().get("modelId")!=null){

                resultParams.put("searchHelperResults",generationService.getGanerationByModeL(
                    Long.valueOf(searchForm.getHelperParameters().getSearchHelpParams().get("modelId").toString())
            ).stream().map(generation -> ConvertorTDO.generationTogenerationDTO(modelMapper,generation)).collect(Collectors.toList()));

            }

          }
        if(searchForm.getSearchParameters()!=null){
                 if(!searchForm.getSearchParameters().getSearchParams().isEmpty()){
                     Map<String,Object> stringObjectMap=new HashMap<>(searchForm.getSearchParameters().getSearchParams());
                     //stringObjectMap.entrySet().stream().forEach(stringObjectEntry -> System.out.println(stringObjectEntry.getKey()+" "+stringObjectEntry.getValue().toString()));
                     List<Car> countCars=carService.coutCarsByCriteria(stringObjectMap);
                     List<Map<String,Long>>longList =new ArrayList<>();
                        Map<String,Long> carmaps=new HashMap<>();
                        carmaps.put("cars",Long.valueOf(countCars.size()));
                        longList.add(carmaps);
                        resultParams.put("searchResults",longList);
                 }
        }
        if(searchForm.getFindCars()!=null){
            if(!searchForm.getFindCars().getFindCars().isEmpty()){
                Map<String,Object> stringObjectMap=new HashMap<>(searchForm.getFindCars().getFindCars());

                stringObjectMap.entrySet().stream().forEach(stringObjectEntry -> System.out.println(stringObjectEntry.getKey()+" "+stringObjectEntry.getValue().toString()));
                List<CarLargeDto> cars=carService.coutCarsByCriteria(stringObjectMap).stream().
                        map(car -> ConvertorTDO.carToCarLargeDto(modelMapper,car)).
                        collect(Collectors.toList());
                resultParams.put("resultCars",cars);
            }
        }
        return resultParams;
    }

    @PostMapping(value = "resourceHome",produces = MediaType.APPLICATION_JSON_VALUE , consumes = MediaType.APPLICATION_FORM_URLENCODED_VALUE)
    public List<?> paginationHome(@RequestParam(value = "paginationPage",required = false) String paginationPage,
                                  WebRequest request){
        System.out.println(request.getParameter("paginationPage"));
        //if(request.getParameter("paginationPage")==paginationPage)
        if(paginationPage!=null) {
            List<Car> cars = carService.getCars(
                    PageRequest.of(Integer.valueOf(paginationPage).intValue(), 4, Sort.Direction.DESC, "dateAdd", "price"));
                return cars.stream().map(car -> ConvertorTDO.carToCarMinTdo(modelMapper,car)).collect(Collectors.toList());
            }
        return null;
    }
}
