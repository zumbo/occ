package ch.aloba.occ.model;

public abstract class ReadWriteViewEntity extends ReadViewEntity {
	
	public abstract void update(MainEntity entity);
	public abstract void update(L10nEntity l10nEntity);
	public abstract void update(ReadWriteViewEntity viewEntity);
}
