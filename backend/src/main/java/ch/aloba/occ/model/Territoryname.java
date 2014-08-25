package ch.aloba.occ.model;

import java.io.Serializable;
import javax.persistence.*;


@Entity
@NamedQuery(name="Territoryname.findAll", query="SELECT t FROM Territoryname t")
public class Territoryname implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	private int id;

	private String language;

	private String name;

	private int primary;

	public Territoryname() {
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

	public int getPrimary() {
		return this.primary;
	}

	public void setPrimary(int primary) {
		this.primary = primary;
	}
}