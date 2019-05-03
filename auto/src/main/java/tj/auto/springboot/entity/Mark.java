package tj.auto.springboot.entity;
import javax.persistence.*;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

@Entity(name = "Mark")
@Table( schema = "autodb", name = "marks")
public class Mark {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String name;

    private byte []icon;
    @OneToMany(mappedBy = "mark", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Model> models = new ArrayList<>();

    public List<Model> getModels() {
        return models;
    }

    public void setModels(List<Model> models) {
        this.models = models;
    }
    /*@OneToOne(
            mappedBy = "mark",
            cascade = CascadeType.ALL,
            orphanRemoval = true,
            fetch = FetchType.LAZY
             )
    @LazyToOne( LazyToOneOption.NO_PROXY )
    private Car car;
    public void addCar(Car car) {
        car.setMark(this);
        this.car = car;
    }

    public void removeCar() {
        if ( car != null ) {
            car.setMark( null );
            this.car = null;
        }
    }

    public Car getCar() {
        return car;
    }

    public void setCar(Car car) {
        this.car = car;
    }*/

    public byte[] getIcn() {
        return icon;
    }

    public void setIcn(byte[] icon) {
        this.icon = icon;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public byte[] getIcon() {
        return icon;
    }

    public void setIcon(byte[] icon) {
        this.icon = icon;
    }

    @Override
    public String toString() {
        return "Mark{" +
                "id=" + id +
                ", name='" + name + '\'' +
                '}';
    }
}
