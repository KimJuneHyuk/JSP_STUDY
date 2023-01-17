package com.example.jsp_study.market.daos;

import com.example.jsp_study.market.dtos.CartDto;
import com.example.jsp_study.market.dtos.ProductDto;
import com.example.jsp_study.market.mvc.database.DBConnection;

import javax.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class CartDao {

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

    public CartDao() {
        connect();
    }




    public boolean updateCart(ProductDto productDto, String orderNum, String memberId) throws SQLException {
        //동일한 주문번호에 같은 productId만 있으면 update, 없다면 insert 해야된다.

        System.out.println(productDto.getProductId());
        System.out.println(orderNum);
        System.out.println(memberId);

        int flag = 0;
        String productID = productDto.getProductId();

        String sql = "select `cartId` from `WebMarketDB`.`cart` where `orderNum` = ? AND `p_id` = ?";

        preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, orderNum);
        preparedStatement.setString(2, productID);
        resultSet = preparedStatement.executeQuery();

        if (resultSet.next()) {
            int cartId = resultSet.getInt("cartId");

            sql = "update `WebMarketDB`.`cart` set `p_quantity` = `p_quantity` + 1 where `cartId` = ? ";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, cartId);
        } else {
            sql = "insert into `WebMarketDB`.`cart` values (null, ?, ?, ?, ?, ?, ?, now())";
            preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setString(1, memberId);
            preparedStatement.setString(2, orderNum);
            preparedStatement.setString(3, productID);
            preparedStatement.setString(4, productDto.getPname());
            preparedStatement.setInt(5, productDto.getUnitPrice());
            preparedStatement.setInt(6, 1);
        }
        flag = preparedStatement.executeUpdate();
        return flag == 1;
    }


    public ArrayList<CartDto> getCartList(String orderNo) throws SQLException {

        String sql = "select * from `WebMarketDB`.`cart` where `orderNum` = ? ";

        preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, orderNo);
        resultSet = preparedStatement.executeQuery();

        ArrayList<CartDto> list = new ArrayList<>();


        while (resultSet.next()) {
            CartDto cartDto = new CartDto();
            cartDto.setCartId(resultSet.getInt("cartId"));
            cartDto.setOrderMember(resultSet.getString("orderMember"));
            cartDto.setOrderNum(resultSet.getString("orderNum"));
            cartDto.setpId(resultSet.getString("p_id"));
            cartDto.setpName(resultSet.getString("p_name"));
            cartDto.setpUnitPrice(resultSet.getInt("p_unitPrice"));
            cartDto.setpQuantity(resultSet.getInt("p_quantity"));
            cartDto.setCreatedAt(resultSet.getTimestamp("createdAt"));

            list.add(cartDto);
        }

        return list;
    }




    public boolean updateCartByLogin(HttpSession session) {
        int flag = 0;

        String orderNum = session.getId();
        String id = (String) session.getAttribute("sessionId");
//        이전 로그인에 담은 상품 업데이트
        String sql = "update `WebMarketDB`.`cart` set `orderNum` = ? where `orderMember` = ?";

        try {
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, orderNum);
            preparedStatement.setString(2, id);
            flag = preparedStatement.executeUpdate();

//            로그인 전에 담은 상품 업데이트
            sql = "update `WebMarketDB`.`cart` set `orderMember` = ? where `orderNum` = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, id);
            preparedStatement.setString(2,orderNum);
            flag = preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return flag != 0;
    }



    public boolean deleteProductByCartId(String orderNo , int CartId) throws SQLException {

        int status = 0;

        String sql = "select * from `WebMarketDB`.`cart` where `cartId` = ? and `orderNum`= ?";
        preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setInt(1, CartId);
        preparedStatement.setString(2, orderNo);
        resultSet = preparedStatement.executeQuery();

        if (resultSet.next()) {
            sql = "delete from `WebMarketDB`.`cart` where `cartId` = ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, CartId);

            status = preparedStatement.executeUpdate();
        }

        return status > 0 ? true : false;
    }



    public boolean deleteAllCart(String orderNo , String userId) throws SQLException {
        int status = 0;

        String sql = "select * from `WebMarketDB`.`cart` where `orderNum` = ? and `orderMember` = ?";
        preparedStatement = connection.prepareStatement(sql);
        preparedStatement.setString(1, orderNo);
        preparedStatement.setString(2, userId);
        resultSet = preparedStatement.executeQuery();
        if (resultSet.next()) {
            sql = "delete from `WebMarketDB`.`cart` where `orderMember`= ?";
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, userId);
            status = preparedStatement.executeUpdate();

        }
        return status > 0 ? true : false;
    }





}

