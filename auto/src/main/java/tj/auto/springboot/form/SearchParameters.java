package tj.auto.springboot.form;
import com.fasterxml.jackson.annotation.JsonAnyGetter;
import com.fasterxml.jackson.annotation.JsonAnySetter;
import java.util.LinkedHashMap;
import java.util.Map;
public class SearchParameters {
    Map<String,Object> searchParams= new LinkedHashMap();
    public SearchParameters() {
        }

        @JsonAnyGetter
        public Map<String, Object> getSearchParam() {
        return searchParams;
                }

        @JsonAnySetter
        void setSearchParam(String key, Object value) {
        searchParams.put(key, value);
            }

    public Map<String, Object> getSearchParams() {
        return searchParams;
    }

    public void setSearchParams(Map<String, Object> searchParams) {
        this.searchParams = searchParams;
    }
}
