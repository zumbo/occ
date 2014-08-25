package ch.aloba.occ.model;

import java.io.Serializable;

import javax.persistence.*;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;


@Entity
@IdClass(L10nViewId.class)
@NamedQuery(name="Metalview.findAll", query="SELECT m FROM Metalview m")
@JsonIgnoreProperties(ignoreUnknown = true, value = { "metal", "metall10n", "entity", "l10nEntity" })

public class Metalview extends ReadWriteViewEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	private String abbr;

	@Id
	private int id;

	@Id
	private String language;

	private String name;

	public Metalview() {
	}

	public String getAbbr() {
		return this.abbr;
	}

	public void setAbbr(String abbr) {
		this.abbr = abbr;
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getLanguage() {
		return this.language;
	}

	public void setLanguage(String language) {
		this.language = language;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	public Metal getMetal() {
		Metal metal = new Metal();
		metal.setId(id);
		update(metal);
		return metal;
	}

	public Metall10n getMetall10n() {
		Metall10n metall10n = new Metall10n();
		metall10n.setMetal(getMetal());
		metall10n.setLanguage(language);
		update(metall10n);
		return metall10n;
	}

	@Override
	public void update(L10nEntity l10Entity) {
		Metall10n metall10n = (Metall10n)l10Entity;
		metall10n.setName(name);
	}

	@Override
	public void update(MainEntity mainEntity) {
		Metal metal = (Metal)mainEntity;
		metal.setAbbr(abbr);
	}

	@Override
	public void update(ReadWriteViewEntity viewEntity) {
		Metalview metalview = (Metalview) viewEntity; 
		metalview.setAbbr(abbr);
		metalview.setName(name);

	}

	@Override
	public MainEntity getEntity() {
		return getMetal();
	}

	@Override
	public L10nEntity getL10nEntity() {
		return getMetall10n();
	}
}