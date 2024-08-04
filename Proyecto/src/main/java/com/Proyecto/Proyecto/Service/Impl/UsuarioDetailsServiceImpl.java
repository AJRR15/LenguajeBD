/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Proyecto.Proyecto.Service.Impl;

import jakarta.servlet.http.HttpSession;
import java.util.ArrayList;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import com.Proyecto.Proyecto.Dao.UsuarioDao;
import com.Proyecto.Proyecto.Domain.Rol;
import com.Proyecto.Proyecto.Domain.Usuario;
import com.Proyecto.Proyecto.Service.UsuarioDetailsService;
import java.util.List;

/**
 *
 * @author hhern
 */
@Service("userDetailsService")
public class UsuarioDetailsServiceImpl implements UsuarioDetailsService, UserDetailsService {

    @Autowired
    private UsuarioDao usuarioDao;

    @Override
    @Transactional(readOnly = true)
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        Usuario usuario = usuarioDao.getUsername(username);
        System.out.println("holaaaaa" + usuario);
        if (usuario == null) {
            throw new UsernameNotFoundException(username);
        }
        List<String> rolesString = usuarioDao.GET_ROLES(usuario.getIdUsuario());
        List<GrantedAuthority> roles = new ArrayList<>();

        for (String role : rolesString) {
            roles.add(new SimpleGrantedAuthority(role));
        }
        System.out.println("ayudaaaa" + roles);
        return new User(usuario.getUsername(), usuario.getPassword(), roles);
    }

}
