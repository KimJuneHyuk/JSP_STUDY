package com.example.jsp_study.market.daos;

import com.example.jsp_study.market.dtos.ProductDto;
import com.example.jsp_study.market.mvc.database.DBConnection;

import javax.xml.transform.Result;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class ProductDao {
    private Connection connection = null;
    private PreparedStatement preparedStatement = null;
    private ResultSet resultSet = null;

    void connect() {
        try {
            connection = DBConnection.getConnection();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public ProductDao() {
        connect();
    }

    public ProductDto selectProductById (String id) throws SQLException {
        String sql = "select * from `WebMarketDB`.`products` where `p_id` = ?";
        preparedStatement = connection.prepareStatement(sql);

        preparedStatement.setString(1, id);
        resultSet =  preparedStatement.executeQuery();
            ProductDto product = null;

        if (resultSet.next()) {
            product = new ProductDto();
            product.setProductId(resultSet.getString("p_id"));
            product.setPname(resultSet.getString("p_name"));
            product.setUnitPrice(resultSet.getInt("p_unitPrice"));
            product.setDescription(resultSet.getString("p_description"));
            product.setCategory(resultSet.getString("p_category"));
            product.setManufacturer(resultSet.getString("p_manufacturer"));
            product.setUnitsInStock(resultSet.getInt("p_unitsInStock"));
            product.setCondition(resultSet.getString("p_condition"));
            product.setFilename(resultSet.getString("p_filename"));
        }
        return product;
    }






}
