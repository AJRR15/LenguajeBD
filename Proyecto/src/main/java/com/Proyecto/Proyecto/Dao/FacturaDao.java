package com.Proyecto.Proyecto.Dao;

import org.springframework.data.jpa.repository.JpaRepository;
import com.Proyecto.Proyecto.Domain.Factura;
import java.sql.Types;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.SqlParameter;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;
import org.springframework.stereotype.Repository;

@Repository
public class FacturaDao {

    @Autowired
    JdbcTemplate jdbcTemplate;

    public void savefactura(Factura factura) {
        SimpleJdbcCall simpleJdbcCall = new SimpleJdbcCall(jdbcTemplate)
                .withSchemaName("admin_lenguajes")
                .withProcedureName("ADD_FACTURA")
                .declareParameters(
                        new SqlParameter("USID", Types.BIGINT),
                        new SqlParameter("FECHA", Types.DATE)
                );
        MapSqlParameterSource mapSqlParameterSource = new MapSqlParameterSource();
        mapSqlParameterSource.addValue("USID", factura.getIdUsuario());
        mapSqlParameterSource.addValue("FECHA", factura.getFecha());
        simpleJdbcCall.execute(mapSqlParameterSource);
    }
    
    public void updatefactura(Long id,Double total) {
        SimpleJdbcCall simpleJdbcCall = new SimpleJdbcCall(jdbcTemplate)
                .withSchemaName("admin_lenguajes")
                .withProcedureName("UPDATE_FACTURA")
                .declareParameters(
                        new SqlParameter("FID", Types.BIGINT),
                        new SqlParameter("TOTL", Types.DOUBLE)
                );
        MapSqlParameterSource mapSqlParameterSource = new MapSqlParameterSource();
        mapSqlParameterSource.addValue("FID", id);
        mapSqlParameterSource.addValue("TOTL", total);
        simpleJdbcCall.execute(mapSqlParameterSource);
    }
}
