package com.example.jsp_study.market.mvc.controllers;

import com.example.jsp_study.market.mvc.models.daos.BoardDao;
import com.example.jsp_study.market.mvc.models.dtos.BoardDto;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

@WebServlet("*.do")
public class BoardController extends HttpServlet {
    static final int LISTCOUNT = 5; // 페이지당 게시물 수 고정으로 5개 설정.

//    Commemd commemd = null;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        doPost(req, resp);  // get으로 넘어온 값을 post에서 일괄적 처리를 하기위해  넘겨준다.다.
        // req :: request , resp :: response
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String RequestURI = req.getRequestURI();    //전체 경로를 가져 온다.
        String contextPath = req.getContextPath();  // 프로젝트 path만 가져온다.
        String command = RequestURI.substring(contextPath.length());    //전체경로에서 프로젝트 path 길이 만큼의 인덱스 이후의 문자열을 가져온다.

        resp.setContentType("text/html; charset=utf-8");
        req.setCharacterEncoding("utf-8");

        System.out.println(command);

//        /shoppingMall/board/BoardListAction.do?pageNum=1
        if (command.contains("/BoardListAction.do")) {   // 등록된 글 목록 페이지를 출력하기.
            System.out.println(command);
            requestBoardList(req);
            RequestDispatcher rd = req.getRequestDispatcher("../board/list.jsp");
            rd.forward(req,resp);

        } else if (command.contains("/BoardWriteForm.do")) {
            requestLoginName(req);
            RequestDispatcher rd = req.getRequestDispatcher("../board/writeForm.jsp");
            rd.forward(req, resp);

        } else if (command.contains("/BoardWriteAction.do")) {  //글 등록
            requestBoardWrite(req);
            RequestDispatcher rd = req.getRequestDispatcher("../board/BoardListAction.do");
            rd.forward(req, resp);

        } else if (command.contains("/BoardViewAction.do")) {   //선택된 글 상세 페이지 가져오기
            RequestBoardView(req);
            RequestDispatcher rd = req.getRequestDispatcher("../board/BoardView.do");
            rd.forward(req, resp);

        } else if (command.contains("BoardView.do")) {  // 글 상세 페이지 출력하기.
            RequestDispatcher rd = req.getRequestDispatcher("../board/view.jsp");
            rd.forward(req, resp);

        } else if (command.contains("/BoardSelectAction.do")) { //글 수정 되었다면 업데이트
//            http://localhost:8080/shoppingMall/board/BoardSelectAction.do?num=6&pageNum=1
            requestBoardUpdate(req);
            RequestDispatcher rd = req.getRequestDispatcher("../board/updateView.jsp");
            rd.forward(req, resp);

        } else if (command.contains("/BoardUpdateAction.do")) { //글 수정 되었다면 업데이트
            requestBoardUpdate(req);
            RequestDispatcher rd = req.getRequestDispatcher("../board/BoardListAction.do");
            rd.forward(req, resp);

        }


        else if (command.contains("/BoardDeleteAction.do")) { // 글 삭제를 클릭 했을 경우 삭제
            requestBoardDelete(req);
            RequestDispatcher rd = req.getRequestDispatcher("../board/BoardListAction.do");
            rd.forward(req, resp);

        }


    }



    //    등록된 글 목록을 가져오는 메서드 list.jsp   페이징 처리까지 같이 하는 곳
    public void requestBoardList(HttpServletRequest req) {
        BoardDao dao = BoardDao.getInstance();
        List<BoardDto> boardList;

        int pageNum = 1;   // 페이지 번호가 전달이 안되면 1페이지 고정 값 설정.
        int limit = LISTCOUNT;  // 페이지당 보여질 게시물 수 고정 값 5;

        if (req.getParameter("pageNum") != null) {  // 페이지 번호가 전달이 된 경우.
            pageNum = Integer.parseInt(req.getParameter("pageNum"));
        }

        String items = req.getParameter("items");   // 검색 필드.
        String text = req.getParameter("text");     // 검색어.

        int total_record = dao.getListCount(items, text);   //전체 게시물 수.
        boardList = dao.getBoardList(pageNum, limit, items, text);  //현재 페이지에 해당하는 목록 데이터 가져오기.

        int total_page; // 전체 페이지의 수!!  ====================================

        if (total_record % limit == 0) {    // 전체 게시물이 limit의 배수일 때. 나머지가 없을때
            total_page = total_record / limit;
        } else {
            total_page = total_record / limit; // 나머지가 생기면 페에지 1페이지 추가 생성
            Math.floor(total_page);
            total_page = total_page + 1;
        }

        req.setAttribute("pageNum", pageNum);
        req.setAttribute("total_page", total_page);
        req.setAttribute("total_record", total_record);
        req.setAttribute("boardList", boardList);
    }

//   글 쓰기 페이지 WriteForm.jsp
    public void requestLoginName(HttpServletRequest req) {
        String id = req.getParameter("id");
        BoardDao dao = BoardDao.getInstance();
        String name = dao.getLoginNameById(id);

        req.setAttribute("name", name);
    }

//    새로운 글 등록하기.
    private void requestBoardWrite(HttpServletRequest req) {
        BoardDao dao = BoardDao.getInstance();

        BoardDto board = new BoardDto();
        board.setId(req.getParameter("id"));
        board.setName(req.getParameter("name"));
        board.setSubject(req.getParameter("subject"));
        board.setContent(req.getParameter("content"));

        System.out.println(req.getParameter("name"));
        System.out.println(req.getParameter("subject"));
        System.out.println(req.getParameter("content"));
        SimpleDateFormat formatter = new SimpleDateFormat("yyyy/MM/dd(HH:mm:ss)");
        String regist_day = formatter.format(new Date());

        board.setHit(0);
        board.setRegistDay(regist_day);
        board.setIp(req.getRemoteAddr());

        dao.insertBoard(board);
    }

//    상세페이지 글 읽어오기 select
    public void RequestBoardView(HttpServletRequest req) {
        int num = Integer.parseInt(req.getParameter("num"));
        int pageNum = Integer.parseInt(req.getParameter("pageNum"));
        BoardDao dao = BoardDao.getInstance();

        BoardDto board = new BoardDto();
        board = dao.getBoardByNum(num);

        req.setAttribute("num", num);
        req.setAttribute("page", pageNum);
        req.setAttribute("board", board);
    }


//    해당 글 상세 페이지에서 수정하기.
    private void requestBoardUpdate(HttpServletRequest req) {
        int num = Integer.parseInt(req.getParameter("num"));
        int pageNum = Integer.parseInt(req.getParameter("pageNum"));

//        http://localhost:8080/shoppingMall/board/BoardUpdateAction.do?num=6&pageNu1

        BoardDao dao = BoardDao.getInstance();
        BoardDto board = dao.getBoardByNum(num);

        req.setAttribute("num", num);
        req.setAttribute("page", pageNum);
        req.setAttribute("board", board);

        board.setNum(num);
        board.setName(req.getParameter("name"));
        board.setSubject(req.getParameter("subject"));
        board.setContent(req.getParameter("content"));

        dao.updateBoard(board);
    }

    private void requestBoardDelete(HttpServletRequest req) {
        int num = Integer.parseInt(req.getParameter("num"));

        BoardDao dao = BoardDao.getInstance();

        dao.deleteBoard(num);
    }
}
