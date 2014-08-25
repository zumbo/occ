package ch.aloba.occ.service;

import javax.ejb.Stateless;
import javax.inject.Inject;

import ch.aloba.occ.data.L10nRepository;
import ch.aloba.occ.data.MetalRepository;
import ch.aloba.occ.data.Metall10nRepository;
import ch.aloba.occ.data.MetalviewRepository;
import ch.aloba.occ.data.TableRepository;
import ch.aloba.occ.data.ViewRepository;
import ch.aloba.occ.model.ReadViewEntity;

@Stateless
public class MetalviewRegistration extends ViewRegistration {
	
    @Inject
	MetalRepository tableRepository;

	@Inject
	MetalviewRepository viewRepository;

	@Inject
	MetalRegistration tableRegistration;
	
	@Inject
	Metall10nRepository l10nRepository;

	@Inject
	Metall10nRegistration l10nRegistration;

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
