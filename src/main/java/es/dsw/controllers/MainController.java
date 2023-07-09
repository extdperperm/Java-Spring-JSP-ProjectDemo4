package es.dsw.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import es.dsw.events.SessionEvents;

@Controller
public class MainController {
	
	@GetMapping(value = {"/","/index"})
	public String index(Model objModel) {
		
		//Se realiza una lectura del contador (definido en memoria de aplicación) que indica el número de sesiones activas en la aplicación.
		//Recuerda: Todo atributo estático se almacena en memoria de aplicación, aunque está puede ser ledia/escrita por el hilo del usuario.
		objModel.addAttribute("NumSesiones", SessionEvents.getTotalActiveSession());
		
		return "index";
	}

}
