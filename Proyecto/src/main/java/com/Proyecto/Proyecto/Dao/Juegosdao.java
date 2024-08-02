package com.Proyecto.Proyecto.Dao;

import com.Proyecto.Proyecto.Domain.Categorias;
import com.Proyecto.Proyecto.Domain.Juegos;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.List;
import java.util.Map;
import org.springframework.jdbc.core.SqlParameter;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;
import org.springframework.stereotype.Repository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;


@Repository
public class JuegosDao {

    @Autowired
    JdbcTemplate jdbcTemplate;

    public List<Juegos> getListJuegos() {
        SimpleJdbcCall simpleJdbcCall = new SimpleJdbcCall(jdbcTemplate)
                .withSchemaName("ADMINISTRADOR")
                .withProcedureName("GET_JUEGOS")
                .declareParameters(new SqlParameter("DATOS", Types.REF_CURSOR))
                .returningResultSet("DATOS", new RowMapper<Juegos>() {
                    @Override
                    public Juegos mapRow(ResultSet rs, int rowNum) throws SQLException {
                        Juegos juego = new Juegos();
                        juego.setId_juego(rs.getLong("ID_JUEGO"));
                        juego.setImagen(rs.getString("IMAGEN"));
                        juego.setNombre(rs.getString("NOMBRE"));
                        juego.setEmpresa(rs.getString("EMPRESA"));
                        juego.setPrecio(rs.getInt("PRECIO"));
                        juego.setExistencias(rs.getInt("EXISTENCIAS"));
                        juego.setEstado(rs.getBoolean("ESTADO"));
                        juego.setCategoria(rs.getLong("ID_CATEGORIA"));
                        return juego;
                    }
                });
        MapSqlParameterSource mapSqlParameterSource = new MapSqlParameterSource();
        Map<String, Object> results = simpleJdbcCall.execute(mapSqlParameterSource);
        List<Juegos> juegoList = (List<Juegos>) results.get("DATOS");
        return juegoList;
    }

    public Juegos getOneJuegosId(Long id) {
        SimpleJdbcCall simpleJdbcCall = new SimpleJdbcCall(jdbcTemplate)
                .withSchemaName("ADMINISTRADOR")
                .withProcedureName("GET_ONE_JUEGO")
                .declareParameters(new SqlParameter("CID", Types.BIGINT),new SqlParameter("DATOS", Types.REF_CURSOR))
                .returningResultSet("DATOS", new RowMapper<Juegos>() {
                    @Override
                    public Juegos mapRow(ResultSet rs, int rowNum) throws SQLException {
                        Juegos juego = new Juegos();
                          juego.setId_juego(rs.getLong("ID_JUEGO"));
                        juego.setImagen(rs.getString("IMAGEN"));
                        juego.setNombre(rs.getString("NOMBRE"));
                        juego.setEmpresa(rs.getString("EMPRESA"));
                        juego.setPrecio(rs.getInt("PRECIO"));
                        juego.setExistencias(rs.getInt("EXISTENCIAS"));
                        juego.setEstado(rs.getBoolean("ESTADO"));
                        juego.setCategoria(rs.getLong("ID_CATEGORIA"));
                        return juego;
                    }
                });
        MapSqlParameterSource mapSqlParameterSource = new MapSqlParameterSource();
        mapSqlParameterSource.addValue("CID", id);
        Map<String, Object> results = simpleJdbcCall.execute(mapSqlParameterSource);
        List<Juegos> juegoList = (List<Juegos>) results.get("DATOS");
        return juegoList.isEmpty() ? null : juegoList.get(0);
    }
    
    public List<Juegos> getOneJuegos(String NOMBRE) {
        SimpleJdbcCall simpleJdbcCall = new SimpleJdbcCall(jdbcTemplate)
                .withSchemaName("ADMINISTRADOR")
                .withProcedureName("GET_ONE_JUEGO_NOMBRE")
                .declareParameters(new SqlParameter("NOM", Types.BIGINT),new SqlParameter("DATOS", Types.REF_CURSOR))
                .returningResultSet("DATOS", new RowMapper<Juegos>() {
                    @Override
                    public Juegos mapRow(ResultSet rs, int rowNum) throws SQLException {
                        Juegos juego = new Juegos();
                        juego.setId_juego(rs.getLong("ID_JUEGO"));
                        juego.setImagen(rs.getString("IMAGEN"));
                        juego.setNombre(rs.getString("NOMBRE"));
                        juego.setEmpresa(rs.getString("EMPRESA"));
                        juego.setPrecio(rs.getInt("PRECIO"));
                        juego.setExistencias(rs.getInt("EXISTENCIAS"));
                        juego.setEstado(rs.getBoolean("ESTADO"));
                        juego.setCategoria(rs.getLong("ID_CATEGORIA"));
                        return juego;
                    }
                });
        MapSqlParameterSource mapSqlParameterSource = new MapSqlParameterSource();
        mapSqlParameterSource.addValue("NOM", NOMBRE);
        Map<String, Object> results = simpleJdbcCall.execute(mapSqlParameterSource);
        List<Juegos> juegoList = (List<Juegos>) results.get("DATOS");
        return juegoList;
    }

    public void saveJuegos(Juegos juego) {
        SimpleJdbcCall simpleJdbcCall = new SimpleJdbcCall(jdbcTemplate)
                .withSchemaName("ADMINISTRADOR")
                .withProcedureName("ADD_JUEGO")
                .declareParameters(
                        new SqlParameter("IMG", Types.VARCHAR),
                        new SqlParameter("NOM", Types.VARCHAR),
                        new SqlParameter("EMP", Types.VARCHAR),
                        new SqlParameter("PREC", Types.INTEGER),
                        new SqlParameter("EXI", Types.INTEGER),
                        new SqlParameter("EST", Types.BOOLEAN),
                        new SqlParameter("ID_CAT", Types.INTEGER)
                                  
                );
        MapSqlParameterSource mapSqlParameterSource = new MapSqlParameterSource();
        mapSqlParameterSource.addValue("IMG", juego.getImagen());
        mapSqlParameterSource.addValue("NOM", juego.getNombre());
        mapSqlParameterSource.addValue("EMP", juego.getEmpresa());
        mapSqlParameterSource.addValue("PREC", juego.getPrecio());
        mapSqlParameterSource.addValue("EXI", juego.getExistencias());
        mapSqlParameterSource.addValue("EST", juego.isEstado());
        mapSqlParameterSource.addValue("ID_CAT", juego.getCategoria());
        simpleJdbcCall.execute(mapSqlParameterSource);
    }
    
    public void deleteJuegos(Long id) {
        SimpleJdbcCall simpleJdbcCall = new SimpleJdbcCall(jdbcTemplate)
                .withSchemaName("ADMINISTRADOR")
                .withProcedureName("DELETE_JUEGO")
                .declareParameters(new SqlParameter("CID", Types.BIGINT));
        MapSqlParameterSource mapSqlParameterSource = new MapSqlParameterSource();
        mapSqlParameterSource.addValue("CID", id);
        simpleJdbcCall.execute(mapSqlParameterSource);
    }
    
    public void updateJuegos(Long CID, String DESCRIP,String IMG,boolean ACT) {
        SimpleJdbcCall simpleJdbcCall = new SimpleJdbcCall(jdbcTemplate)
                .withSchemaName("ADMINISTRADOR")
                .withProcedureName("UPDATE_JUEGO")
                .declareParameters(
                         new SqlParameter("IMG", Types.VARCHAR),
                        new SqlParameter("NOM", Types.VARCHAR),
                        new SqlParameter("EMP", Types.VARCHAR),
                        new SqlParameter("PREC", Types.INTEGER),
                        new SqlParameter("EXI", Types.INTEGER),
                        new SqlParameter("EST", Types.BOOLEAN),
                        new SqlParameter("ID_CAT", Types.INTEGER)
                );
        MapSqlParameterSource mapSqlParameterSource = new MapSqlParameterSource();
       // mapSqlParameterSource.addValue("CID",CID);
       // mapSqlParameterSource.addValue("DESCRIP", DESCRIP);
       // mapSqlParameterSource.addValue("IMG", IMG);
       // mapSqlParameterSource.addValue("ACT", ACT);
        simpleJdbcCall.execute(mapSqlParameterSource);
    }
    
        
     
         public List<Juegos> getOneJuegosIdCategoria(Long id) {
        SimpleJdbcCall simpleJdbcCall = new SimpleJdbcCall(jdbcTemplate)
                .withSchemaName("ADMINISTRADOR")
                .withProcedureName("GET_ONE_JUEGO_xCATEGORIA")
                .declareParameters(new SqlParameter("ID_CAT", Types.BIGINT),new SqlParameter("DATOS", Types.REF_CURSOR))
                .returningResultSet("DATOS", new RowMapper<Juegos>() {
                    @Override
                    public Juegos mapRow(ResultSet rs, int rowNum) throws SQLException {
                        Juegos juego = new Juegos();
                          juego.setId_juego(rs.getLong("ID_JUEGO"));
                        juego.setImagen(rs.getString("IMAGEN"));
                        juego.setNombre(rs.getString("NOMBRE"));
                        juego.setEmpresa(rs.getString("EMPRESA"));
                        juego.setPrecio(rs.getInt("PRECIO"));
                        juego.setExistencias(rs.getInt("EXISTENCIAS"));
                        juego.setEstado(rs.getBoolean("ESTADO"));
                        juego.setCategoria(rs.getLong("ID_CATEGORIA"));
                        return juego;
                    }
                });
        MapSqlParameterSource mapSqlParameterSource = new MapSqlParameterSource();
        mapSqlParameterSource.addValue("ID_CAT", id);
        Map<String, Object> results = simpleJdbcCall.execute(mapSqlParameterSource);
        List<Juegos> juegoList = (List<Juegos>) results.get("DATOS");
        return juegoList;
    }
         
         
public List<Juegos> getJuegosConFiltros(double precioInf,double precioSup,Long categoriaId) {
        SimpleJdbcCall simpleJdbcCall = new SimpleJdbcCall(jdbcTemplate)
                .withSchemaName("ADMINISTRADOR")
                .withProcedureName("GET_JUEGO_POR_FILTRO")
                .declareParameters(new SqlParameter("precioInf", Types.BIGINT),
                        new SqlParameter("precioSup", Types.BIGINT),
                        new SqlParameter("ID_CAT", Types.BIGINT),
                        new SqlParameter("DATOS", Types.REF_CURSOR))
                .returningResultSet("DATOS", new RowMapper<Juegos>() {
                    @Override
                    public Juegos mapRow(ResultSet rs, int rowNum) throws SQLException {
                        Juegos juego = new Juegos();
                          juego.setId_juego(rs.getLong("ID_JUEGO"));
                        juego.setImagen(rs.getString("IMAGEN"));
                        juego.setNombre(rs.getString("NOMBRE"));
                        juego.setEmpresa(rs.getString("EMPRESA"));
                        juego.setPrecio(rs.getInt("PRECIO"));
                        juego.setExistencias(rs.getInt("EXISTENCIAS"));
                        juego.setEstado(rs.getBoolean("ESTADO"));
                        juego.setCategoria(rs.getLong("ID_CATEGORIA"));
                        return juego;
                    }
                });
        MapSqlParameterSource mapSqlParameterSource = new MapSqlParameterSource();
        mapSqlParameterSource.addValue("precioInf", precioInf);
        mapSqlParameterSource.addValue("precioSup", precioSup);
        mapSqlParameterSource.addValue("ID_CAT", categoriaId);
        Map<String, Object> results = simpleJdbcCall.execute(mapSqlParameterSource);
        List<Juegos> juegoList = (List<Juegos>) results.get("DATOS");
        return juegoList;
    }

                  
public List<Juegos> getJuegosPorPrecio(double precioInf,double precioSup) {
        SimpleJdbcCall simpleJdbcCall = new SimpleJdbcCall(jdbcTemplate)
                .withSchemaName("ADMINISTRADOR")
                .withProcedureName("GET_JUEGO_POR_PRECIO")
                .declareParameters(new SqlParameter("precioInf", Types.BIGINT),
                        new SqlParameter("precioSup", Types.BIGINT),                      
                        new SqlParameter("DATOS", Types.REF_CURSOR))
                .returningResultSet("DATOS", new RowMapper<Juegos>() {
                    @Override
                    public Juegos mapRow(ResultSet rs, int rowNum) throws SQLException {
                        Juegos juego = new Juegos();
                          juego.setId_juego(rs.getLong("ID_JUEGO"));
                        juego.setImagen(rs.getString("IMAGEN"));
                        juego.setNombre(rs.getString("NOMBRE"));
                        juego.setEmpresa(rs.getString("EMPRESA"));
                        juego.setPrecio(rs.getInt("PRECIO"));
                        juego.setExistencias(rs.getInt("EXISTENCIAS"));
                        juego.setEstado(rs.getBoolean("ESTADO"));
                        juego.setCategoria(rs.getLong("ID_CATEGORIA"));
                        return juego;
                    }
                });
        MapSqlParameterSource mapSqlParameterSource = new MapSqlParameterSource();
        mapSqlParameterSource.addValue("precioInf", precioInf);
        mapSqlParameterSource.addValue("precioSup", precioSup);
       
        Map<String, Object> results = simpleJdbcCall.execute(mapSqlParameterSource);
        List<Juegos> juegoList = (List<Juegos>) results.get("DATOS");
        return juegoList;
    }
}
