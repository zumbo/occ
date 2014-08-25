package ch.aloba.occ.service;

import javax.ejb.Stateless;
import javax.inject.Inject;

import ch.aloba.occ.data.QualityRepository;
import ch.aloba.occ.data.Qualityl10nRepository;
import ch.aloba.occ.data.QualityviewRepository;
import ch.aloba.occ.data.L10nRepository;
import ch.aloba.occ.data.TableRepository;
import ch.aloba.occ.data.ViewRepository;
import ch.aloba.occ.model.ReadViewEntity;

@Stateless
public class QualityViewRegistration extends ViewRegistration {
	
    @Inject
	QualityRepository tableRepository;

	@Inject
	QualityviewRepository viewRepository;

	@Inject
	Qualityl10nRepository l10nRepository;

	@Inject
	Qualityl10nRegistration l10nRegistration;

	@Inject
	QualityRegistration tableRegistration;

	@Override
	protected TableRegistration getTableRegistration() {
		return tableRegistration;
	}

	@Override
	protected L10nRegistration getL10nRegistration() {
		return l10nRegistration;
	}

	@Override
	protected ViewRepository<? extends ReadViewEntity> getViewRepository() {
		return viewRepository;
	}

	@Override
	protected TableRepository getTableRepository() {
		return tableRepository;
	}

	@Override
	protected L10nRepository getL10nRepository() {
		return l10nRepository;
	}
}
