package tj.auto.springboot.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import tj.auto.springboot.entity.Mark;

import java.util.List;

public interface MarkDao extends JpaRepository<Mark,Long> {

}
