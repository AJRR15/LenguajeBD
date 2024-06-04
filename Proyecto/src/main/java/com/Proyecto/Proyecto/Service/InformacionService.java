package com.Proyecto.Proyecto.Service;

import java.util.List;
import com.Proyecto.Proyecto.Domain.Informacion;

public interface InformacionService {
    List<Informacion> getInformaciones(String nombre);
    Informacion getInformacion(Informacion informacion);
    void save(Informacion informacion);
    void delete(Informacion informacion);
}