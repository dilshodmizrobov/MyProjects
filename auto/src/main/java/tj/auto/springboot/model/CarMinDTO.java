package tj.auto.springboot.model;

import java.util.Date;

public class CarMinDTO {
    private Long id;
    private String title;
    private double price;
    private String region;;
    private Date dateAdd;

    public String getRegion() {
        return region;
    }

    public void setRegion(String region) {
        this.region = region;
    }

    public Date getDateAdd() {
        return dateAdd;
    }

    public void setDateAdd(Date dateAdd) {
        this.dateAdd = dateAdd;
    }

    public CarMinDTO() {
    }

    public CarMinDTO(Long id, String title, double price) {
        this.id = id;
        this.title = title;
        this.price = price;

    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }
}
