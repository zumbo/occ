package ch.aloba.occ.model;

import java.io.Serializable;
import javax.persistence.*;


@Entity
public class GradeL10n extends L10nEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private int id;

	private String abbr;

	private String language;

	private String name;

	//bi-directional many-to-one association to Grade
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="parent")
	private Grade grade;

	public GradeL10n() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getAbbr() {
		return this.abbr;
	}

	public void setAbbr(String abbr) {
		this.abbr = abbr;
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
		return this.grade;
	}

	public void setGrade(Grade grade) {
		this.grade = grade;
	}

	@Override
	public void setParent(MainEntity parent) {
		setGrade((Grade) parent);
	}
}