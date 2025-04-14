
//카테고리 테이블
INSERT INTO CATEGORY (CATEGORY_NO, CATEGORY_NAME, EXPIRATION_DATE) VALUES (SEQ_CNO.NEXTVAL, '음료', 365);
INSERT INTO CATEGORY (CATEGORY_NO, CATEGORY_NAME, EXPIRATION_DATE) VALUES (SEQ_CNO.NEXTVAL, '과자류', 180);
INSERT INTO CATEGORY (CATEGORY_NO, CATEGORY_NAME, EXPIRATION_DATE) VALUES (SEQ_CNO.NEXTVAL, '식품', 365);
INSERT INTO CATEGORY (CATEGORY_NO, CATEGORY_NAME, EXPIRATION_DATE) VALUES (SEQ_CNO.NEXTVAL, '아이스크림', 365);
INSERT INTO CATEGORY (CATEGORY_NO, CATEGORY_NAME, EXPIRATION_DATE) VALUES (SEQ_CNO.NEXTVAL, '생활용품', NULL);



INSERT INTO PRODUCT (PRODUCT_NO, CATEGORY_NO, PRODUCT_NAME, ORIGIN_NAME, CHANGE_NAME, FILE_PATH, INPUT_PRICE, SALE_PRICE, SHORTAGE_AMOUNT, AVAILABILITY, PRODUCT_STATUS) VALUES (SEQ_PRNO.NEXTVAL, 1, '코카콜라 500ml', 'coke.jpg', 'coke_001.jpg', '/upload/product/', 800, 1500, 10, 'Y', 0);
INSERT INTO PRODUCT (PRODUCT_NO, CATEGORY_NO, PRODUCT_NAME, ORIGIN_NAME, CHANGE_NAME, FILE_PATH, INPUT_PRICE, SALE_PRICE, SHORTAGE_AMOUNT, AVAILABILITY, PRODUCT_STATUS) VALUES (SEQ_PRNO.NEXTVAL, 1, '펩시콜라 500ml', 'pepsi.jpg', 'pepsi_001.jpg', '/upload/product/', 700, 1400, 15, 'Y', 0);
INSERT INTO PRODUCT (PRODUCT_NO, CATEGORY_NO, PRODUCT_NAME, ORIGIN_NAME, CHANGE_NAME, FILE_PATH, INPUT_PRICE, SALE_PRICE, SHORTAGE_AMOUNT, AVAILABILITY, PRODUCT_STATUS) VALUES (SEQ_PRNO.NEXTVAL, 1, '밀키스 250ml', 'milkis.jpg', 'milkis_001.jpg', '/upload/product/', 600, 1200, 12, 'Y', 0);
INSERT INTO PRODUCT (PRODUCT_NO, CATEGORY_NO, PRODUCT_NAME, ORIGIN_NAME, CHANGE_NAME, FILE_PATH, INPUT_PRICE, SALE_PRICE, SHORTAGE_AMOUNT, AVAILABILITY, PRODUCT_STATUS) VALUES (SEQ_PRNO.NEXTVAL, 1, '스프라이트 500ml', 'sprite.jpg', 'sprite_001.jpg', '/upload/product/', 750, 1500, 20, 'Y', 0);
INSERT INTO PRODUCT (PRODUCT_NO, CATEGORY_NO, PRODUCT_NAME, ORIGIN_NAME, CHANGE_NAME, FILE_PATH, INPUT_PRICE, SALE_PRICE, SHORTAGE_AMOUNT, AVAILABILITY, PRODUCT_STATUS) VALUES (SEQ_PRNO.NEXTVAL, 1, '삼다수 2L', 'samdaso.jpg', 'samdaso_001.jpg', '/upload/product/', 500, 1000, 25, 'Y', 0);

-- 과자류 (CATEGORY_NO 2)
INSERT INTO PRODUCT VALUES (SEQ_PRNO.NEXTVAL, 2, '오징어 땅콩', 'ojingeo.jpg', 'ojingeo_001.jpg', '/upload/product/', 1000, 2000, 10, 'Y', 0);
INSERT INTO PRODUCT VALUES (SEQ_PRNO.NEXTVAL, 2, '새우깡', 'saewookkang.jpg', 'saewookkang_001.jpg', '/upload/product/', 900, 1800, 8, 'Y', 0);
INSERT INTO PRODUCT VALUES (SEQ_PRNO.NEXTVAL, 2, '포카칩 오리지널', 'pocachip.jpg', 'pocachip_001.jpg', '/upload/product/', 1100, 2200, 7, 'Y', 0);
INSERT INTO PRODUCT VALUES (SEQ_PRNO.NEXTVAL, 2, '칙촉 쿠키', 'chicchoc.jpg', 'chicchoc_001.jpg', '/upload/product/', 1300, 2500, 5, 'Y', 0);
INSERT INTO PRODUCT VALUES (SEQ_PRNO.NEXTVAL, 2, '오리온 초코파이', 'chocopie.jpg', 'chocopie_001.jpg', '/upload/product/', 1200, 2400, 12, 'Y', 0);

-- 식품 (CATEGORY_NO 3)
INSERT INTO PRODUCT VALUES (SEQ_PRNO.NEXTVAL, 3, '삼각김밥 참치마요', 'gimbap1.jpg', 'gimbap1_001.jpg', '/upload/product/', 900, 1200, 8, 'Y', 0);
INSERT INTO PRODUCT VALUES (SEQ_PRNO.NEXTVAL, 3, '도시락 제육볶음', 'dosirak1.jpg', 'dosirak1_001.jpg', '/upload/product/', 2500, 3900, 6, 'Y', 0);
INSERT INTO PRODUCT VALUES (SEQ_PRNO.NEXTVAL, 3, '햄버거 불고기', 'burger.jpg', 'burger_001.jpg', '/upload/product/', 1800, 2900, 9, 'Y', 0);
INSERT INTO PRODUCT VALUES (SEQ_PRNO.NEXTVAL, 3, '컵라면 진라면', 'jinramen.jpg', 'jinramen_001.jpg', '/upload/product/', 700, 1200, 15, 'Y', 0);
INSERT INTO PRODUCT VALUES (SEQ_PRNO.NEXTVAL, 3, '볶음밥', 'friedrice.jpg', 'friedrice_001.jpg', '/upload/product/', 1500, 2500, 10, 'Y', 0);

-- 아이스크림 (CATEGORY_NO 4)
INSERT INTO PRODUCT VALUES (SEQ_PRNO.NEXTVAL, 4, '월드콘 초코', 'worldcone.jpg', 'worldcone_001.jpg', '/upload/product/', 1000, 1800, 6, 'Y', 0);
INSERT INTO PRODUCT VALUES (SEQ_PRNO.NEXTVAL, 4, '스크류바', 'screwbar.jpg', 'screwbar_001.jpg', '/upload/product/', 700, 1200, 8, 'Y', 0);
INSERT INTO PRODUCT VALUES (SEQ_PRNO.NEXTVAL, 4, '메로나', 'melona.jpg', 'melona_001.jpg', '/upload/product/', 800, 1300, 7, 'Y', 0);
INSERT INTO PRODUCT VALUES (SEQ_PRNO.NEXTVAL, 4, '비비빅', 'bibibig.jpg', 'bibibig_001.jpg', '/upload/product/', 750, 1200, 5, 'Y', 0);
INSERT INTO PRODUCT VALUES (SEQ_PRNO.NEXTVAL, 4, '죠스바', 'jawsbar.jpg', 'jawsbar_001.jpg', '/upload/product/', 800, 1400, 9, 'Y', 0);

-- 생활용품 (CATEGORY_NO 5)
INSERT INTO PRODUCT VALUES (SEQ_PRNO.NEXTVAL, 5, '칫솔 3입', 'toothbrush.jpg', 'toothbrush_001.jpg', '/upload/product/', 1500, 2900, 10, 'Y', 0);
INSERT INTO PRODUCT VALUES (SEQ_PRNO.NEXTVAL, 5, '치약', 'toothpaste.jpg', 'toothpaste_001.jpg', '/upload/product/', 1000, 2000, 12, 'Y', 0);
INSERT INTO PRODUCT VALUES (SEQ_PRNO.NEXTVAL, 5, '샴푸 500ml', 'shampoo.jpg', 'shampoo_001.jpg', '/upload/product/', 3000, 5000, 8, 'Y', 0);
INSERT INTO PRODUCT VALUES (SEQ_PRNO.NEXTVAL, 5, '휴지 3롤', 'toiletpaper.jpg', 'toiletpaper_001.jpg', '/upload/product/', 2500, 4000, 10, 'Y', 0);
INSERT INTO PRODUCT VALUES (SEQ_PRNO.NEXTVAL, 5, '물티슈', 'wetwipes.jpg', 'wetwipes_001.jpg', '/upload/product/', 1000, 1800, 11, 'Y', 0);

commit;