package com.Proyecto.Proyecto.controller;


import com.Proyecto.Proyecto.Domain.Categorias;
import com.Proyecto.Proyecto.Service.CategoriaService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

@Controller
@RequestMapping("/categoria")
public class CategoriaController {
  
    @Autowired
    private CategoriaService categoriaService;
    
    @GetMapping("/categorias")
    private String listado(Model model) {
        var categorias = categoriaService.getCategorias(false);
        model.addAttribute("categorias", categorias);
        model.addAttribute("totalCategorias",categorias.size());
        return "/categoria/categorias";
    }
    
     @GetMapping("/nuevo")
    public String categoriaNuevo(Categorias categoria) {
        return "/categoria/modifica";
    }

    @PostMapping("/guardar")
    public String categoriaGuardar(Categorias categoria) {        
        categoriaService.save(categoria);
        return "redirect:/categoria/categorias";
    }

    @GetMapping("/eliminar/{idCategoria}")
    public String categoriaEliminar(Categorias categoria) {
        categoriaService.delete(categoria);
        return "redirect:/categoria/categorias";
    }

    @GetMapping("/modificar/{idCategoria}")
    public String categoriaModificar(Categorias categoria, Model model) {
        categoria = categoriaService.getCategoria(categoria);
        model.addAttribute("categoria", categoria);
        return "/categoria/modifica";
    }   
}