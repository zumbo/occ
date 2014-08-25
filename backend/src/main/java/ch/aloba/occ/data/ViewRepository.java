package ch.aloba.occ.data;

import java.util.List;

import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import ch.aloba.occ.model.ReadViewEntity;

public abstract class ViewRepository<T extends ReadViewEntity> {

	@Inject
	protected EntityManager em;

	public abstract T findById(Integer id, String language);

	public List<T> findAll(String language) {
		CriteriaBuilder cb = em.getCriteriaBuilder();
		CriteriaQuery<T> criteria = (CriteriaQuery<T>) cb.createQuery(getEntityClass());
		Root<T> view = criteria.from(getEntityClass());
		criteria.select(view).where(cb.equal(view.get("language"), language));
		return em.createQuery(criteria).getResultList();
	}

	protected abstract Class<T> getEntityClass();

	public List<T> findAllIncludingEn(String language) {
		List<T> views = findAll(language);
		if (!language.equals("en")) {
			List<T> enViews = findAll("en");
			for (T enView : enViews) {
				if (findById(enView.getId(), language) == null) {
					enView.setLanguage(language);
					views.add(enView);
				}
			}
		}
		return views;
	}
	
	public List<T> findByTerritory(String language, Integer territoryId) {
		CriteriaBuilder cb = em.getCriteriaBuilder();
		CriteriaQuery<T> criteria = (CriteriaQuery<T>) cb.createQuery(getEntityClass());
		Root<T> entity = criteria.from(getEntityClass());
		Predicate filterLanguage = cb.equal(entity.get("language"), language);
		Predicate filterTerritory = cb.equal(entity.get("territory"), territoryId);
		criteria.select(entity).where(cb.and(filterLanguage, filterTerritory));
		return em.createQuery(criteria).getResultList();
	}


}
