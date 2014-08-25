package ch.aloba.occ.model;

import java.io.Serializable;

import javax.persistence.*;

import org.codehaus.jackson.annotate.JsonIgnoreProperties;

@Entity
@IdClass(L10nViewId.class)
@NamedQuery(name = "Gradeview.findAll", query = "SELECT g FROM Gradeview g")
@JsonIgnoreProperties(ignoreUnknown = true, value = { "grade", "gradel10n", "entity", "l10nEntity" })
public class Gradeview extends ReadWriteViewEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	private String abbr;

	@Id
	private int id;

	@Id
	private String language;

	private String name;

	public Gradeview() {
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

	public Grade getGrade() {
		Grade grade = new Grade();
		grade.setId(id);
		update(grade);
		return grade;
	}

	public GradeL10n getGradel10n() {
		GradeL10n gradel10n = new GradeL10n();
		gradel10n.setGrade(getGrade());
		gradel10n.setLanguage(language);
		update(gradel10n);
		return gradel10n;
	} 

	@Override
	public void update(L10nEntity l10nEntity) {
		GradeL10n gradel10n = (GradeL10n)l10nEntity;
		gradel10n.setAbbr(abbr);
		gradel10n.setName(name);
	}

	@Override
	public void update(MainEntity grade) {
	}

	@Override
	public void update(ReadWriteViewEntity viewEntity) {
		Gradeview gradeview = (Gradeview)viewEntity;
		gradeview.setAbbr(abbr);
		gradeview.setName(name);
	}

	@Override
	public MainEntity getEntity() {
		return getGrade();
	}

	@Override
	public L10nEntity getL10nEntity() {
		return getGradel10n();
	} 
}
