/*
 
Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Proyecto.Proyecto.Domain;

import jakarta.persistence.*;
import java.io.Serializable;
import java.util.List;
import lombok.Data;

/**
 *
 *
 * @author alejh
 */
@Data
@Entity
@Table(name = "informacion")
public class Informacion {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_informacion")
    private Long id_informacion;
    private String nombre;
    private int telefono;
    private String correo;

    public Informacion() {
    }

    public Informacion(Long id_informacion, String nombre, int telefono, String correo) {
        this.id_informacion = id_informacion;
        this.nombre = nombre;
        this.telefono = telefono;
        this.correo = correo;
    }
}
