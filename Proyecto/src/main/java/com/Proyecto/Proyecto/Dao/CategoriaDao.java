package com.Proyecto.Proyecto.Dao;

import com.Proyecto.Proyecto.Domain.Categorias;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface CategoriaDao extends JpaRepository<Categorias, Long> {
    
}