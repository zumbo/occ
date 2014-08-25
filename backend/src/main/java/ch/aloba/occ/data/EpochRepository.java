package ch.aloba.occ.data;

import javax.enterprise.context.ApplicationScoped;

import ch.aloba.occ.model.MainEntity;
import ch.aloba.occ.model.Epoch;

@ApplicationScoped
public class EpochRepository extends TableRepository {

	@Override
    public Epoch findById(Integer id) {
        return em.find(Epoch.class, id);
    }

	@Override
	protected Class<? extends MainEntity> getEntityClass() {
		return Epoch.class;
	}
}
