package tj.auto.springboot.service;


import org.springframework.data.jpa.repository.Query;
import tj.auto.springboot.entity.Generations;
import tj.auto.springboot.entity.Mark;
import tj.auto.springboot.entity.Model;

import java.util.List;

public interface ModelService {
    public Model getModelById(Long id);
    public void addModel(Model car);
    public List<Model> getModels();
    public void deleteModel(Long id);
    public List<Model> getModelsByMarkId(Long markId);


}
