/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package edu.finalbases.repositoryDAO;

import edu.finalbases.conexion.Conexion;

import edu.finalbases.entities.Venta;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Santiago
 */
public class VentaDAO extends AbstractDAO{

    @Override
    public Object actualizar(Object object) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public int crear(Object object)throws  SQLException, FException {
        Venta venta = (Venta) object;
        try {

            String strSQL = "INSERT INTO SALE(IDVENTA,FECHAVENTA,TOTAL,IDCLIENTE,ESTADOVENTA) VALUES (MULTINIVEL.SEQ_VENTA_IDVENTA.NEXTVAL,?,?,?,?)";
            connection = Conexion.getInstance().getConexionBD();
            prepStmt = connection.prepareStatement(strSQL);
            //prepStmt.setInt(1, venta.getIdVenta());
            prepStmt.setDate(1, java.sql.Date.valueOf(java.time.LocalDate.now()));
            prepStmt.setDouble(2, venta.getTotal());            
            prepStmt.setInt(3, venta.getCliente().getIdPersona());    
            prepStmt.setString(4, "OK");    

            int resultado = prepStmt.executeUpdate();
            prepStmt.close();
            Conexion.getInstance().commit();
            return resultado;
        } catch (SQLException e) {
            System.out.println("No pudo crear insertar la venta: " + e.getMessage());
            throw new FException("VentaDAO", "Error creando la venta" + e.getMessage());
        } finally {
            Conexion.getInstance().cerrarConexion();
        }
    }

    @Override
    public boolean borrar(Object object) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Object getObjectById(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public Object getEntityByResultSet(ResultSet resultSet) throws SQLException {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    public int getSequenceIdVenta() throws  SQLException {
        try {

            String strSQL = "SELECT MULTINIVEL.SEQ_VENTA_IDVENTA.CURRVAL AS IDVENTA FROM DUAL";
            
            connection = Conexion.getInstance().getConexionBD();
            prepStmt = connection.prepareStatement(strSQL);
            
            resultSet = prepStmt.executeQuery();
            
            if (resultSet.next()) {
                return resultSet.getInt("IDVENTA");
            }
            prepStmt.close();
        } catch (SQLException e) {
            System.out.println("No pudo obtener la secuencia" + e.getMessage());
            
        } finally {
            Conexion.getInstance().cerrarConexion();
        }
        return 0;
    }
    
}