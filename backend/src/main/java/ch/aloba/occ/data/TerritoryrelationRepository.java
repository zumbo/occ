package ch.aloba.occ.data;

import java.util.List;

import javax.enterprise.context.ApplicationScoped;
import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import ch.aloba.occ.model.Territoryrelation;

@ApplicationScoped
public class TerritoryrelationRepository {

    @Inject
    private EntityManager em;

    public List<Territoryrelation> findBySource(Integer sourceId) {
        CriteriaQuery<Territoryrelation> criteria = getCriteria(sourceId, true);
        return em.createQuery(criteria).getResultList();
    }
    
    public List<Territoryrelation> findByTarget(Integer targetId) {
        CriteriaQuery<Territoryrelation> criteria = getCriteria(targetId, false);
        return em.createQuery(criteria).getResultList();
    }

    private CriteriaQuery<Territoryrelation> getCriteria(Integer territoryid, boolean isSource) {
        CriteriaBuilder cb = em.getCriteriaBuilder();
        CriteriaQuery<Territoryrelation> criteria = cb.createQuery(Territoryrelation.class);
        Root<Territoryrelation> territoryRelation = criteria.from(Territoryrelation.class);
        String idName = isSource ? "sourceterritory" : "targetterritory";
        criteria.select(territoryRelation).where(cb.equal(territoryRelation.get(idName), territoryid));
    	return criteria;
    }
	
}
