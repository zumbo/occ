package ch.aloba.occ.service;

import javax.inject.Inject;
import javax.persistence.EntityManager;

import ch.aloba.occ.data.L10nRepository;
import ch.aloba.occ.data.TableRepository;
import ch.aloba.occ.data.ViewRepository;
import ch.aloba.occ.model.L10nEntity;
import ch.aloba.occ.model.MainEntity;
import ch.aloba.occ.model.ReadViewEntity;
import ch.aloba.occ.model.ReadWriteViewEntity;

public abstract class ViewRegistration {
    @Inject
    protected EntityManager em;

    public void register(ReadViewEntity viewEntity) throws Exception {
		getTableRegistration().register(viewEntity.getEntity());
		getL10nRegistration().register(viewEntity.getL10nEntity());
		
	}
	
	protected abstract TableRegistration getTableRegistration();
	protected abstract L10nRegistration getL10nRegistration();
	protected abstract ViewRepository<? extends ReadViewEntity> getViewRepository();
	protected abstract TableRepository getTableRepository();
	protected abstract L10nRepository getL10nRepository();

	public void updateView(ReadWriteViewEntity viewEntity) throws Exception {
		ReadViewEntity rve = getViewRepository().findById(viewEntity.getId(), viewEntity.getLanguage());
		if (rve instanceof ReadWriteViewEntity) {
			ReadWriteViewEntity existing = (ReadWriteViewEntity)rve;
			viewEntity.update(existing);
			viewEntity = existing;
		}
        em.persist(viewEntity);
	}


	public int updateTables(ReadWriteViewEntity viewEntity) throws Exception {
		MainEntity entity = getTableRepository().findById(viewEntity.getId());
		if (entity == null) {
			entity = viewEntity.getEntity();
		}
		else {
			viewEntity.update(entity);
		}
		em.persist(entity);

		L10nEntity l10nEntity = getL10nRepository().findByLanguage(viewEntity.getId(), viewEntity.getLanguage());
		if (l10nEntity == null) {
			l10nEntity = viewEntity.getL10nEntity();
			l10nEntity.setParent(entity);
		}
		else {
			viewEntity.update(l10nEntity);
		}
		em.persist(l10nEntity);
		return entity.getId();
	}

	public void delete(int id) {
		MainEntity entity = getTableRepository().findById(id);
		if (entity != null) {
			em.remove(entity);
		}
	}
}
