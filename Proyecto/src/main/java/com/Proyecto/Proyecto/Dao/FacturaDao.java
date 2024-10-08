package com.Proyecto.Proyecto.Dao;

import org.springframework.data.jpa.repository.JpaRepository;
import com.Proyecto.Proyecto.Domain.Factura;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.Date;
import java.util.List;
import java.util.Map;
import oracle.sql.DATE;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.core.SqlParameter;
import org.springframework.jdbc.core.namedparam.MapSqlParameterSource;
import org.springframework.jdbc.core.simple.SimpleJdbcCall;
import org.springframework.stereotype.Repository;

@Repository
public class FacturaDao {

    @Autowired
    JdbcTemplate jdbcTemplate;
    
    public List<Factura> getListfacturas() {
        SimpleJdbcCall simpleJdbcCall = new SimpleJdbcCall(jdbcTemplate)
                .withSchemaName("admin_lenguajes")
                .withProcedureName("GET_FACTURAS")
                .withCatalogName("PACKAGE_FACTURA")
                .declareParameters(new SqlParameter("DATOS", Types.REF_CURSOR))
                .returningResultSet("DATOS", new RowMapper<Factura>() {
                    @Override
                    public Factura mapRow(ResultSet rs, int rowNum) throws SQLException {
                        Factura factura = new Factura();
                        factura.setIdFactura(rs.getLong("ID_FACTURA"));
                        factura.setIdUsuario(rs.getLong("ID_USUARIO"));
                        factura.setFecha(rs.getDate("FECHA"));
                        factura.setTotal(rs.getDouble("TOTAL"));
                        return factura;
                    }
                });
        MapSqlParameterSource mapSqlParameterSource = new MapSqlParameterSource();
        Map<String, Object> results = simpleJdbcCall.execute(mapSqlParameterSource);
        List<Factura> facturaList = (List<Factura>) results.get("DATOS");
        return facturaList;
    }

    public void savefactura(Factura factura) {
        SimpleJdbcCall simpleJdbcCall = new SimpleJdbcCall(jdbcTemplate)
                .withSchemaName("admin_lenguajes")
                .withProcedureName("ADD_FACTURA")
                .withCatalogName("PACKAGE_FACTURA")
                .declareParameters(
                        new SqlParameter("USID", Types.BIGINT),
                        new SqlParameter("FECHA", Types.DATE),
                        new SqlParameter("TOTAL", Types.DOUBLE)
                );
        MapSqlParameterSource mapSqlParameterSource = new MapSqlParameterSource();
        mapSqlParameterSource.addValue("USID", factura.getIdUsuario());
        mapSqlParameterSource.addValue("FECHA", factura.getFecha());
        mapSqlParameterSource.addValue("TOTAL", factura.getTotal());
        simpleJdbcCall.execute(mapSqlParameterSource);
    }
    
    public void updatefactura(Long id,Double total) {
        SimpleJdbcCall simpleJdbcCall = new SimpleJdbcCall(jdbcTemplate)
                .withSchemaName("admin_lenguajes")
                .withProcedureName("UPDATE_FACTURA")
                .withCatalogName("PACKAGE_FACTURA")
                .declareParameters(
                        new SqlParameter("FID", Types.BIGINT),
                        new SqlParameter("TOTL", Types.DOUBLE)
                );
        MapSqlParameterSource mapSqlParameterSource = new MapSqlParameterSource();
        mapSqlParameterSource.addValue("FID", id);
        mapSqlParameterSource.addValue("TOTL", total);
        simpleJdbcCall.execute(mapSqlParameterSource);
    }
    
    public Factura getfactura(Date FECHA) {
        SimpleJdbcCall simpleJdbcCall = new SimpleJdbcCall(jdbcTemplate)
                .withSchemaName("admin_lenguajes")
                .withProcedureName("GET_FACTURA_ID")
                .withCatalogName("PACKAGE_FACTURA")
                .declareParameters(new SqlParameter("FECH", Types.DATE),new SqlParameter("DATOS", Types.REF_CURSOR))
                .returningResultSet("DATOS", new RowMapper<Factura>() {
                    @Override
                    public Factura mapRow(ResultSet rs, int rowNum) throws SQLException {
                        Factura factura = new Factura();
                        factura.setIdFactura(rs.getLong("ID_FACTURA"));
                        return factura;
                    }
                });
        MapSqlParameterSource mapSqlParameterSource = new MapSqlParameterSource();
        mapSqlParameterSource.addValue("FECH", FECHA);
        Map<String, Object> results = simpleJdbcCall.execute(mapSqlParameterSource);
        List<Factura> factList = (List<Factura>) results.get("DATOS");
        return factList.isEmpty() ? null : factList.get(0);
    }
}
