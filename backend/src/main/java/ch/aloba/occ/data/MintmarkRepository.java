package ch.aloba.occ.data;

import javax.enterprise.context.ApplicationScoped;

import ch.aloba.occ.model.MainEntity;
import ch.aloba.occ.model.Mintmark;

@ApplicationScoped
public class MintmarkRepository extends TableRepository {
	@Override
	public Mintmark findById(Integer id) {
		return em.find(Mintmark.class, id);
	}

	@Override
	protected Class<? extends MainEntity> getEntityClass() {
		return Mintmark.class;
	}
}
