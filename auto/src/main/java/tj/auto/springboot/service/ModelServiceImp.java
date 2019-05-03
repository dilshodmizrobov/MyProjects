package tj.auto.springboot.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tj.auto.springboot.dao.MarkDao;
import tj.auto.springboot.dao.ModelDao;
import tj.auto.springboot.entity.Generations;
import tj.auto.springboot.entity.Mark;
import tj.auto.springboot.entity.Model;

import javax.transaction.Transactional;
import java.util.ArrayList;
import java.util.List;

@Service
public class ModelServiceImp implements ModelService {
    @Autowired
    private ModelDao modelDao;
    @Override
    @Transactional
    public Model getModelById(Long id) {
        return modelDao.findById(id).get();
    }

    @Override
    @Transactional
    public void addModel(Model model) {
        modelDao.save(model);
    }

    @Override
    @Transactional
    public List<Model> getModels()
    {
        return modelDao.findAll();
    }

    @Override
    @Transactional
    public void deleteModel(Long id) {
        modelDao.deleteById(id);
    }

    @Override
    public List<Model> getModelsByMarkId(Long markId) {
        return modelDao.getModelsByMarkId(markId);
    }


}
