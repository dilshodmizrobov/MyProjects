package tj.auto.springboot.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import tj.auto.springboot.entity.Generations;
import tj.auto.springboot.entity.Mark;
import tj.auto.springboot.entity.Model;

import java.util.List;

public interface ModelDao extends JpaRepository<Model, Long> {
    @Query(value = "select m from Model as m where m.mark.id=:markId ")
     public List<Model> getModelsByMarkId(Long markId);
}
