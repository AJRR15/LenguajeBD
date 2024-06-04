/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Proyecto.Proyecto.Dao;
import org.springframework.data.jpa.repository.JpaRepository;
import com.Proyecto.Proyecto.Domain.Venta;

/**
 *
 * @author alejh
 */
public interface VentaDao extends JpaRepository <Venta,Long> {
 
}

