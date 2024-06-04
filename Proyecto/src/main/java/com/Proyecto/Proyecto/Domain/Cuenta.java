/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Proyecto.Proyecto.Domain;
import jakarta.persistence.*;
import lombok.Data;
import java.io.Serializable;
/**
 *
 * @author alejh
 */
@Data
@Entity
@Table(name = "cuenta")
public class Cuenta {
    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id")
    private Long id;

    private String correo;
    private String nombre;
    private String contrasena;

    public Cuenta() {
    }

    public Cuenta(String correo, String nombre, String contrasena) {
        this.correo = correo;
        this.nombre = nombre;
        this.contrasena = contrasena;
    }

   
}
