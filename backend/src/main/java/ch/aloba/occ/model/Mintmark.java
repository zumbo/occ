package ch.aloba.occ.model;

import java.io.Serializable;

import javax.persistence.*;


@Entity
public class Mintmark extends MainEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;

	private String mintname;

	private String name;

	private int territory;

	public Mintmark() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getMintname() {
		return this.mintname;
	}

	public void setMintname(String mintname) {
		this.mintname = mintname;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getTerritory() {
		return this.territory;
	}

	public void setTerritory(int territory) {
		this.territory = territory;
	}

}