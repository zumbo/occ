package ch.aloba.occ.data;

import javax.enterprise.context.ApplicationScoped;

import ch.aloba.occ.model.L10nViewId;
import ch.aloba.occ.model.Qualityview;

@ApplicationScoped
public class QualityviewRepository extends ViewRepository<Qualityview> {

	@Override
    public Qualityview findById(Integer id, String language) {
		L10nViewId viewId = new L10nViewId(id, language);
        return em.find(Qualityview.class, viewId);
    }

	@Override
	protected Class<Qualityview> getEntityClass() {
		return Qualityview.class;
	}
}
