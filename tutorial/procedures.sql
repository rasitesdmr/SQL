USE BikeStores
/*
1-) SQL Server saklı yordamları (stored procedures), bir veya daha fazla Transact-SQL 
    ifadesini mantıksal birimler halinde gruplamak için kullanılır.
    
2-) Saklı yordam, SQL Server Veritabanı Sunucusunda adlandırılmış bir nesne olarak saklanır.

3-) Saklı yordamı ilk kez çağırdığınızda, SQL Server bir yürütme planı 
    oluşturur ve bunu önbellekte saklar.

4-) Saklı yordamın sonraki yürütmelerinde, SQL Server, saklı yordamı (stored procedures) 
    güvenilir performanslaçok hızlı yürütmek için planı yeniden kullanır.    
*/;

/*
5-) Aşağıdaki SELECT ifadesi, BikeStores örnek veritabanındaki ürünler tablosundan 
    bir ürün listesi döndürür:
*/
SELECT product_name , list_price 
FROM production.products
ORDER BY product_name;

/*
6-) Bu sorguyu saran bir saklı yordam oluşturmak için 
    CREATE PROCEDURE ifadesini aşağıdaki gibi kullanırsınız.

7-) urunlistesi saklı yordamın adıdır .

8-) AS anahtar sözcüğü, saklı yordamın başlığını ve gövdesini ayırır.

9-) Saklı yordamın bir ifadesi varsa, ifadeyi çevreleyen BEGIN ve END anahtar 
    sözcükleri isteğe bağlıdır. Ancak, kodu netleştirmek için bunları dahil 
    etmek iyi bir uygulamadır.   
*/
CREATE PROCEDURE urunlistesi
AS
BEGIN
    SELECT product_name , list_price
    FROM production.products
    ORDER BY product_name
END;

/*
10-) Saklı bir yordamı yürütmek için, EXECUTE veya EXEC deyimini 
    ve ardından saklı yordamın adını kullanırsınız:
*/
EXECUTE urunlistesi;

/*
11-) Eğer saklı yordamları değiştirmek istiyorsak ALTER kullanabiliriz.
*/
ALTER PROCEDURE urunlistesi
AS
BEGIN
    SELECT product_name , list_price
    FROM production.products
    ORDER BY list_price
END;

/*
12-) Şimdi gelelim bu procedur'lere parametre ekleyelim
*/
CREATE PROCEDURE urunleriBul(@min_list_price AS INT)
AS
BEGIN
    SELECT product_name , list_price 
    FROM production.products
    WHERE list_price >= @min_list_price
    ORDER BY list_price
END;

/*
13-) 200 tl den büyük veya eşit ürünleri bulmasını istedik.
*/
EXECUTE urunleriBul 200;

/*
14-) Procedur'ler birden fazla parametre alabilir.
*/
CREATE PROCEDURE fiyatArasindakiUrunleriBul (
    @min_list_price AS INT ,
    @max_list_price AS INT 
    )
AS
BEGIN
    SELECT product_name , list_price 
    FROM production.products
    WHERE list_price >= @min_list_price AND 
          list_price <= @max_list_price
    ORDER BY list_price
END

/*
15-) 500 ile 1000 arasındaki ürünleri listele.
*/
EXECUTE fiyatArasindakiUrunleriBul 500 ,1000;
