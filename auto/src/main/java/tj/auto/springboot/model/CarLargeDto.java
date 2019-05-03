package tj.auto.springboot.model;

import tj.auto.springboot.entity.Color;

import java.util.Date;

public class CarLargeDto {
    private Long id;
    private String title;
    private double price;
    private Date dateAdd;
    private String region;
    private String year_issue;
    private int mileage;
    private int power;
    private String colorName;
    private String engineCapacityCapacity;
    private String fuelName;
    private String transmissionName;
    private String driveUnitType;

    public CarLargeDto() {
    }

    public CarLargeDto(Long id, String title, double price, Date dateAdd, String region, String yearIssue, int mileage, int power, String colorName, String engineCapacityCapacity, String fuelName, String transmissionName, String driveUnitName) {
        this.id = id;
        this.title = title;
        this.price = price;
        this.dateAdd = dateAdd;
        this.region = region;
        this.year_issue = yearIssue;
        this.mileage = mileage;
        this.power = power;
        this.colorName = colorName;
        this.engineCapacityCapacity = engineCapacityCapacity;
        this.fuelName = fuelName;
        this.transmissionName = transmissionName;
        this.driveUnitType = driveUnitName;
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

    public Date getDateAdd() {
        return dateAdd;
    }

    public void setDateAdd(Date dateAdd) {
        this.dateAdd = dateAdd;
    }

    public String getRegion() {
        return region;
    }

    public void setRegion(String region) {
        this.region = region;
    }

    public String getYear_issue() {
        return year_issue;
    }

    public void setYear_issue(String year_issue) {
        this.year_issue = year_issue;
    }

    public int getMileage() {
        return mileage;
    }

    public void setMileage(int mileage) {
        this.mileage = mileage;
    }

    public int getPower() {
        return power;
    }

    public void setPower(int power) {
        this.power = power;
    }

    public String getColorName() {
        return colorName;
    }

    public void setColorName(String colorName) {
        this.colorName = colorName;
    }

    public String getEngineCapacityCapacity() {
        return engineCapacityCapacity;
    }

    public void setEngineCapacityCapacity(String engineCapacityCapacity) {
        this.engineCapacityCapacity = engineCapacityCapacity;
    }

    public String getFuelName() {
        return fuelName;
    }

    public void setFuelName(String fuelName) {
        this.fuelName = fuelName;
    }

    public String getTransmissionName() {
        return transmissionName;
    }

    public void setTransmissionName(String transmissionName) {
        this.transmissionName = transmissionName;
    }

    public String getDriveUnitType() {
        return driveUnitType;
    }

    public void setDriveUnitType(String driveUnitType) {
        this.driveUnitType = driveUnitType;
    }
}
