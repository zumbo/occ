package ch.aloba.occ.data;

import javax.enterprise.context.ApplicationScoped;
import javax.inject.Inject;
import javax.persistence.EntityManager;

import ch.aloba.occ.model.Metalview;
import ch.aloba.occ.model.L10nViewId;

@ApplicationScoped
public class MetalviewRepository extends ViewRepository<Metalview> {

    @Inject
    private EntityManager em;

    public Metalview findById(Integer id, String language) {
    	L10nViewId viewId = new L10nViewId(id, language);
        return em.find(Metalview.class, viewId);
    }

	@Override
	protected Class<Metalview> getEntityClass() {
		return Metalview.class;
	}
}
