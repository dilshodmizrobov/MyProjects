package tj.auto.springboot.dao;

import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import tj.auto.springboot.entity.*;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;

@Repository
public class FilterDaoImpl implements FilterDao {
    @PersistenceContext
    private EntityManager entityManager;
    @Transactional(readOnly = true)
    @Override
    public List<Carcase> getCarcases() {
        return entityManager.createQuery("select c from Carcase as  c",Carcase.class).getResultList();
    }

    @Override
    public List<Transmission> getTransmissions() {
        return entityManager.createQuery("select t from Transmission as  t",Transmission.class).getResultList();
    }

    @Override
    public List<DriveUnit> getDriveUnits() {
        return entityManager.createQuery("select d from DriveUnit as  d",DriveUnit.class).getResultList();
    }

    @Override
    public List<Fuel> getFuels() {
        return entityManager.createQuery("select d from Fuel as  d",Fuel.class).getResultList();
    }

    @Override
    public List<EngineCapacity> getEngineCapacities() {
        return entityManager.createQuery("select ec from EngineCapacity as  ec",EngineCapacity.class).getResultList();

    }
}
