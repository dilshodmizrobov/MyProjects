package tj.auto.springboot.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import tj.auto.springboot.entity.*;

import java.util.List;

public interface FilterDao {
    public List<Carcase> getCarcases();
    public List<Transmission> getTransmissions();
    public List<DriveUnit> getDriveUnits();
    public List<Fuel> getFuels();
    public List<EngineCapacity> getEngineCapacities();

}
