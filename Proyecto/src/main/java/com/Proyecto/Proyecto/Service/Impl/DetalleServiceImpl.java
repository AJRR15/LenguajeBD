/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Proyecto.Proyecto.Service.Impl;


import com.Proyecto.Proyecto.Dao.Detalle_FacturaDao;
import com.Proyecto.Proyecto.Domain.Detalle_Factura;
import com.Proyecto.Proyecto.Service.DetalleService;
import com.Proyecto.Proyecto.Service.FacturaService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class DetalleServiceImpl implements DetalleService {
    
    @Autowired
    private Detalle_FacturaDao detalleDao;

    @Override
    public List<Detalle_Factura> getDetalles() {
        return detalleDao.getListdetalles();
    }

 
    
}
