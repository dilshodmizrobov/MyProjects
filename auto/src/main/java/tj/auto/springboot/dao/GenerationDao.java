package tj.auto.springboot.dao;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import tj.auto.springboot.entity.Car;
import tj.auto.springboot.entity.Generations;

import java.util.List;


@Repository
public interface GenerationDao extends JpaRepository <Generations, Long> {
    @Query(value = "select gt from Generations as gt where gt.model.id=:modelId ")
    public List<Generations> getModelsByMark_Id(Long modelId);
}
