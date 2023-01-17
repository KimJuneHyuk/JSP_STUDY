package com.example.jsp_study.market.daos;

import com.example.jsp_study.market.dtos.ProductDto;

import java.util.ArrayList;

public class ProductRepository {
    private ArrayList<ProductDto> listOfProducts = new ArrayList<>();
    private static ProductRepository instance = new ProductRepository();    //싱글 턴
    public static ProductRepository getInstance() {
        return instance;
    }

    public ProductRepository() {
        ProductDto phone = new ProductDto("P1234", "iPhone 6s", 900000);
        phone.setDescription("4.7-inch, 1334 x 750 Ranina HD display, .......");
        phone.setCategory("Smart Phone");
        phone.setManufacturer("Apple");
        phone.setUnitsInStock(1000);
        phone.setCondition("New");
        phone.setFilename(phone.getProductId()+".png");

        ProductDto noteBook = new ProductDto("P1235", "LG Gram", 1900000);
        noteBook.setDescription("16-inch, IPS LED display, 5rd Generation Intel Core Processors");
        noteBook.setCategory("NoteBook");
        noteBook.setManufacturer("LG");
        noteBook.setUnitsInStock(1100);
        noteBook.setCondition("Refurbished");
        noteBook.setFilename(noteBook.getProductId()+".png");

        ProductDto tablet = new ProductDto("P1236", "Galaxy Tab S", 950000);
        tablet.setDescription("212.8 * 125.6 * 8mm, Super Amoled display,.....");
        tablet.setCategory("Tablet");
        tablet.setManufacturer("Samsung");
        tablet.setUnitsInStock(900);
        tablet.setCondition("Old");
        tablet.setFilename(tablet.getProductId()+".png");

        listOfProducts.add(phone);
        listOfProducts.add(noteBook);
        listOfProducts.add(tablet);
    }

    public ProductDto getProductById (String id) {
        ProductDto productById = null;
        for (int i = 0; i < listOfProducts.size(); i++) {
            ProductDto product = listOfProducts.get(i);
            if (product != null &&
            product.getProductId() != null &&
            product.getProductId().equals(id)) {
                productById = product;
                break;
            }
        }
        return productById;
    }

    public ArrayList<ProductDto> getAllProducts() {
        return listOfProducts;
    }
    public void addProduct(ProductDto product) {
        listOfProducts.add(product);
    }


}
