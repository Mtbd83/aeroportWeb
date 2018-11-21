package model;

import javax.persistence.Column;
import javax.persistence.DiscriminatorValue;
import javax.persistence.Entity;

@Entity
@DiscriminatorValue("El")
public class ClientEl extends Client {
	@Column
	private String titrePhysique;

	public ClientEl() {
		super();
	}

	public String getTitrePhysique() {
		return titrePhysique;
	}

	public void setTitrePhysique(String titrePhysique) {
		this.titrePhysique = titrePhysique;
	}

}
