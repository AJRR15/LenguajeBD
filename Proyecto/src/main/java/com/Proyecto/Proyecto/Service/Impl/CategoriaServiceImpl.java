package com.Proyecto.Proyecto.Service.Impl;

import com.Proyecto.Proyecto.Dao.CategoriaDao;
import com.Proyecto.Proyecto.Domain.Categorias;
import com.Proyecto.Proyecto.Service.CategoriaService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Service
public class CategoriaServiceImpl implements CategoriaService {

     @Autowired
    private CategoriaDao categoriaDao;

    @Override
    @Transactional(readOnly = true)
    public List<Categorias> getCategorias(boolean activos) {
        var lista = categoriaDao.findAll();
        if (activos) {
            lista.removeIf(e -> !e.isActivo());
        }
        return lista;
    }

    @Override
    @Transactional(readOnly = true)
    public Categorias getCategoria(Categorias categoria) {
        return categoriaDao.findById(categoria.getIdCategoria()).orElse(null);
    }

    @Override
    @Transactional
    public void save(Categorias categoria) {
        categoriaDao.save(categoria);
    }

    @Override
    @Transactional
    public void delete(Categorias categoria) {
        categoriaDao.delete(categoria);
    }
    
}