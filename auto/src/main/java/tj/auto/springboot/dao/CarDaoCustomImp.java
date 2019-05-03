package tj.auto.springboot.dao;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import tj.auto.springboot.entity.Car;
import tj.auto.springboot.entity.Car_;
import tj.auto.springboot.entity.Mark;
import tj.auto.springboot.entity.Mark_;
import tj.auto.springboot.form.SearchParameters;
import tj.auto.springboot.model.CarMinDTO;
import tj.auto.springboot.utils.CarSearchQueryCriteriaConsumer;

import javax.persistence.*;
import javax.persistence.criteria.*;
import java.util.List;
import java.util.Map;

@Repository("carDaoCustom")
public class CarDaoCustomImp implements CarDaoCustom {
    private static final Logger LOGGER= LoggerFactory.getLogger(CarDaoCustomImp.class);
    @PersistenceContext
    private  EntityManager entityManager;
    @Transactional(readOnly = true)
    @Override
    public List<Tuple> getCountMarkCar() {
        CriteriaBuilder build  = entityManager.getCriteriaBuilder();
        CriteriaQuery<Tuple> query  = build.createQuery(Tuple.class);
        Root<Car> root = query .from(Car.class);
        Join<Car, Mark> carMarkJoin=root.join(Car_.MARK);
        query.groupBy(root.get(Car_.MARK));
        query.multiselect(carMarkJoin.get(Mark_.NAME).alias("markName"), build.count(root).alias("countMark"));
        query.orderBy(build.desc( build.count(root)));
        List<Tuple> tuples = entityManager.createQuery( query ).getResultList();
        return tuples;
    }
   // public List<Car> coutCarsByCriteria(SearchParameters param)
   //public List<Car> coutCarsByCriteria(Map<String,Object> param)
   //public Long coutCarsByCriteria(Map<String,Object> param)
    @Override
    public List<Car> coutCarsByCriteria(Map<String,Object> param) {
       CriteriaBuilder criteriaBuilder = entityManager.getCriteriaBuilder();
       CriteriaQuery<Car> query=criteriaBuilder.createQuery(Car.class);
       Root<Car> root=query.from(Car.class);
       Predicate predicate=criteriaBuilder.conjunction();
       CarSearchQueryCriteriaConsumer queryCriteriaConsumer=new CarSearchQueryCriteriaConsumer(predicate,criteriaBuilder,root);
       SearchParameters parameters=new SearchParameters();
       parameters.setSearchParams(param);
       queryCriteriaConsumer.accept(parameters);
       predicate=queryCriteriaConsumer.getPredicate();
       //query.select(criteriaBuilder.count(root));
       query.where(predicate);
       //query.groupBy(root.get(Car_.MARK));
        //return entityManager.createQuery(query).getSingleResult();
        List<Car> cars =entityManager.createQuery(query).getResultList();
        return  cars;
    }
}
