package ch.aloba.occ.data;

import javax.enterprise.context.ApplicationScoped;
import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import java.util.ArrayList;
import java.util.List;

import ch.aloba.occ.model.Territoryrelation;
import ch.aloba.occ.model.Territoryview;

@ApplicationScoped
public class TerritoryviewRepository {

	@Inject
	private EntityManager em;

	@Inject
	TerritoryrelationRepository relationRepository;

	public Territoryview findById(Integer id, String lang) {
		CriteriaQuery<Territoryview> criteria = getCriteria(null, true, lang,
				id);
		List<Territoryview> res = em.createQuery(criteria).getResultList();
		if (res.size() != 1) {
			return null;
		}
		return res.get(0);
	}

	public List<Territoryview> findAll(String lang) {
		CriteriaQuery<Territoryview> criteria = getCriteria(null, null, lang,
				null);
		return em.createQuery(criteria).getResultList();
	}

	public List<Territoryview> findTopLevel(String lang) {
		CriteriaQuery<Territoryview> criteria = getCriteria(true, true, lang,
				null);
		return em.createQuery(criteria).getResultList();
	}

	public List<Territoryview> findRelated(Integer id, String lang) {
		List<Territoryrelation> relations = relationRepository.findByTarget(id);
		List<Territoryview> related = new ArrayList<Territoryview>();
		for (Territoryrelation relation : relations) {
			related.add(findById(relation.getSourceterritory(), lang));
		}
		return related;
	}

	private CriteriaQuery<Territoryview> getCriteria(Boolean toplevel,
			Boolean primary, String lang, Integer id) {
		CriteriaBuilder cb = em.getCriteriaBuilder();
		CriteriaQuery<Territoryview> criteria = cb
				.createQuery(Territoryview.class);
		Root<Territoryview> territory = criteria.from(Territoryview.class);
		List<Predicate> predicateList = new ArrayList<Predicate>();
		if (toplevel != null) {
			predicateList.add(cb.equal(territory.get("toplevel"), toplevel));
		}
		if (primary != null) {
			predicateList.add(cb.equal(territory.get("primary"), primary));
		}
		if (lang != null) {
			predicateList.add(cb.equal(territory.get("language"), lang));
		}
		if (id != null) {
			predicateList.add(cb.equal(territory.get("id"), id));
		}
		Predicate[] predicates = new Predicate[predicateList.size()];
		predicateList.toArray(predicates);
		criteria.select(territory).where(predicates);
		criteria.orderBy(cb.asc(territory.get("name")));
		return criteria;
	}

}
