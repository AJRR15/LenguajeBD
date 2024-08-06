/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.Proyecto.Proyecto.Dao;
import org.springframework.data.jpa.repository.JpaRepository;
import com.Proyecto.Proyecto.Domain.Detalle_Factura;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.List;
import java.util.Map;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.SqlParameter;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;
import org.springframework.stereotype.Repository;

@Repository
public class Detalle_FacturaDao  {
    
    @Autowired
    JdbcTemplate jdbcTemplate;
    
    public List<Detalle_Factura> getListdetalles() {
        SimpleJdbcCall simpleJdbcCall = new SimpleJdbcCall(jdbcTemplate)
                .withSchemaName("admin_lenguajes")
                .withProcedureName("GET_DETALLES")
                .withCatalogName("PACKAGE_DETALLE_FACTURA")
                .declareParameters(new SqlParameter("DATOS", Types.REF_CURSOR))
                .returningResultSet("DATOS", new RowMapper<Detalle_Factura>() {
                    @Override
                    public Detalle_Factura mapRow(ResultSet rs, int rowNum) throws SQLException {
                        Detalle_Factura detalle = new Detalle_Factura();
                        detalle.setIdVenta(rs.getLong("ID_DETALLE_FACTURA"));
                        detalle.setIdFactura(rs.getLong("ID_FACTURA"));
                        detalle.setId_juego(rs.getLong("ID_JUEGO"));
                        detalle.setPrecio(rs.getDouble("PRECIO"));
                        detalle.setCantidad(rs.getInt("CANTIDAD"));
                        return detalle;
                    }
                });
        MapSqlParameterSource mapSqlParameterSource = new MapSqlParameterSource();
        Map<String, Object> results = simpleJdbcCall.execute(mapSqlParameterSource);
        List<Detalle_Factura> detalleList = (List<Detalle_Factura>) results.get("DATOS");
        return detalleList;
    }

    public void savedetalle(Detalle_Factura detalle) {
        SimpleJdbcCall simpleJdbcCall = new SimpleJdbcCall(jdbcTemplate)
                .withSchemaName("admin_lenguajes")
                .withProcedureName("ADD_DETALLE_FACTURA")
                .withCatalogName("PACKAGE_DETALLE_FACTURA")
                .declareParameters(
                        new SqlParameter("IDFACT", Types.BIGINT),
                        new SqlParameter("IDJUEGO", Types.BIGINT),
                        new SqlParameter("PRECIO", Types.DOUBLE),
                        new SqlParameter("CANTIDAD", Types.BIGINT)
                );
        MapSqlParameterSource mapSqlParameterSource = new MapSqlParameterSource();
        mapSqlParameterSource.addValue("IDFACT", detalle.getIdFactura());
        mapSqlParameterSource.addValue("IDJUEGO", detalle.getId_juego());
        mapSqlParameterSource.addValue("PRECIO", detalle.getPrecio());
        mapSqlParameterSource.addValue("CANTIDAD", detalle.getCantidad());
        simpleJdbcCall.execute(mapSqlParameterSource);
    }
}

