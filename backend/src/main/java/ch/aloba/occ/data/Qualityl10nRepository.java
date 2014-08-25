package ch.aloba.occ.data;

import javax.enterprise.context.ApplicationScoped;

import ch.aloba.occ.model.L10nEntity;
import ch.aloba.occ.model.QualityL10n;

@ApplicationScoped
public class Qualityl10nRepository extends L10nRepository {

	@Override
	protected String getParentName() {
		return "quality";
	}

	@Override
	protected Class<? extends L10nEntity> getEntityClass() {
		return QualityL10n.class;
	}

}
