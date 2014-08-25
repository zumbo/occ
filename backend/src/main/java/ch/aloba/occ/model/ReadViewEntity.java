package ch.aloba.occ.model;

public abstract class ReadViewEntity {

	public abstract int getId();

	public abstract String getLanguage();
	public abstract void setLanguage(String language);

	public abstract MainEntity getEntity();

	public abstract L10nEntity getL10nEntity();
}
