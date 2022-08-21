USE BikeStores;
/*
1-) Bir değişken bildirmek için DECLARE deyimini kullanırsınız. 

2-) DECLARE deyimi, bir değişkene bir ad ve bir veri türü atayarak bir değişkeni başlatır.

3-) Değişken adı @ işaretiyle başlamalıdır

4-) Örneğin, aşağıdaki ifade @model_year adında bir değişken bildirir:
*/
DECLARE @model_year INT;

/*
5-) Birden çok değişken bildirmek için değişkenleri virgülle ayırırsınız
*/
DECLARE @model_year INT
        @product_name VARCHAR(20);

/*
6-) Bir değişkene değer atamak için SET deyimini kullanırsınız.

7-) Örneğin, aşağıdaki ifade, 2018'i @model_year değişkenine atar.
*/
SET @model_year = 2018;

/*
8-) Hadi şimdi gelelim örnek yapmaya.
*/
DECLARE @model_year INT
SET @model_year = 2018;
SELECT product_name , list_price , model_year
FROM production.products
WHERE model_year = @model_year
ORDER BY list_price;

/*
9-) Bu örnekte Sorgu sonucunu bir değişkende saklamayı yapalım.
*/
DECLARE @urunSayisi INT
SET @urunSayisi =  (
    SELECT 
        COUNT(*)
    FROM production.products
);

PRINT @urunSayisi;