package com.example.jsp_study.market.mvc.models.daos;

import com.example.jsp_study.market.mvc.database.DBConnection;
import com.example.jsp_study.market.mvc.models.dtos.RippleDto;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class RippleDao {
    private static  RippleDao instance = new RippleDao();

    public RippleDao() {
    }

    public static RippleDao getInstance() {
        if (instance == null) {
            instance = new RippleDao();
        }
        return instance;
    }


    public void insertRipple(RippleDto ripple) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

//        ripple.setBoardName(this.boardName);
//        ripple.setBoardNum(num);
//        ripple.setMemberId((String) session.getAttribute("sessionId"));
//        ripple.setName(req.getParameter("name"));
//        ripple.setContent(req.getParameter("content"));
//        ripple.setIp(req.getRemoteAddr());

        String sql = "insert into `WebMarketDB`.`ripple` (`boardName`, `boardNum`, `memberId`, `name`, `content`, `ip`) values (?,?,?,?,?,?)";

        try {
            conn = DBConnection.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, ripple.getBoardName());
            pstmt.setInt(2, ripple.getBoardNum());
            pstmt.setString(3, ripple.getMemberId());
            pstmt.setString(4, ripple.getName());
            pstmt.setString(5, ripple.getContent());
            pstmt.setString(6, ripple.getIp());
            pstmt.executeUpdate();


        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("error code : " + e.getMessage());
        } finally {
            try {
                if (conn != null) {
                    conn.close();
                }
                if (pstmt != null) {
                    pstmt.close();
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }


    public List<RippleDto> getRippleList(String boardName, int num) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        List<RippleDto> list = new ArrayList<>();

        String sql = "select * from `WebMarketDB`.`ripple` where `boardName` = ? and `boardNum` = ?";
        try {
            conn = DBConnection.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, boardName);
            pstmt.setInt(2, num);
            rs = pstmt.executeQuery();
            while (rs.next()) {
                RippleDto dto = new RippleDto();
                dto.setRippleId(rs.getInt("rippleId"));
                dto.setBoardName(rs.getString("boardName"));
                dto.setBoardNum(rs.getInt("boardNum"));
                dto.setMemberId(rs.getString("memberId"));
                dto.setName(rs.getString("name"));
                dto.setContent(rs.getString("content"));
                dto.setInsertDate(rs.getTimestamp("insertDate"));
                dto.setIp(rs.getString("ip"));
                list.add(dto);
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("error code : " + e.getMessage());
        } finally {
            try {
                if (conn != null) conn.close();
                if (pstmt != null) pstmt.close();
                if (rs != null) rs.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        }
        return list;
    }


    public void deleteRipple(RippleDto ripple) {
        Connection conn = null;
        PreparedStatement pstmt = null;

        String sql = "delete from `WebMarketDB`.`ripple` where `rippleId` = ?";
        try {
            conn = DBConnection.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, ripple.getRippleId());
            pstmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (conn != null) conn.close();
                if (pstmt != null) pstmt.close();

            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }


}
