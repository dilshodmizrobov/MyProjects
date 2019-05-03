package tj.auto.springboot.model;

public class MarkInfo {
    private String name;
    private int quantity;

    public MarkInfo(String name, int quanity) {
        this.name = name;
        this.quantity = quanity;
    }

    public MarkInfo() {

    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
}
