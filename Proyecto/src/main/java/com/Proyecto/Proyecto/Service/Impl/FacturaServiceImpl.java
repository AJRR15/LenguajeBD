/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Proyecto.Proyecto.Service.Impl;

import com.Proyecto.Proyecto.Dao.FacturaDao;
import com.Proyecto.Proyecto.Domain.Factura;
import com.Proyecto.Proyecto.Service.FacturaService;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class FacturaServiceImpl implements FacturaService{
    
    @Autowired
    private FacturaDao facturaDao;

    @Override
    public List<Factura> getFacturas() {
        return facturaDao.getListfacturas();
    }
    
}
