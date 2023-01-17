package com.example.jsp_study.bookmarket.daos;

import com.example.jsp_study.bookmarket.dtos.BookDto;
import com.example.jsp_study.market.daos.ProductRepository;

import java.util.ArrayList;

public class BookRepository {
    ArrayList<BookDto> listOfBooks = new ArrayList<>();
    private static BookRepository instance = new BookRepository();
    public static BookRepository getInstance() {
        return instance;
    }

    public BookRepository() {
        BookDto book1 = new BookDto("B1234", "역행자", 15000);
        book1.setAuthor("자청");
        book1.setDescription("돈, 시간, 운명으로부터 완전한 자유를 얻는 7단계 인생 공략집");
        book1.setPublisher("웅진지식하우스");
        book1.setCategory("제태크");
        book1.setUnitsInStock(999);
        book1.setTotalPages(230);
        book1.setReleaseDate("2022년 5월");
        book1.setCondition("신규 도서");
        book1.setCondition(book1.getBookId() + ".jfif");


        BookDto book2 = new BookDto("B1235", "부자아빠 가난한 아빠", 17500);
        book2.setAuthor("로버트 기요사키");
        book2.setDescription("50억 부자 아빠의 현실 경제 수업 이야기...");
        book2.setPublisher("믿음인");
        book2.setCategory("제태크");
        book2.setUnitsInStock(1290);
        book2.setTotalPages(253);
        book2.setReleaseDate("2018년 8월");
        book2.setCondition("중고 도서");
        book2.setCondition(book2.getBookId() + ".jfif");

        BookDto book3 = new BookDto("B1236", "KEEP GOING", 18000);
        book3.setAuthor("주언규");
        book3.setDescription("나는 월 천만월을 벌기로 결심했다. 가난에서 벗어나기 위한 나의 행동");
        book3.setPublisher("21세기북스");
        book3.setCategory("제태크");
        book3.setUnitsInStock(1200);
        book3.setTotalPages(214);
        book3.setReleaseDate("2020년 9월");
        book3.setCondition("전자 도서");
        book3.setCondition(book3.getBookId() + ".jfif");

        listOfBooks.add(book1);
        listOfBooks.add(book2);
        listOfBooks.add(book3);
    }

    public BookDto getBookById (String id) {
        BookDto bookById = null;

        for (BookDto book : listOfBooks) {
            if (book != null
            && book.getBookId() != null
            && book.getBookId().equals(id)) {
                bookById = book;
                break;
            }
        }
        return bookById;
    }

    public ArrayList<BookDto> getAllKBooks() {
        return listOfBooks;
    }
    public void addBook(BookDto book) {
        listOfBooks.add(book);
    }

}
