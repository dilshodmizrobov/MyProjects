package tj.auto.springboot;
import org.junit.After;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import tj.auto.springboot.entity.Car;
import tj.auto.springboot.entity.Mark;
import tj.auto.springboot.entity.Model;
import tj.auto.springboot.service.CarService;
import tj.auto.springboot.service.TestHibernateDao;

import javax.persistence.Tuple;
import java.util.List;

import static org.junit.Assert.assertEquals;
import static org.junit.Assert.assertNotNull;
@RunWith(SpringRunner.class)
@SpringBootTest
public class AutoMarkerApplicationTest {
    private static Logger logger = LoggerFactory.getLogger(AutoMarkerApplicationTest.class);
    @Autowired
    private TestHibernateDao hibernateDao;
    @Test
    public void testFindAll(){
        /*List<Mark> marks=hibernateDao.getMarkList();
        assertNotNull(marks);
        carList(marks);*/
        /*List<Object[]> moldes=hibernateDao.getModelByIdandName();
        assertNotNull(moldes);
        modlesByIdandName(moldes);*/
        List<Tuple> moldes=hibernateDao.getCountMark();
        assertNotNull(moldes);
        modlesList(moldes);
    }

    private void modlesList(List<Tuple> models ) {
        for (Tuple tuple  : models) {
            System.out.println(tuple.get(0).toString()+tuple.get(1).toString());
        }
    }
    @After
    public void tearDown(){

    }

}
