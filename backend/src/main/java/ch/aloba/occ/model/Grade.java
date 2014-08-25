package ch.aloba.occ.model;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;


@Entity
public class Grade extends MainEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;

	//bi-directional many-to-one association to Gradel10n
	@OneToMany(mappedBy="grade", cascade = CascadeType.ALL)
	private List<GradeL10n> gradel10ns;

	public Grade() {
	}

	public int getId() {
		return this.id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public List<GradeL10n> getGradel10ns() {
		return this.gradel10ns;
	}

	public void setGradel10ns(List<GradeL10n> gradel10ns) {
		this.gradel10ns = gradel10ns;
	}

	public GradeL10n addGradel10n(GradeL10n gradel10n) {
		gradel10ns.add(gradel10n);
		gradel10n.setGrade(this);

		return gradel10n;
	}

	public GradeL10n removeGradel10n(GradeL10n gradel10n) {
		gradel10ns.remove(gradel10n);
		gradel10n.setGrade(null);

		return gradel10n;
	}

}