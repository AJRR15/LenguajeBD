/*
 
Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
*/
package com.Proyecto.Proyecto.Dao;
import com.Proyecto.Proyecto.Domain.Informacion;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
/**
 *
 
@author alejh*/
@Repository
public interface InformacionDao extends JpaRepository<Informacion, Long> {
    List<Informacion> findByNombre(String nombre);
}