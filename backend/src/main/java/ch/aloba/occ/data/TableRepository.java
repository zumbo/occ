package ch.aloba.occ.data;

import java.util.List;

import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import ch.aloba.occ.model.MainEntity;

public abstract class TableRepository {
    @Inject
    protected EntityManager em;

	public abstract MainEntity findById(Integer id);
	
	public List<? extends MainEntity> findAll() {
		CriteriaBuilder cb = em.getCriteriaBuilder();
		@SuppressWarnings("unchecked")
		CriteriaQuery<MainEntity> criteria = (CriteriaQuery<MainEntity>) cb.createQuery(getEntityClass());
		Root<? extends MainEntity> entity = criteria.from(getEntityClass());
		criteria.select(entity);
		return em.createQuery(criteria).getResultList();
	}
	
	public List<? extends MainEntity> findByTerritory(Integer territoryId) {
		CriteriaBuilder cb = em.getCriteriaBuilder();
		@SuppressWarnings("unchecked")
		CriteriaQuery<MainEntity> criteria = (CriteriaQuery<MainEntity>) cb.createQuery(getEntityClass());
		Root<? extends MainEntity> entity = criteria.from(getEntityClass());
		criteria.select(entity).where(cb.equal(entity.get("territory"), territoryId));
		return em.createQuery(criteria).getResultList();
	}

	protected abstract Class<? extends MainEntity> getEntityClass();
}
