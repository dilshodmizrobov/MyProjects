package tj.auto.springboot.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tj.auto.springboot.dao.FilterDao;
import tj.auto.springboot.entity.*;

import java.util.List;

@Service
public class FilterServiceImpl implements FilterService {
    @Autowired
    private FilterDao filterDao;
    @Override
    public List<Carcase> getCarcases() {
        return filterDao.getCarcases();
    }

    @Override
    public List<Transmission> getTransmissions() {
        return filterDao.getTransmissions();
    }

    @Override
    public List<DriveUnit> getDriveUnits() {
        return filterDao.getDriveUnits();
    }

    @Override
    public List<Fuel> getFuels() {
        return filterDao.getFuels();
    }

    @Override
    public List<EngineCapacity> getEngineCapacities() {
        return filterDao.getEngineCapacities();
    }
}
