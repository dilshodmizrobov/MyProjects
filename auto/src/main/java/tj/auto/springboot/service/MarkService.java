package tj.auto.springboot.service;


import tj.auto.springboot.entity.Mark;

import java.util.List;

public interface MarkService {
    public Mark getMarkById(Long id);
    public void addMark(Mark car);
    public List<Mark> getMarks();
    public void deleteMark(Long id);
}
