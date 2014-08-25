package ch.aloba.occ.data;

import javax.enterprise.context.ApplicationScoped;

import ch.aloba.occ.model.MainEntity;
import ch.aloba.occ.model.Metal;

@ApplicationScoped
public class MetalRepository extends TableRepository {

	@Override
    public Metal findById(Integer id) {
        return em.find(Metal.class, id);
    }

	@Override
	protected Class<? extends MainEntity> getEntityClass() {
		return Metal.class;
	}
}
