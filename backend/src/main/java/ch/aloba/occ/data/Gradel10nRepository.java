package ch.aloba.occ.data;

import javax.enterprise.context.ApplicationScoped;

import ch.aloba.occ.model.GradeL10n;
import ch.aloba.occ.model.L10nEntity;

@ApplicationScoped
public class Gradel10nRepository extends L10nRepository {

	@Override
	protected String getParentName() {
		return "grade";
	}

	@Override
	protected Class<? extends L10nEntity> getEntityClass() {
		return GradeL10n.class;
	}

}
