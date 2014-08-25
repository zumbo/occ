package ch.aloba.occ.model;

import java.io.Serializable;

import javax.persistence.*;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;

@Entity
@IdClass(L10nViewId.class)
@NamedQuery(name = "Qualityview.findAll", query = "SELECT q FROM Qualityview q")
@JsonIgnoreProperties(ignoreUnknown = true, value = { "quality", "qualityl10n", "entity", "l10nEntity" })
public class Qualityview extends ReadWriteViewEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	private String abbr;

	@Id
	private int id;

	@Id
	private String language;

	private String name;

	public Qualityview() {
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

	public Quality getQuality() {
		Quality quality = new Quality();
		quality.setId(id);
		update(quality);
		return quality;
	}

	public QualityL10n getQualityl10n() {
		QualityL10n qualityl10n = new QualityL10n();
		qualityl10n.setQuality(getQuality());
		qualityl10n.setLanguage(language);
		update(qualityl10n);
		return qualityl10n;
	}

	@Override
	public void update(L10nEntity l10nEntity) {
		QualityL10n qualityl10n = (QualityL10n)l10nEntity;
		qualityl10n.setAbbr(abbr);
		qualityl10n.setName(name);
	}

	@Override
	public void update(MainEntity quality) {
	}

	@Override
	public void update(ReadWriteViewEntity viewEntity) {
		Qualityview qualityview = (Qualityview)viewEntity;
		qualityview.setAbbr(abbr);
		qualityview.setName(name);

	}


	@Override
	public MainEntity getEntity() {
		return getQuality();
	}

	@Override
	public L10nEntity getL10nEntity() {
		return getQualityl10n();
	}
}
