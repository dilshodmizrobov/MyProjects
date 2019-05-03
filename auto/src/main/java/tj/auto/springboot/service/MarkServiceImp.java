package tj.auto.springboot.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tj.auto.springboot.dao.MarkDao;
import tj.auto.springboot.entity.Mark;

import javax.transaction.Transactional;
import java.util.List;
@Service
public class MarkServiceImp implements MarkService {

    @Autowired
    private MarkDao markDao;
    @Override
    @Transactional
    public Mark getMarkById(Long id) {
        return markDao.findById(id).get();
    }

    @Override
    @Transactional
    public void addMark(Mark mark) {
        markDao.save(mark);
    }

    @Override
    @Transactional
    public List<Mark> getMarks()
    {
        return markDao.findAll();
    }

    @Override
    @Transactional
    public void deleteMark(Long id) {
        markDao.deleteById(id);
    }
}
