package tj.auto.springboot.service;

import org.hibernate.query.criteria.internal.expression.PathTypeExpression;
import org.springframework.stereotype.Repository;
import tj.auto.springboot.entity.*;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Tuple;
import javax.persistence.criteria.*;
import java.util.List;

@Repository
public class TestHibernateDao {
    @PersistenceContext
    private EntityManager entityManager;
    public List<Tuple> getCountMark() {
       return null;
    }
}
