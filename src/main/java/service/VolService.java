package service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import model.CompagnieVol;
import model.Passager;
import model.Reservation;
import model.Vol;
import repositories.ReservationRepository;
import repositories.VolRepository;

@Service
public class VolService {
	
	@Autowired
	private VolRepository volRepository;
	@Autowired
	private ReservationRepository reservationRepository;
	
	
	
	public void createVol(Vol vol) {
		if (vol != null) {
			volRepository.save(vol);
		}
	}
	

	public void deleteVol(Integer idVol){
		Optional<Vol> opt = volRepository.findVolWithReservation(idVol);
		if (opt.isPresent()) {
			Vol vol = opt.get();
			List<Reservation> reservations = vol.getReservations();
				for(Reservation resa : reservations){    
					Optional<Reservation> optResa = reservationRepository.findById(resa.getNumeroReservation());  
	                if (optResa.isPresent()) { 
	                	resa.setVol(null);
	                	reservationRepository.save(resa);              
	                	}
				}
			}
			volRepository.deleteById(idVol);
		}
	

	
	public void deleteAllVol() {
		List<Vol> vols = volRepository.findAll();
		for(Vol vol : vols) {
			deleteVol(vol.getIdVol());
			}
	} 



	public void deleteVol(Vol vol) { 
		deleteVol(vol.getIdVol());   
		}
	
	
	
	
	public List<Vol> showAll(){
		List<Vol> vols = volRepository.findAll();
		return vols;
	}
	
	
	public Vol showVol(Integer idVol){
		Optional<Vol> opt = volRepository.findById(idVol);
		Vol vol = null;
		if (opt.isPresent()) {
			vol = opt.get();
		}
		return vol;
	}
	
	public List<Passager> showPassagerByVol(Integer idVol){
		List<Reservation> reservations = showReservationByVol(idVol);
		List<Passager> passagers = new ArrayList<>();
		for(Reservation resa : reservations) {
			Passager p = resa.getPassager();
			passagers.add(p);
		}
		return passagers;
	}
	
	public List<Reservation> showReservationByVol(Integer idVol){
		Optional<Vol> opt = volRepository.findVolWithReservation(idVol);
		List<Reservation> reservations = null;
		if (opt.isPresent()) {
			Vol vol = opt.get();
			reservations = vol.getReservations();
		}
		return reservations ;	
	}
	
	
	public List<CompagnieVol> showCompagniesByVol(Integer idVol){
		Optional<Vol> opt = volRepository.findVolWithCompagniesVol(idVol);
		List<CompagnieVol> compagniesVol = null;
		if (opt.isPresent()) {
			Vol vol = opt.get();
			 compagniesVol = vol.getCompagniesVol();
		}
		return compagniesVol ;	
	}
	
	public List<Vol> showVolByDateDepart(Date date){
		List<Vol> vols = volRepository.findByDateDepart(date);
		return vols;
	}
	
	public List<Vol> showVolByDateArrivee(Date date){
		List<Vol> vols = volRepository.findByDateArrivee(date);
		return vols;
	}

	
	public List<Vol> showVolByDateDepartBetween(Date date1, Date date2){
		List<Vol> vols = volRepository.findByHeureDepartBetween(date1, date2);
		return vols;
	}
	
	public List<Vol> showVolByDateArriveeBetween(Date date1, Date date2){
		List<Vol> vols = volRepository.findByHeureDepartBetween(date1, date2);
		return vols;
	}

	

}

