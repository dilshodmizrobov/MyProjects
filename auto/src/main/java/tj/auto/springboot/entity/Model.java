package tj.auto.springboot.entity;

import org.hibernate.annotations.NaturalId;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;
@Entity(name = "Model")
@Table( schema = "autodb", name = "models")
public class Model {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String name;
    @ManyToOne
    // @JoinColumn(name = "MARK_ID")
    private Mark mark;

    public Mark getMark() {
        return mark;
    }

    public void setMark(Mark mark) {
        this.mark = mark;
    }
    @OneToMany(mappedBy = "model", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Generations> generations = new ArrayList<>();

    public List<Generations> getGenerations() {
        return generations;
    }

    public void setGenerations(List<Generations> generations) {
        this.generations = generations;
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

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Model model = (Model) o;
        return name.equals(model.name);
    }

    @Override
    public int hashCode() {
        return Objects.hash(name);
    }
}
