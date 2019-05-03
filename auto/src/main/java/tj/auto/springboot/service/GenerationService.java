package tj.auto.springboot.service;

import tj.auto.springboot.entity.Generations;

import java.util.List;

public interface GenerationService {
    public Generations getGenerationById(Long id);
    public void addGeneration(Generations generation);
    public List<Generations> getGenerations();
    public void deleteGeneration(Long id);
    public  List<Generations> getGanerationByModeL(Long modelId);
}
