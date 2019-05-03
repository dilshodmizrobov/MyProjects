package tj.auto.springboot.service;
import org.springframework.data.domain.Pageable;
import tj.auto.springboot.entity.Car;
import tj.auto.springboot.form.SearchParameters;

import javax.persistence.Tuple;
import java.util.List;
import java.util.Map;

public interface CarService {
    public Car getById(Long id);
    public void addCar(Car car);
    public List<Car> getCars(Pageable pageable);
    public List<Tuple> getCountMarkCar();
   // public List<Car> coutCarsByCriteria(SearchParameters parame);
   public List<Car> coutCarsByCriteria(Map<String,Object> parame);
    //public Long coutCarsByCriteria(Map<String,Object> parame);
    public void deleteCar(Long id);

}
