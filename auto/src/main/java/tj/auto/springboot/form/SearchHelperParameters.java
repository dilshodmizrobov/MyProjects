package tj.auto.springboot.form;
import com.fasterxml.jackson.annotation.JsonAnyGetter;
import com.fasterxml.jackson.annotation.JsonAnySetter;
import java.util.LinkedHashMap;
import java.util.Map;
public class SearchHelperParameters {
    Map<String,Object> searchHelpParams= new LinkedHashMap();
    @JsonAnySetter
    void setSearchHelpParam(String key, Object value) {
        searchHelpParams.put(key, value);
    }
    @JsonAnyGetter
    public Map<String, Object> getSearchHelpParam() {
        return searchHelpParams;
    }
    public SearchHelperParameters() {
    }

    public Map<String, Object> getSearchHelpParams() {
        return searchHelpParams;
    }

    public void setSearchHelpParams(Map<String, Object> searchHelpParams) {
        this.searchHelpParams = searchHelpParams;
    }
}
