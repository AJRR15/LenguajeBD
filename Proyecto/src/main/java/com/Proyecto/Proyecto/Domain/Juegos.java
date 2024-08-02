package com.Proyecto.Proyecto.Domain;

import jakarta.persistence.*;
import java.io.Serializable;
import lombok.Data;

@Data
@Entity
@Table(name = "juego")
public class Juegos implements Serializable {
    
    private static final long serialVersionUID = 1L;
    
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "id_juego")
    private Long id_juego;
    private String imagen;
    private String nombre;
    private String empresa;
    private double precio;
    private int existencias;
<<<<<<< Updated upstream
    private boolean activo;
    
    @ManyToOne
    @JoinColumn(name="id_categoria")
    private Categorias categoria;

=======
    @Column(name = "ESTADO")
    private boolean estado;
    @Column(name="ID_CATEGORIA")
    private Long categoria;
    
>>>>>>> Stashed changes
    public Juegos() {
    }

    
}