package ch.aloba.occ.model;

import java.io.Serializable;

import javax.persistence.*;


@Entity
@NamedQuery(name="Epochl10n.findAll", query="SELECT e FROM Epochl10n e")
public class Epochl10n extends L10nEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private int id;

	private String language;

	private String name;

	//bi-directional many-to-one association to Grade
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn(name="parent")
	private Epoch epoch;

	public Epochl10n() {
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

	public Epoch getEpoch() {
		return this.epoch;
	}

	public void setEpoch(Epoch epoch) {
		this.epoch = epoch;
	}	
	
	@Override
	public void setParent(MainEntity parent) {
		setEpoch((Epoch) parent);
	}

}