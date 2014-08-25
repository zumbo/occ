package ch.aloba.occ.model;

import java.io.Serializable;

import javax.persistence.*;


@Entity
public class Metall10n extends L10nEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private int id;

	private String language; 

	private String name;

	//bi-directional many-to-one association to Metal
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="parent")
	private Metal metal;

	public Metall10n() {
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
		return this.metal;
	}

	public void setMetal(Metal metal) {
		this.metal = metal;
	}

	@Override
	public void setParent(MainEntity parent) {
		setMetal((Metal) parent);
	}

}