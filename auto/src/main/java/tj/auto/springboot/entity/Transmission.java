package tj.auto.springboot.entity;

import javax.persistence.*;

@Entity(name = "Transmission")
@Table( schema = "autodb", name = "transmission")
public class Transmission {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String name;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @Override
    public String toString() {
        return "Carcase{" +
                "id=" + id +
                ", name='" + name + '\'' +
                '}';
    }
}
