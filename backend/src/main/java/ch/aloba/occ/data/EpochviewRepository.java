package ch.aloba.occ.data;

import javax.enterprise.context.ApplicationScoped;
import javax.inject.Inject;
import javax.persistence.EntityManager;

import ch.aloba.occ.model.Epochview;
import ch.aloba.occ.model.L10nViewId;

@ApplicationScoped
public class EpochviewRepository extends ViewRepository<Epochview> {

    @Inject
    private EntityManager em;

    public Epochview findById(Integer id, String language) {
    	L10nViewId viewId = new L10nViewId(id, language);
        return em.find(Epochview.class, viewId);
    }

	@Override
	protected Class<Epochview> getEntityClass() {
		return Epochview.class;
	}
}
