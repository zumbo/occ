package ch.aloba.occ.data;

import javax.enterprise.context.ApplicationScoped;

import ch.aloba.occ.model.Metall10n;

@ApplicationScoped
public class Metall10nRepository extends L10nRepository {

	@Override
	protected String getParentName() {
		return "metal";
	}

	@Override
	protected Class<Metall10n> getEntityClass() {
		return Metall10n.class;
	}
}
