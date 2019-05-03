package tj.auto.springboot.dao;

import tj.auto.springboot.entity.Car;
import tj.auto.springboot.form.SearchParameters;

import javax.persistence.Tuple;
import java.util.List;
import java.util.Map;

public interface CarDaoCustom {
    public List<Tuple> getCountMarkCar();
  //  public List<Car> coutCarsByCriteria(SearchParameters parame);
  public List<Car> coutCarsByCriteria(Map<String,Object> parame);
 // public Long coutCarsByCriteria(Map<String,Object> parame);
}
