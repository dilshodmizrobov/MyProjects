package tj.auto.springboot.dao;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;
import tj.auto.springboot.entity.Car;


@Repository
public interface  CarDao  extends JpaRepository <Car, Long> {
}
