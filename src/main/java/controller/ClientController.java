package controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import model.Titre;
import model.Client;
import model.ClientEl;
import model.ClientMoral;
import model.ClientPhysique;
import service.ClientService;

@Controller
@RequestMapping("/client")
public class ClientController {

	@Autowired
	private ClientService clientService;
	
	@RequestMapping("")
	public ModelAndView home() {
		return new ModelAndView("redirect:/client/");
	}
	
	@GetMapping("/")
	public ModelAndView list() {
		ModelAndView modelAndView = new ModelAndView("client/list", "clients", clientService.showAll());
		return modelAndView;
	}
	
	@GetMapping("/delete")
	public ModelAndView delete(@RequestParam(name="idClient", required=true) Integer idClient) {
		clientService.deleteClient(idClient);
		return new ModelAndView("redirect:/client/");
	}
	
	private ModelAndView goEdit(Client client) {
		ModelAndView modelAndView = new ModelAndView("client/form", "client", client);
		modelAndView.addObject("titres", Titre.values());
		modelAndView.addObject("login", client.getLogin());
		return modelAndView;
	}
	
	@GetMapping("/form")
	public ModelAndView edit(@RequestParam(name="idClient", required=true) Integer idClient) {
		Client client = clientService.showclient(idClient);
		return goEdit(client);
	}
	
	@GetMapping("/addClientEl")
	public ModelAndView addClientEl() {
		return goEdit(new ClientEl());
	}
	
	@GetMapping("/addClientMoral")
	public ModelAndView addClientMoral() {
		return goEdit(new ClientMoral());
	}
	
	@GetMapping("/addClientPhysique")
	public ModelAndView addClientPhysique() {
		return goEdit(new ClientPhysique());
	}
	
	@PostMapping("/saveClientEl")
	public ModelAndView saveClientEl(@Valid @ModelAttribute(name="client") ClientEl client, BindingResult result) {
		return save(client, result);
	}
	
	@PostMapping("/saveClientMoral")
	public ModelAndView saveClientMoral(@Valid @ModelAttribute(name="client") ClientMoral client, BindingResult result) {
		return save(client, result);
	}
	
	@PostMapping("/saveClientPhysique")
	public ModelAndView saveClientPhysique(@Valid @ModelAttribute(name="client") ClientPhysique client, BindingResult result) {
		return save(client, result);
	}
	
	private ModelAndView save(Client client, BindingResult result) {
		if(result.hasErrors()) {
			return goEdit(client);
		}
		return new ModelAndView("redirect:/client/");
	}
	
}