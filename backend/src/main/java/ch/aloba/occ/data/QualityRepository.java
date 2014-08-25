package ch.aloba.occ.data;

import javax.enterprise.context.ApplicationScoped;
import javax.inject.Inject;
import javax.persistence.EntityManager;

import ch.aloba.occ.model.MainEntity;
import ch.aloba.occ.model.Quality;

@ApplicationScoped
public class QualityRepository extends TableRepository {

    @Inject
    private EntityManager em;

	@Override
    public MainEntity findById(Integer id) {
        return em.find(Quality.class, id);
    }

	@Override
	protected Class<? extends MainEntity> getEntityClass() {
		return Quality.class;
	}

}
