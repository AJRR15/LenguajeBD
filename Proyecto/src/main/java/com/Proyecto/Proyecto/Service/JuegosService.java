package com.Proyecto.Proyecto.Service;

import com.Proyecto.Proyecto.Domain.Categorias;
import com.Proyecto.Proyecto.Domain.Juegos;
import java.util.List;

public interface JuegosService {
    List<Juegos> getJuegos();
    
    List<Categorias> getCates();

    Juegos getJuego(Juegos juegos);

    public void save(Juegos juegos);

    public void delete(Juegos juegos);
    
    public void update(Long JID , String IMG ,String NOM, String EMP ,double PREC , int EXI, boolean EST , Long ID_CAT);

}