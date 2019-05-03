package tj.auto.springboot.service;

import tj.auto.springboot.entity.*;

import java.util.List;

public interface FilterService {
    public List<Carcase> getCarcases();
    public List<Transmission> getTransmissions();
    public List<DriveUnit> getDriveUnits();
    public List<Fuel> getFuels();
    public List<EngineCapacity> getEngineCapacities();
}
