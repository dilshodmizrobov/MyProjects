package tj.auto.springboot.model;

public class GenerationDTO {
    private int id;

    private String name;

    private String period;

    public GenerationDTO() {
    }

    public GenerationDTO(int id, String name, String period) {
        this.id = id;
        this.name = name;
        this.period = period;
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

    public String getPeriod() {
        return period;
    }

    public void setPeriod(String period) {
        this.period = period;
    }
}
