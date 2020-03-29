package com.lania.sistemahiv.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.lania.sistemahiv.models.entity.Usuarios;
import com.lania.sistemahiv.models.services.iUsuariosService;

/*
 * Esta clase es un API Rest.
 * Es una URL que se usa para conectar y
 * enviar datos o peticiones a la aplicacion.
 * Por ejemplo para enviar datos al FrontEnd con Angular
 */

@RestController // Indica que es un API Rest
@RequestMapping("/api") // Esta es el URL para acceder a los datos
public class UsuariosRestController {
	
	@Autowired
	private iUsuariosService usuarios_service;
	
	/*
	 * GetMapping sirve para dar el URL para acceder al metodo que nos traera la información
	 * que en este caso es la consulta de todos los datos de la tabla.
	 */
	@GetMapping("/usuarios") 
	public List<Usuarios> index(){
		return usuarios_service.findAll();
	}
}
