package ch.aloba.occ.data;

import javax.enterprise.context.ApplicationScoped;
import javax.inject.Inject;
import javax.persistence.EntityManager;

import ch.aloba.occ.model.Grade;
import ch.aloba.occ.model.MainEntity;

@ApplicationScoped
public class GradeRepository extends TableRepository {

    @Inject
    private EntityManager em;

	@Override
    public MainEntity findById(Integer id) {
        return em.find(Grade.class, id);
    }

	@Override
	protected Class<? extends MainEntity> getEntityClass() {
		return Grade.class;
	}

}
