package ch.aloba.occ.data;

import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.NoResultException;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import ch.aloba.occ.model.L10nEntity;

public abstract class L10nRepository {
    @Inject
    protected EntityManager em;


	public L10nEntity findByLanguage(int parentId, String language) {
        CriteriaBuilder cb = em.getCriteriaBuilder();
        CriteriaQuery<? extends L10nEntity> query = cb.createQuery(getEntityClass());
        Root<? extends L10nEntity> l10nEntity = query.from(getEntityClass());
        query.where(cb.and(cb.equal(l10nEntity.get(getParentName()).get("id"), parentId),
        	               cb.equal(l10nEntity.get("language"), language)));
        L10nEntity result;
        try {
        	result = em.createQuery(query).getSingleResult();
        }
        catch (NoResultException e) {
        	return null;
        }
        return result;
	}
	
	protected abstract String getParentName();
	protected abstract Class<? extends L10nEntity> getEntityClass();

}
