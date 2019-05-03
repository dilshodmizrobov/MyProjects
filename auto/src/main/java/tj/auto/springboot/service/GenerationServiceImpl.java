package tj.auto.springboot.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tj.auto.springboot.dao.GenerationDao;
import tj.auto.springboot.entity.Generations;

import java.util.List;
@Service
public class GenerationServiceImpl implements  GenerationService {
    @Autowired
    private GenerationDao generationDao;
    @Override
    public Generations getGenerationById(Long id) {
        return generationDao.findById(id).get();
    }

    @Override
    public void addGeneration(Generations generation) {
        generationDao.save(generation);
    }

    @Override
    public List<Generations> getGenerations() {
        return generationDao.findAll();
    }

    @Override
    public void deleteGeneration(Long id) {
        generationDao.deleteById(id);
    }

    @Override
    public List<Generations> getGanerationByModeL(Long modelId) {
        return generationDao.getModelsByMark_Id(modelId);
    }
}
