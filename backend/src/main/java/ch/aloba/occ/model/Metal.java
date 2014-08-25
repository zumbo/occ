package ch.aloba.occ.model;

import java.io.Serializable;

import javax.persistence.*;

import java.util.List;


@Entity
@NamedQuery(name="Metal.findAll", query="SELECT m FROM Metal m")
public class Metal extends MainEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;

	private String abbr; 

	//bi-directional many-to-one association to Metall10n
	@OneToMany(mappedBy="metal",  cascade = CascadeType.ALL)
	private List<Metall10n> metall10ns;

	public Metal() {
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

	public List<Metall10n> getMetall10ns() {
		return this.metall10ns;
	}

	public void setMetall10ns(List<Metall10n> metall10ns) {
		this.metall10ns = metall10ns;
	}

	public Metall10n addMetall10n(Metall10n metall10n) {
		metall10ns.add(metall10n);
		metall10n.setMetal(this);

		return metall10n;
	}

	public Metall10n removeMetall10n(Metall10n metall10n) {
		metall10ns.remove(metall10n);
		metall10n.setMetal(null);

		return metall10n;
	}

}