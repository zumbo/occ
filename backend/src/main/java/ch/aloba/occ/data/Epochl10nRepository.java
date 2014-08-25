package ch.aloba.occ.data;

import javax.enterprise.context.ApplicationScoped;

import ch.aloba.occ.model.Epochl10n;

@ApplicationScoped
public class Epochl10nRepository extends L10nRepository {

	@Override
	protected String getParentName() {
		return "epoch";
	}

	@Override
	protected Class<Epochl10n> getEntityClass() {
		return Epochl10n.class;
	}
}
