package com.lania.sistemahiv.models.services;

import java.util.List;

import com.lania.sistemahiv.models.entity.Usuarios;

public interface iUsuariosService {
	
	// Método para buscar todos los elementos
	public List<Usuarios> findAll();
}
