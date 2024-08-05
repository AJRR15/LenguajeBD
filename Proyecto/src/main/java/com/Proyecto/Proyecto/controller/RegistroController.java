/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Proyecto.Proyecto.controller;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import com.Proyecto.Proyecto.Domain.Usuario;
import com.Proyecto.Proyecto.Service.RegistroService;
@Controller
@Slf4j
@RequestMapping("/registro")
public class RegistroController {
    @Autowired
    private RegistroService registroService;

    @GetMapping("/nuevo")
    public String nuevo(Usuario usuario) {
        return "/registro/new";
    }

    @PostMapping("/crearUsuario")
    public String crearUsuario(Usuario usuario){
        registroService.save(usuario);
        return "/login";
    }

}
