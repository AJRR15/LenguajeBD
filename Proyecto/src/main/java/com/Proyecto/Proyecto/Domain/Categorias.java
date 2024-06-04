package com.Proyecto.Proyecto.Domain;

import jakarta.persistence.*;
import java.io.Serializable;
import java.util.List;
import lombok.Data;

@Data
@Entity
@Table(name = "categoria")
public class Categorias implements Serializable {

    private static final long serialVersionUID = 1L;

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_categoria")
    private Long idCategoria ;
    private String descripcion;
    private String rutaImagen;
    private boolean activo;

    @OneToMany
    @JoinColumn(name = "id_categoria", updatable = false)
    List<Juegos> juegos;

    public Categorias() {
    }

    public Categorias(Long idCategoria, String descripcion, String rutaImagen, boolean activo) {
        this.idCategoria = idCategoria;
        this.descripcion = descripcion;
        this.rutaImagen = rutaImagen;
        this.activo = activo;
    }



}