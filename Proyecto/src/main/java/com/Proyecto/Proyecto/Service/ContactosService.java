/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Proyecto.Proyecto.Service;

import com.Proyecto.Proyecto.Domain.Contactos;
import java.util.List;

/**
 *
 * @author alejh
 */
public interface ContactosService {
    
    List<Contactos> getContactos();

    public void save(Contactos contactos);

    public void delete(Contactos contactos);
}