package com.example.jsp_study.market.mvc.models.daos;

import com.example.jsp_study.market.mvc.database.DBConnection;
import com.example.jsp_study.market.mvc.models.dtos.BoardDto;

import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class BoardDao {
    // DAO 싱글턴 패턴 작업.
    private static BoardDao instance;

    public BoardDao() {
    }

    public static BoardDao getInstance() {
        if (instance == null) {
            instance = new BoardDao();
        }
        return instance;
    }






    //    board 테이블 레코드 개수 읽어 오기.
    public int getListCount(String items, String text) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        int x = 0;

        String sql;

        if (items == null && text == null) {
            sql = "select COUNT(0) from `WebMarketDB`.`board`";
        } else {
            sql = "select COUNT(0) from `WebMarketDB`.`board` where " + items + " like '%" + text + "%'";
        }

        try {
            conn = DBConnection.getConnection();
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                x = rs.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("getListCount : 에러 " + e);
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (pstmt != null) {
                    pstmt.close();
                }
                if (conn != null) {
                    conn.close();
                }
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
        return x;
    }

    public List<BoardDto> getBoardList(int page, int limit, String items, String text) {
        List<BoardDto> boardList = new ArrayList<>();

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        int total_record = getListCount(items, text);
        int start = (page - 1) * limit;
        int index = start + 1;

        String sql;

        if (items == null && text == null) {
            sql = "select * from `WebMarketDB`.`board` order by `num` desc";
        } else {
            sql = "select * from `WebMarketDB`.`board` where " + items + " like '%" + text + "%' order by `num` desc";
        }
        try {
            conn = DBConnection.getConnection();
            pstmt = conn.prepareStatement(sql);
            rs = pstmt.executeQuery();

            while (rs.absolute(index)) {
                BoardDto board = new BoardDto();

                board.setNum(rs.getInt("num"));
                board.setId(rs.getString("id"));
                board.setName(rs.getString("name"));
                board.setSubject(rs.getString("subject"));
                board.setContent(rs.getString("content"));
                board.setRegistDay(rs.getString("regist_day"));
                board.setHit(rs.getInt("hit"));
                board.setIp(rs.getString("ip"));

                boardList.add(board);

                if (index < (start + limit) && index <= total_record) index++;
                else break;
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
        return boardList;
    }

    public String getLoginNameById(String id) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        String name = null;

        String sql = "select `name` from `WebMarketDB`.`members` where `id` = ? LIMIT 1";

        try {
            conn = DBConnection.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, id);
            rs = pstmt.executeQuery();
            if (rs.next()) {
                name = rs.getString(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("getLoginNameById  에러 코드 : " + e);
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
        return name;
    }

    public void insertBoard(BoardDto board) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;


        try {
            conn = DBConnection.getConnection();
            String sql = "insert into `WebMarketDB`.`board` values(?, ?, ?, ?, ?, ?, ?, ?)";

            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, board.getNum());
            pstmt.setString(2, board.getId());
            pstmt.setString(3, board.getName());
            pstmt.setString(4, board.getSubject());
            pstmt.setString(5, board.getContent());
            pstmt.setString(6, board.getRegistDay());
            pstmt.setInt(7, board.getHit());
            pstmt.setString(8, board.getIp());

            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("getLoginNameById  에러 코드 : " + e);
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
//        for (int i = 0; i < 100; i++) {
//            try {
//                conn = DBConnection.getConnection();
//                String sql = "insert into `WebMarketDB`.`board` values(?, ?, ?, ?, ?, ?, ?, ?)";
//
//                pstmt = conn.prepareStatement(sql);
//                pstmt.setInt(1, board.getNum());
//                pstmt.setString(2, board.getId());
//                pstmt.setString(3, board.getName());
//                pstmt.setString(4, board.getSubject() + i);
//                pstmt.setString(5, board.getContent());
//                pstmt.setString(6, board.getRegistDay());
//                pstmt.setInt(7, board.getHit());
//                pstmt.setString(8, board.getIp());
//
//                pstmt.executeUpdate();
//            } catch (Exception e) {
//                e.printStackTrace();
//                System.out.println("getLoginNameById  에러 코드 : " + e);
//            } finally {
//                try {
//                    if (pstmt != null) pstmt.close();
//                    if (conn != null) conn.close();
//                } catch (Exception e) {
//                    throw new RuntimeException(e.getMessage());
//                }
//            }
//        }
    }


//    게시글 상세보기 하기 위해 읽어오기
    public BoardDto getBoardByNum(int num) {

        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        BoardDto dto = new BoardDto();

        String sql = "select * from `WebMarketDB`.`board` where `num` = ?";
        try {
            conn = DBConnection.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, num);

            rs = pstmt.executeQuery();
            if (rs.next()) {
                dto.setNum(rs.getInt("num"));
                dto.setId(rs.getString("id"));
                dto.setName(rs.getString("name"));
                dto.setSubject(rs.getString("subject"));
                dto.setContent(rs.getString("content"));
                dto.setRegistDay(rs.getString("regist_day"));
                dto.setHit(rs.getInt("hit"));
                dto.setIp(rs.getString("ip"));

            }

            updateHit(num);

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("getBoardByNum 오류 : " + e);
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
                if (rs != null) rs.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
        return dto;
    }
//    조회수랑 세트로 해야된다!!! +++++
//    글을 클릭했을 경우 조회수 올려주기
    private void updateHit(int num) {
        Connection conn = null;
        PreparedStatement pstmt = null;
        BoardDto dto = new BoardDto();

//        http://localhost:8080/shoppingMall/board/BoardViewAction.do?num=6&pageNum=1
        String sql = "update `WebMarketDB`.`board` set `hit` = `hit`+ 1 where `num` = ?";
        try {
            conn = DBConnection.getConnection();
            pstmt = conn.prepareStatement(sql);
//            pstmt.setInt(1, dto.getHit() + 1);
            pstmt.setInt(1, num);

            pstmt.executeUpdate();


        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("updateHit 오류 : " + e);
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
    }


    public void updateBoard(BoardDto board) {
        Connection conn = null;
        PreparedStatement pstmt = null;
//        BoardDto dto = new BoardDto();

        String sql = "update `WebMarketDB`.`board` set `name`=?, `subject`=?, `content`=? where `num` = ?";
        try {
            conn = DBConnection.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, board.getName());
            pstmt.setString(2, board.getSubject());
            pstmt.setString(3, board.getContent());
            pstmt.setInt(4, board.getNum());

            pstmt.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("updateBoard error : " + e);
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
    }

//    글 삭제 하기.
    public void deleteBoard(int num) {
        String sql = "delete from `WebMarketDB`.`board` where `num` = ?";
        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            conn = DBConnection.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setInt(1, num);
            pstmt.executeUpdate();

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println("deleteBoard error : " + e);
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (Exception e) {
                throw new RuntimeException(e.getMessage());
            }
        }
    }
}
