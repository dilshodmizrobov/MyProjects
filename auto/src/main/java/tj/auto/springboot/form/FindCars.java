package tj.auto.springboot.form;

import com.fasterxml.jackson.annotation.JsonAnyGetter;
import com.fasterxml.jackson.annotation.JsonAnySetter;

import java.util.LinkedHashMap;
import java.util.Map;

public class FindCars {
    Map<String,Object> findCars= new LinkedHashMap();
    @JsonAnySetter
    void setFindCar(String key, Object value) {
        findCars.put(key, value);
    }
    @JsonAnyGetter
    public Map<String, Object> getFindCar() {
        return findCars;
    }

    public FindCars() {
    }

    public Map<String, Object> getFindCars() {
        return findCars;
    }

    public void setFindCars(Map<String, Object> findCars) {
        this.findCars = findCars;
    }
}
