package tj.auto.springboot.entity;

import javax.persistence.*;

@Entity(name = "Generations")
@Table( schema = "autodb", name = "generations")
public class Generations {
    @Id

    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;

    private String name;

    private String period;
    @ManyToOne
     private Model model;

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

    public String getPeriod() {
        return period;
    }

    public void setPeriod(String period) {
        this.period = period;
    }

    public Model getModel() {
        return model;
    }

    public void setModel(Model model) {
        this.model = model;
    }

    @Override
    public String toString() {
        return "Generations{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", period='" + period + '\'' +
                '}';
    }
}
