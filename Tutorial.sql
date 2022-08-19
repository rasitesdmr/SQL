USE BikeStores

--  Customers tablosundaki tüm verileri çeker --
SELECT * from sales.customers;

--  Customers tablosundaki ad , soyad ve email verilerini çeker --
--  Sorgular şu sırayla işlenir FROM > SELECT --
Select first_name, last_name , email from sales.customers;

--  Satırları bir veya daha fazla koşula göre filtrelemek için WHERE kullanılır --
--  Sorgu sırası şöyle işler FROM > WHERE > SELECT
SELECT * FROM sales.customers where customer_id = 1;

/*
    ASC, sonucu en düşük değerden en yüksek değere doğru sıralarken, 
    DESC sonuç kümesini en yüksek değerden en düşük değere doğru sıralar.
    default = ASC
*/
Select first_name FROM sales.customers ORDER BY first_name ASC;
Select first_name FROM sales.customers ORDER BY first_name DESC;

/*
    Satırları gruplar halinde gruplamak için GROUP BY yan tümcesini kullanırsınız. 
    Örneğin, aşağıdaki ifade Kaliforniya'da bulunan müşterilerin tüm şehirlerini ve 
    her şehirdeki müşteri sayısını döndürür.
*/
--  Group BY ve DISCOUNT aynı görevi yaparlar --
--  Sorgu sırası şöyle işler FROM > WHERE > GROUP BY > SELECT > ORDER BY --
Select city , COUNT(city) as KacAdet FROM sales.customers where [state] ='CA' GROUP by city ORDER BY city;

/* 
    Grupları bir veya daha fazla koşula göre filtrelemek için HAVING yan tümcesini kullanırsınız. 
    Aşağıdaki örnek, ondan fazla müşterisi olan Kaliforniya'daki şehri döndürür:
*/
Select city , COUNT(city) as KacAdet FROM sales.customers where [state] ='CA' GROUP by city HAVING COUNT(city) >10 ORDER BY city;

--  Aşağıdaki örnek, en pahalı 10 ürünü döndürmek için sabit bir değer kullanır --
Select TOP 10  product_name , list_price FROM production.products ORDER BY list_price DESC;

/*
    Bazen, bir tablonun belirli bir sütununda yalnızca farklı değerler almak isteyebilirsiniz. 
    Bunu yapmak için SELECT DISTINCT yan tümcesini kullanırız.
*/
Select DISTINCT city from sales.customers ORDER BY city;

--  Bir değerin bir listedeki veya bir alt sorgudaki herhangi bir değerle eşleşip eşleşmediğini kontrol edir --
Select product_name , list_price FROM production.products WHERE list_price IN (89.99,109.99,159.99);

--  BETWEEN operatörü, test edilecek bir aralık belirlemenize izin veren mantıksal bir operatördür.--
Select product_name , list_price FROM production.products WHERE list_price BETWEEN 149.99 AND 199.99 ORDER by list_price;

--  Bir karakter dizisinin belirli bir kalıpla eşleşip eşleşmediğini kontrol etmek için kullanılır.--
--  a ile başlıyanları getirdi --
--  '_a%' , '%a%' , '%a' vb.--
Select first_name  FROM sales.customers WHERE first_name LIKE 'a%';

--  İç birleştirme, sol tablodaki satırları içeren ve sağdaki tablodaki satırlarla eşleşen bir veri kümesi üretir.--
SELECT c.customer_id , c.first_name , o.customer_id , o.order_id from sales.customers c INNER JOIN sales.orders o ON c.customer_id = o.customer_id;

--  NOT : Sol tarafta nul varsa onuda getirir. --
SELECT c.customer_id , c.first_name , o.customer_id , o.order_id from sales.customers c LEFT JOIN sales.orders o ON c.customer_id = o.customer_id;

--  NOT : Sağ tarafta nul varsa onuda getirir. --
SELECT c.customer_id , c.first_name , o.customer_id , o.order_id from sales.customers c RIGHT JOIN sales.orders o ON c.customer_id = o.customer_id where c.customer_id IS Null;

SELECT c.customer_id , c.first_name , o.customer_id , o.order_id from sales.customers c FULL JOIN sales.orders o ON c.customer_id = o.customer_id;

/*
    Saklı yordamı ilk kez çağırdığınızda, SQL Server bir yürütme planı oluşturur ve bunu önbellekte saklar. 
    Saklı yordamın sonraki yürütmelerinde, SQL Server, saklı yordamı güvenilir performansla çok hızlı yürütmek 
    için planı yeniden kullanır.

    uspProductList, saklı yordamın adıdır.

    AS anahtar sözcüğü, saklı yordamın başlığını ve gövdesini ayırır.

    Saklı yordamın bir ifadesi varsa, ifadeyi çevreleyen BEGIN ve END anahtar sözcükleri isteğe bağlıdır. 
    Ancak, kodu netleştirmek için bunları dahil etmek iyi bir uygulamadır.
*/
CREATE PROCEDURE uspProductList
AS
BEGIN
 SELECT product_name, list_price
 FROM production.products
 ORDER BY product_name
END;

--  Saklı bir yordamı yürütmek için, EXECUTE kullanılır. --
EXECUTE uspProductList;

--  Prosedürü silmek için DROP kullanılır --
DROP PROCEDURE uspProductList;

/*
    Bir değişken bildirmek için DECLARE deyimini kullanırsınız. 
    Örneğin, aşağıdaki ifade @model_year adında bir değişken bildirir:

    Bir değişkene değer atamak için SET deyimini kullanırsınız. 
    Örneğin, aşağıdaki ifade, 2018'i @model_year değişkenine atar:
*/
DECLARE @model_year int;
SET @model_year = 2018;
SELECT product_name , model_year, list_price
FROM production.products
WHERE model_year = @model_year
ORDER BY product_name;

--  Declare örneği --
DECLARE @number1 int ,@number2 int , @toplam int;
SET @number1 = 10
SET @number2 = 33
set @toplam = @number1 + @number2
PRINT 'Toplam : ' + CAST(@toplam AS VARCHAR(10));

--  If else öreneği --
DECLARE @musteriSayisi INT
SELECT @musteriSayisi = COUNT(customer_id) 
FROM sales.customers
IF(@musteriSayisi <= 500)
BEGIN
PRINT 'Müşteri limit aşılmadı :' + cast(@musteriSayisi as VARCHAR(100))
END
ELSE
BEGIN
PRINT 'Müşteri limit aşildı :' + cast(@musteriSayisi as VARCHAR(100))
end;

--  case kullanımı --
Select product_name , model_year , 'degerlendirme'=
Case 
when model_year = 2016 then 'eski kasa'
when model_year = 2018 then 'yeni kasa'
when model_year = 2019 then 'gelecek kasa'
END
FROM production.products
ORDER by model_year;

--  while kullanımı --
DECLARE @sayi INT
set @sayi = 1
WHILE(@sayi <= 10)
BEGIN
PRINT CAST(@sayi as VARCHAR(10)) + '.Raşit'
SET @sayi = @sayi + 1
END

--  Continue kullanmı --
DECLARE @sayi1 INT
set @sayi1 = 1
WHILE(@sayi1 <=10)
BEGIN
IF(@sayi1 =5)
BEGIN
SET @sayi1 = @sayi1 + 1
CONTINUE
END
PRINT CAST(@sayi1 as VARCHAR(10)) + '.Raşit'
SET @sayi1 = @sayi1 + 1
END;

--  GOTO kullanımı --
DECLARE @sayac int
set @sayac = 1
git:
PRINT 'sayac' + cast(@sayac as VARCHAR(10))
SET @sayac = @sayac + 1
WHILE(@sayac <= 10)
BEGIN
GOTO git
end;

--  WAITFOR DELAY kullanımı --
WAITFOR DELAY '00:00:05'
SELECT * FROM sales.customers;

/*
    FUNCTION kodunuzu basitleştirmenize yardımcı olur.
    Örneğin, birçok sorguda görünen karmaşık bir hesaplamanız olabilir. 
    Formülü her sorguya dahil etmek yerine, formülü içine alan ve her sorguda 
    kullanan bir skaler işlev oluşturabilirsiniz.

    İlk olarak, CREATE FUNCTION anahtar sözcüklerinden sonra işlevin adını belirtin. 
    Şema adı isteğe bağlıdır. Açıkça belirtmezseniz, SQL Server varsayılan olarak dbo kullanır.

    İkinci olarak, işlev adından sonra parantez içine alınmış bir parametre listesi belirtin.

    Üçüncü olarak, RETURNS deyiminde dönüş değerinin veri türünü belirtin.

    Son olarak, işlevin gövdesi içinde bir değer döndürmek için bir RETURN ifadesi ekleyin.
*/
CREATE FUNCTION netsatis(@quantity int , @list_price DEC(10,2) , @discount DEC(4,2))
RETURNS DEC (10,2)
AS
BEGIN
RETURN @quantity * @list_price * (1-@discount)
END;

--  Bu şekilde çağırıyoruz --
SELECT dbo.netsatis(10,100,0.1) as net_satis; 

--  Nasıl bir kullanım kolaylığı sağladığını gösteren örnek --
SELECT order_id , 
SUM(dbo.netsatis(quantity,list_price,discount)) as net_satis 
FROM sales.order_items
GROUP BY order_id
ORDER By net_satis DESC;

--  ÖRNEK--
CREATE FUNCTION buyukharf(@gelenDeger VARCHAR(10))
RETURNS VARCHAR(10)
as 
BEGIN
RETURN UPPER(@gelenDeger)
END;

--  Çağrılma yöntemi--
SELECT dbo.buyukharf(city) FROM sales.customers;

/*
    FUNCTION TABLE KULLANIMI
    DÖNÜŞ TABLOSU, işlevin bir tablo döndüreceğini belirtir. 
    Gördüğünüz gibi BEGIN...END ifadesi yok.
    İfade sadece customers tablosundaki verileri sorgular.
*/
CREATE FUNCTION musterileriCagir(@customer_id int)
RETURNS TABLE
AS
RETURN
SELECT customer_id , first_name , last_name 
FROM sales.customers
WHERE customer_id = @customer_id ;

--  Çağrılma şekli --
SELECT * FROM musterileriCagir(1);

/*
    CREATE TRIGGER ifadesi, bir tabloda INSERT, DELETE veya UPDATE gibi bir olay 
    meydana geldiğinde otomatik olarak tetiklenen yeni bir tetikleyici oluşturmanıza olanak tanır.

    İlk olarak, yeni bir tetikleyici oluşturmak için, CREATE TRIGGER yan tümcesinde 
    tetikleyicinin adını ve tetikleyicinin ait olduğu şemayı belirtirsiniz:

    Ardından, ON yan tümcesinde bir olay meydana geldiğinde tetikleyicinin 
    tetikleneceği tablonun adını belirtirsiniz:

    Ardından, AFTER yan tümcesinde tetikleyiciyi çağıracak bir veya daha fazla olayı listelersiniz:

    Tetikleyicinin gövdesi AS anahtar sözcüğüyle başlar:
*/
CREATE TRIGGER kullanıcıEkleme 
on sales.customers
After INSERT
as 
BEGIN
SELECT 'Yeni müşteri eklendi.'
END;

INSERT INTO sales.customers(first_name , last_name , email) VALUES('Raşit','Eşdemir' ,'masit@gmail.com');






