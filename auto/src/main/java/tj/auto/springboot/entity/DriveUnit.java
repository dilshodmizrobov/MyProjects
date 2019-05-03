package tj.auto.springboot.entity;

import javax.persistence.*;

@Entity(name = "DriveUnit")
@Table( schema = "autodb", name = "drive_unit")
public class DriveUnit {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    private String type;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    @Override
    public String toString() {
        return "Carcase{" +
                "id=" + id +
                ", type='" + type + '\'' +
                '}';
    }
}
