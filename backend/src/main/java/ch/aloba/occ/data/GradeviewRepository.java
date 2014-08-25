package ch.aloba.occ.data;

import javax.enterprise.context.ApplicationScoped;

import ch.aloba.occ.model.Gradeview;
import ch.aloba.occ.model.L10nViewId;

@ApplicationScoped
public class GradeviewRepository extends ViewRepository<Gradeview> {

	@Override
    public Gradeview findById(Integer id, String language) {
		L10nViewId viewId = new L10nViewId(id, language);
        return em.find(Gradeview.class, viewId);
    }

	@Override
	protected Class<Gradeview> getEntityClass() {
		return Gradeview.class;
	}
}
