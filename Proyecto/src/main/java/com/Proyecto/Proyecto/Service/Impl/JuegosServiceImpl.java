package com.Proyecto.Proyecto.Service.Impl;

import com.Proyecto.Proyecto.Dao.JuegosDao;
import com.Proyecto.Proyecto.Service.JuegosService;
import com.Proyecto.Proyecto.Domain.Juegos;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class JuegosServiceImpl implements JuegosService {

    @Autowired
    private JuegosDao juegosDao;

    @Override
    @Transactional(readOnly = true)
    public List<Juegos> getJuegos(String juegos) {
        if (juegos != null && !juegos.isEmpty()) {
            return juegosDao.getOneJuegos(juegos);
        } else {
            return juegosDao.getListJuegos();
        }
    }
    
 

    @Override
    @Transactional(readOnly = true)
    public Juegos getJuego(Juegos juegos) {
    return juegosDao.getOneJuegosId(juegos.getId_juego());
}


    @Override
    @Transactional
    public void save(Juegos juegos) {
        juegosDao.saveJuegos(juegos);
    }

    @Override
    @Transactional
    public void delete(Juegos juegos) {
        juegosDao.deleteJuegos(juegos.getId_juego());
    }

    @Override
    @Transactional(readOnly = true)
    public List<Juegos> findByPrecioBetweenOrderByPrecio(double precioInf, double precioSup) {
        return juegosDao.getJuegosPorPrecio(precioInf, precioSup);
    }

    @Override
    @Transactional(readOnly = true)
    public List<Juegos> getJuegosPorCategoria(Long categoriaId) {
        return juegosDao.getOneJuegosIdCategoria(categoriaId);
    }

    @Override
    @Transactional(readOnly = true)
    public List<Juegos> getJuegosConFiltros(Double precioInf, Double precioSup, Long categoriaId) {
        if (precioInf != null && precioSup != null && categoriaId != null) {
            return juegosDao.getJuegosConFiltros(precioInf, precioSup, categoriaId);
        } else if (precioInf != null && precioSup != null) {
            return juegosDao.getJuegosPorPrecio(precioInf, precioSup);
        } else if (categoriaId != null) {
            return juegosDao.getOneJuegosIdCategoria(categoriaId);
        } else {
            return juegosDao.getListJuegos(); // Retornar todos los juegos si no se aplican filtros
        }
    }
        @Override
    @Transactional(readOnly = true)
    public List<Juegos> findByNombreContaining(String nombre) {
        return juegosDao.getOneJuegos(nombre);
    }

   
  
}