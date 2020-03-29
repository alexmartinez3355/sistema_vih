package com.lania.sistemahiv.models.dao;

import org.springframework.data.repository.CrudRepository;

import com.lania.sistemahiv.models.entity.Usuarios;

// Esta clase extiende de CrudRepository y funcionara para obtener las funciones
// CRUD que se podran hacer a la base de datos
public interface UsuariosDao extends CrudRepository<Usuarios, Long>{
	
}
