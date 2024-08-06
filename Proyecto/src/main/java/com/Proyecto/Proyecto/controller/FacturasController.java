/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Proyecto.Proyecto.controller;

import com.Proyecto.Proyecto.Service.DetalleService;
import com.Proyecto.Proyecto.Service.FacturaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 *
 * @author hhern
 */
@Controller
@RequestMapping("/factura")
public class FacturasController {
    @Autowired
    private FacturaService facturaService;
    @Autowired
    private DetalleService detalleService;
    
    @GetMapping("/listado")
    public String listado(Model model) {
        var facturas = facturaService.getFacturas();
        var detalles = detalleService.getDetalles();
        model.addAttribute("facturas", facturas);
        model.addAttribute("detalles", detalles);
        return "/factura/listado";
    }
}
