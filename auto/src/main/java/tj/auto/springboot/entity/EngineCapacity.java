package tj.auto.springboot.entity;

import javax.persistence.*;

@Entity(name = "EngineCapacity")
@Table( schema = "autodb", name = "engine_capacity")
public class EngineCapacity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private Float capacity;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public Float getCapacity() {
        return capacity;
    }

    public void setCapacity(Float capacity) {
        this.capacity = capacity;
    }

    @Override
    public String toString() {
        return "EngineCapacity{" +
                "id=" + id +
                ", capacity=" + capacity +
                '}';
    }
}
