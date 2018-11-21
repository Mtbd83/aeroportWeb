package service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

import model.Client;
import model.Reservation;
import repositories.ClientRepository;
import repositories.ReservationRepository;

@Service
public class ClientService {

	@Autowired
	private ClientRepository clientRepository;

	@Autowired
	private ReservationRepository reservationRepository;
	
	public void createclient(Client client) {
		if (client != null) {
			clientRepository.save(client);
		}
	}
<<<<<<< HEAD

=======
	
	
	
>>>>>>> master
	public void deleteclient(Integer idclient){
		Optional<Client> opt = clientRepository.findById(idclient);
		if (opt.isPresent()) {
			Client client = opt.get();
			List<Reservation> reservations = client.getReservations();
				for(Reservation resa : reservations){    
					Optional<Reservation> optResa = reservationRepository.findById(resa.getNumeroReservation());  
	                if (optResa.isPresent()) { 
	                	resa.setClient(null);
	                	reservationRepository.save(resa);              
	                	}
				}
			}
			clientRepository.deleteById(idclient);
		}
<<<<<<< HEAD

	public void deleteAllclient() {
		List<Client> clients = clientRepository.findAll();
		for(Client client : clients) {
			deleteclient(client.getIdClient());
			}
	} 
=======
	

	
	public void deleteAllclient() {
		List<Client> clients = clientRepository.findAll();
		for(Client client : clients) {
			deleteclient(client.getIdClient());
			}
	} 


>>>>>>> master

	public void deleteclient(Client client) { 
		deleteclient(client.getIdClient());   
		}
	
<<<<<<< HEAD
=======
	
	
	
>>>>>>> master
	public List<Client> showAll(){
		List<Client> clients = clientRepository.findAll();
		return clients;
	}
<<<<<<< HEAD

=======
	
	
>>>>>>> master
	public Client showclient(Integer idclient){
		Optional<Client> opt = clientRepository.findById(idclient);
		Client client = null;
		if (opt.isPresent()) {
			client = opt.get();
		}
		return client;
	}
}
