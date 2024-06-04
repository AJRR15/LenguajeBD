package com.Proyecto.Proyecto.Service.Impl;

import com.Proyecto.Proyecto.Dao.InformacionDao;
import com.Proyecto.Proyecto.Domain.Informacion;
import com.Proyecto.Proyecto.Service.InformacionService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class InformacionServiceImpl implements InformacionService {

    @Autowired
    private InformacionDao informacionDao;

    @Override
    @Transactional(readOnly = true)
    public List<Informacion> getInformaciones(String nombre) {
        if (nombre != null && !nombre.isEmpty()) {
            return informacionDao.findByNombre(nombre);
        } else {
            return informacionDao.findAll();
        }
    }

    @Override
    @Transactional(readOnly = true)
    public Informacion getInformacion(Informacion informacion) {
        return informacionDao.findById(informacion.getId_informacion()).orElse(null);
    }

    @Override
    @Transactional(readOnly = true)
    public void save(Informacion informacion) {
        informacionDao.save(informacion);
    }

    @Override
    @Transactional(readOnly = true)
    public void delete(Informacion informacion) {
        informacionDao.delete(informacion);
    }
}
