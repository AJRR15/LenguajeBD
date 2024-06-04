package com.Proyecto.Proyecto.Service;

import com.Proyecto.Proyecto.Domain.Categorias;
import java.util.List;

public interface CategoriaService {

    public List<Categorias> getCategorias(boolean activo);

    // Se obtiene un Categoria, a partir del id de un categoria
    public Categorias getCategoria(Categorias categoria);
    
    // Se inserta un nuevo categoria si el id del categoria esta vacío
    // Se actualiza un categoria si el id del categoria NO esta vacío
    public void save(Categorias categoria);
    
    // Se elimina el categoria que tiene el id pasado por parámetro
    public void delete(Categorias categoria);
}