package ch.aloba.occ.service;

import javax.ejb.Stateless;
import javax.inject.Inject;

import ch.aloba.occ.data.GradeRepository;
import ch.aloba.occ.data.Gradel10nRepository;
import ch.aloba.occ.data.GradeviewRepository;
import ch.aloba.occ.data.L10nRepository;
import ch.aloba.occ.data.TableRepository;
import ch.aloba.occ.data.ViewRepository;
import ch.aloba.occ.model.ReadViewEntity;

@Stateless
public class GradeViewRegistration extends ViewRegistration {
	
    @Inject
	GradeRepository tableRepository;

	@Inject
	GradeviewRepository viewRepository;

	@Inject
	Gradel10nRepository l10nRepository;

	@Inject
	Gradel10nRegistration l10nRegistration;

	@Inject
	GradeRegistration tableRegistration;

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
