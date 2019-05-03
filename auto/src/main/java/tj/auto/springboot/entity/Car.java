package tj.auto.springboot.entity;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonRootName;

import javax.persistence.*;

import java.text.ParseException;

import java.util.Date;

@Entity(name = "Car")
@Table(schema = "autodb", name = "cars")
@NamedQueries({
        @NamedQuery(name =Car.FIND_ALL,query = "select c from Car c left join c.mark m where  m.id=10")
})
@JsonRootName("car")
public class Car {

    public static final String FIND_ALL = "Car.findAll";
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String title;
    private double price;
    @Temporal(TemporalType.TIMESTAMP)
    private Date dateAdd;
   // private String dateAdd;
    private String region;
    private String year_issue;
    private int mileage;
    private int power;
    private int wheel_diameter;
    private String condition;
    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "MARK_ID")
    private Mark mark;
    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "MODEL_ID")
    private Model model;
    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "GENERATION_ID")
    private Generations generation;
    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "CARCASE_ID")
    private Carcase carcase;
    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "COLOR_ID")
    private Color color;
    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "ENGINE_CAPACITY_ID")
    private EngineCapacity engineCapacity;
    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "FUEL_ID")
    private Fuel fuel;
    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "OWNER_ID")
    private  Owner owner;
    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "TRANSMISSION_ID")
    private  Transmission transmission;
    @OneToOne(cascade = CascadeType.ALL)
    @JoinColumn(name = "DRIVE_UNIT_ID")
    private  DriveUnit driveUnit;

    public DriveUnit getDriveUnit() {
        return driveUnit;
    }

    public void setDriveUnit(DriveUnit driveUnit) {
        this.driveUnit = driveUnit;
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

    /*public String getDateAdd() {
        return dateAdd;
    }

    public void setDateAdd(String dateAdd) {
        this.dateAdd = dateAdd;
    }*/

    public Date getDateAdd() throws ParseException {
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

    public int getWheel_diameter() {
        return wheel_diameter;
    }

    public void setWheel_diameter(int wheel_diameter) {
        this.wheel_diameter = wheel_diameter;
    }

    public int getPower() {
        return power;
    }

    public void setPower(int power) {
        this.power = power;
    }


    public String getCondition() {
        return condition;
    }

    public void setCondition(String condition) {
        this.condition = condition;
    }

    public Mark getMark() {
        return mark;
    }

    public void setMark(Mark mark) {
        this.mark = mark;
    }

    public Model getModel() {
        return model;
    }

    public void setModel(Model model) {
        this.model = model;
    }

    public Generations getGeneration() {
        return generation;
    }

    public void setGeneration(Generations generation) {
        this.generation = generation;
    }

    public Carcase getCarcase() {
        return carcase;
    }

    public void setCarcase(Carcase carcase) {
        this.carcase = carcase;
    }

    public Color getColor() {
        return color;
    }

    public void setColor(Color color) {
        this.color = color;
    }

    public EngineCapacity getEngineCapacity() {
        return engineCapacity;
    }

    public void setEngineCapacity(EngineCapacity engineCapacity) {
        this.engineCapacity = engineCapacity;
    }

    public Fuel getFuel() {
        return fuel;
    }

    public void setFuel(Fuel fuel) {
        this.fuel = fuel;
    }

    public Owner getOwner() {
        return owner;
    }

    public void setOwner(Owner owner) {
        this.owner = owner;
    }

    public Transmission getTransmission() {
        return transmission;
    }

    public void setTransmission(Transmission transmission) {
        this.transmission = transmission;
    }

    @Override
    public String toString() {
        return "Car{" +
                "id=" + id +
                ", title='" + title + '\'' +
                ", price=" + price +
                ", owner='" + owner + '\'' +
                '}';
    }

}
