package com.lania.sistemahiv.models.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.lania.sistemahiv.models.dao.UsuariosDao;
import com.lania.sistemahiv.models.entity.Usuarios;

@Service // Con esta anotación esta clase queda marcada como un servicio
public class UsuariosServiceImplementacion implements iUsuariosService {
	
	@Autowired
	private UsuariosDao usuarios_dao;
	
	@Override
	@Transactional(readOnly = true)
	public List<Usuarios> findAll() {
		
		// Usando la variable "Dao" se accede a los metodos disponibles para el CRUD 
		// ya que el dao extiende directamente del CrudRepository.
		return (List<Usuarios>) usuarios_dao.findAll();
	}

}
