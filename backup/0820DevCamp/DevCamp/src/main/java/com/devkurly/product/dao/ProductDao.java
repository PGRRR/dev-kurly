package com.devkurly.product.dao;

import com.devkurly.board.domain.BoardDto;
import com.devkurly.product.domain.ProductDto;
import com.devkurly.product.domain.SearchCondition;

import java.util.List;
import java.util.Map;

public interface ProductDao {


    // C

    int create(ProductDto dto) throws Exception;



    // R

    List<ProductDto> ProductList(Map map) throws Exception;// 상품 리스트

    List<ProductDto> ProductThriftyList(Map map) throws Exception;

    // R
    List<ProductDto> ProductBestList(Map map) throws Exception;

    List<ProductDto> ProductNewList(Map map) throws Exception;

    ProductDto select(Integer pdt_id) throws Exception; // 상품 상세페이지
    int count() throws Exception;

    // U

    int update(ProductDto dto) throws Exception // 상품 업데이트
    ;



    // D

    int deleteAll() throws Exception;

    int delete(Integer pdt_id) throws Exception;


    List<ProductDto> selectProductId() throws Exception;

    List<ProductDto> ProductListDESC(Map map); // 정렬


     List<ProductDto> searchSelectPage(SearchCondition sc) throws Exception;

     int searchResultCnt(SearchCondition sc) throws Exception;

    List<ProductDto> EventList(Map map) throws Exception;



}