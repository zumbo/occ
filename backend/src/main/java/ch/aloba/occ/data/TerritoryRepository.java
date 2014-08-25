package ch.aloba.occ.data;

import javax.enterprise.context.ApplicationScoped;
import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Root;

import java.util.List;

import ch.aloba.occ.model.Territory;

@ApplicationScoped
public class TerritoryRepository {

    @Inject
    private EntityManager em;

    public Territory findById(Integer id) {
        return em.find(Territory.class, id);
    }

    public List<Territory> findAll() {
        CriteriaBuilder cb = em.getCriteriaBuilder();
        CriteriaQuery<Territory> criteria = cb.createQuery(Territory.class);
        Root<Territory> territory = criteria.from(Territory.class);
        criteria.select(territory);
        return em.createQuery(criteria).getResultList();
    }

    public List<Territory> findTopLevel() {
        CriteriaBuilder cb = em.getCriteriaBuilder();
        CriteriaQuery<Territory> criteria = cb.createQuery(Territory.class);
        Root<Territory> territory = criteria.from(Territory.class);
        criteria.select(territory).where(cb.equal(territory.get("toplevel"), 1));
        return em.createQuery(criteria).getResultList();
    }
}
