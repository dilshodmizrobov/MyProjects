package tj.auto.springboot.form;

import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonIgnoreProperties;
import com.fasterxml.jackson.annotation.JsonProperty;

public class SearchForm {

    private  SearchHelperParameters helperParameters=null;

    private  SearchParameters searchParameters=null;

    private FindCars findCars=null;

    public SearchForm() {
    }
       @JsonCreator
    public SearchForm(@JsonProperty("searchHelperParameters") SearchHelperParameters helperParameters,
                      @JsonProperty("searchParameters") SearchParameters searchParameters,
                      @JsonProperty("findCars") FindCars findCars) {
        this.helperParameters = helperParameters;
        this.searchParameters = searchParameters;
        this.findCars=findCars;
    }

    public SearchHelperParameters getHelperParameters() {
        return helperParameters;
    }

    public void setHelperParameters(SearchHelperParameters helperParameters) {
        this.helperParameters = helperParameters;
    }

    public SearchParameters getSearchParameters() {
        return searchParameters;
    }

    public void setSearchParameters(SearchParameters searchParameters) {
        this.searchParameters = searchParameters;
    }

    public FindCars getFindCars() {
        return findCars;
    }

    public void setFindCars(FindCars findCars) {
        this.findCars = findCars;
    }
}
