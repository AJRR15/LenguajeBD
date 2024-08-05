/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Proyecto.Proyecto.Service.Impl;

import com.Proyecto.Proyecto.Service.RegistroService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import com.Proyecto.Proyecto.Domain.Usuario;
import com.Proyecto.Proyecto.Service.UsuarioService;

@Service
public class RegistroServiceImpl implements RegistroService {

    @Autowired
    private UsuarioService usuarioService;

    @Override
    public void save(Usuario usuario) {
        System.out.println("maeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee"+usuario.getUsername()+ usuario.getCorreo());
        System.out.println("maeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeeee"+usuarioService.existeUsuarioPorUsernameOCorreo(usuario.getUsername(), usuario.getCorreo()));
        if (usuarioService.existeUsuarioPorUsernameOCorreo(usuario.getUsername(), usuario.getCorreo())) {
            System.out.println("ayudaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa"+!usuarioService.existeUsuarioPorUsernameOCorreo(usuario.getUsername(), usuario.getCorreo()));
            var codigo = new BCryptPasswordEncoder();
            usuario.setPassword(codigo.encode(usuario.getPassword()));
            usuarioService.save2(usuario);
        } 
    }

}
