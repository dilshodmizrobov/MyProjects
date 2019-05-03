package tj.auto.springboot.entity;

import javax.persistence.*;

@Entity(name = "Color")
@Table( schema = "autodb", name = "color")
public class Color {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String name;

    public Color() {
    }

    public Color(String name) {
        this.name = name;
    }

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
