package tj.auto.springboot.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import tj.auto.springboot.dao.CarDao;
import tj.auto.springboot.dao.CarDaoCustom;
import tj.auto.springboot.entity.Car;
import tj.auto.springboot.form.SearchParameters;

import javax.persistence.Tuple;
import java.util.List;
import java.util.Map;

@Service
public class CarServiceImp implements CarService {
    @Autowired
    private CarDao carDao;
    @Autowired
    @Qualifier("carDaoCustom")
    private CarDaoCustom carDaoCustom;

    @Override
    @Transactional
    public Car getById(Long id) {
      Car car= carDao.findById(id).get();
        return car;
    }
    @Override
    @Transactional
    public void addCar(Car car) {
        carDao.save(car);
    }

    @Override
    @Transactional
    public List<Car> getCars(Pageable pageable) {
        List<Car> cars=carDao.findAll(pageable).getContent();
        return cars;
    }
    /*@Override
    @Transactional
    public Page<Car> getCars(int page, int size) {
       // List<Car> cars=carDaoCustom.getCars();
        Page<Car> cars=carDao.findAll(PageRequest.of(page,size));
        return cars;
    }*/

    @Override
    @Transactional
    public List<Tuple>getCountMarkCar(){
       return carDaoCustom.getCountMarkCar();
        //return carDao.getCountMarkCar();
    }
    //public List<Car> coutCarsByCriteria(SearchParameters parame)
  //  public List<Car> coutCarsByCriteria(Map<String,Object> parame)
    @Override
    @Transactional(readOnly = true)
    public List<Car> coutCarsByCriteria(Map<String,Object> parame) {
        return carDaoCustom.coutCarsByCriteria(parame);
    }

    @Override
    @Transactional
    public void deleteCar(Long id) {
        carDao.deleteById(id);
    }
}
