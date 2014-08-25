package ch.aloba.occ.model;

import java.io.Serializable;

import javax.persistence.*;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;


@Entity
@IdClass(L10nViewId.class)
@NamedQuery(name="Epochview.findAll", query="SELECT e FROM Epochview e")
@JsonIgnoreProperties(ignoreUnknown = true, value = { "epoch", "epochl10n", "entity", "l10nEntity" })

public class Epochview extends ReadWriteViewEntity implements Serializable {
	private static final long serialVersionUID = 1L;


	@Id
	private int id;

	@Id
	private String language;

	private String name;

	private Integer startYear;
	private Integer endYear;
	private int territory;

	public Epochview() {
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

	public Integer getStartYear() {
		return this.startYear;
	}

	public void setStartYear(Integer startYear) {
		this.startYear = startYear;
	}
	
	public Integer getEndYear() {
		return this.endYear;
	}

	public void setEndYear(Integer endYear) {
		this.endYear = endYear;
	}
	
	public int getTerritory() {
		return territory;
	}

	public void setTerritory(int territory) {
		this.territory = territory;
	} 	
	
	public Epoch getEpoch() {
		Epoch epoch = new Epoch();
		epoch.setId(id);
		update(epoch);
		return epoch;
	}

	public Epochl10n getEpochl10n() {
		Epochl10n epochl10n = new Epochl10n();
		epochl10n.setEpoch(getEpoch());
		epochl10n.setLanguage(language);
		update(epochl10n);
		return epochl10n;
	} 

	@Override
	public void update(L10nEntity l10nEntity) {
		Epochl10n epochl10n = (Epochl10n)l10nEntity;
		epochl10n.setName(name);
	}

	@Override
	public void update(MainEntity entity) {
		Epoch epoch = (Epoch)entity;
		epoch.setStartYear(startYear);
		epoch.setEndYear(endYear);
		epoch.setTerritory(territory);
	}

	@Override
	public void update(ReadWriteViewEntity viewEntity) {
		Epochview epochview = (Epochview)viewEntity;
		epochview.setName(name);
	}

	@Override
	public MainEntity getEntity() {
		return getEpoch();
	}

	@Override
	public L10nEntity getL10nEntity() {
		return getEpochl10n();
	}
}