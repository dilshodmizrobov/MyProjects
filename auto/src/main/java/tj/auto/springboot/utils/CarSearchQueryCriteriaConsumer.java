package tj.auto.springboot.utils;

import tj.auto.springboot.entity.*;
import tj.auto.springboot.form.SearchForm;
import tj.auto.springboot.form.SearchParameters;

import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.Join;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import java.util.function.Consumer;

public class CarSearchQueryCriteriaConsumer implements Consumer<SearchParameters> {

    private Predicate predicate;
    private CriteriaBuilder builder;
    private Root root;

    public CarSearchQueryCriteriaConsumer() {
    }

    public CarSearchQueryCriteriaConsumer(Predicate predicate, CriteriaBuilder criteriaBuilder, Root root) {
        this.predicate = predicate;
        this.builder = criteriaBuilder;
        this.root = root;
    }

    @Override
    public void accept(SearchParameters param) {
        if (param.getSearchParams().keySet().contains("markId")&&param.getSearchParams().get("markId").toString() != null) {
            Join<Car, Mark>markJoin=root.join(Car_.MARK);
            predicate=builder.and(predicate,builder.equal(
                    markJoin.get(Mark_.ID),param.getSearchParams().get("markId").toString()));
        }
        if (param.getSearchParams().keySet().contains("modelId")&&param.getSearchParams().get("modelId")!= null) {
            Join<Car, Model> modelJoin = root.join(Car_.MODEL);
            predicate=builder.and(predicate,builder.equal(
                    modelJoin.get(Model_.ID),param.getSearchParams().get("modelId").toString()));
        }
        if (param.getSearchParams().keySet().contains("generationId")&&param.getSearchParams().get("generationId")!= null) {
            Join<Car, Generations> generationsJoin = root.join(Car_.GENERATION);
            predicate=builder.and(predicate,builder.equal(
                    generationsJoin.get(Generations_.ID),param.getSearchParams().get("generationId").toString()));
        }
        if (param.getSearchParams().get("carcaseId")!= null) {
            Join<Car, Carcase> carcaseJoin =root.join(Car_.CARCASE);
            predicate=builder.and(predicate,builder.equal(
                    carcaseJoin.get(Carcase_.ID),param.getSearchParams().get("carcaseId").toString()));
        }
        if (param.getSearchParams().get("transmissionId")!= null) {
            Join<Car, Transmission> transmissionJoin =root.join(Car_.TRANSMISSION);
            predicate=builder.and(predicate,builder.equal(
                    transmissionJoin.get(Transmission_.ID),param.getSearchParams().get("transmissionId").toString()));
        }
        if (param.getSearchParams().get("fuelId")!= null) {
            Join<Car, Fuel> fuelJoin =root.join(Car_.FUEL);
            predicate=builder.and(predicate,builder.equal(
                    fuelJoin.get(Fuel_.ID),param.getSearchParams().get("fuelId").toString()));
        }
        if (param.getSearchParams().get("driveUnitId")!= null) {
            Join<Car, DriveUnit> driveUnitJoin =root.join(Car_.DRIVE_UNIT);
            predicate=builder.and(predicate,builder.equal(
                    driveUnitJoin.get(DriveUnit_.ID),param.getSearchParams().get("driveUnitId").toString()));
        }
    }
    public Predicate getPredicate() {
        return predicate;
    }

    public void setPredicate(Predicate predicate) {
        this.predicate = predicate;
    }

    public CriteriaBuilder getBuilder() {
        return builder;
    }

    public void setBuilder(CriteriaBuilder builder) {
        this.builder = builder;
    }

    public Root getRoot() {
        return root;
    }

    public void setRoot(Root root) {
        this.root = root;
    }
}
