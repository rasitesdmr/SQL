-- Normal bir şekilde SELECET sorgusunu kullanarak verilerimizi çekelim --
SELECT product_name , brand_name , list_price 
FROM production.products p
INNER JOIN production.brands b 
ON p.brand_id = b.brand_id;

/*
  Bir dahaki sefere aynı sonuç kümesini almak istiyorsanız, 
  bu sorguyu bir metin dosyasına kaydedebilir, 
  açabilir ve yeniden çalıştırabilirsiniz.

  SQL Server, bu sorguyu bir görünüm aracılığıyla veritabanı 
  kataloğuna kaydetmenin daha iyi bir yolunu sağlar

  Görünüm, veritabanı kataloğunda saklanan ve daha sonra başvurmanıza 
  izin veren adlandırılmış bir sorgudur.

  Bu nedenle yukarıdaki sorgu, CREATE VIEW deyimi kullanılarak aşağıdaki 
  gibi bir görünüm olarak saklanabilir:
*/
CREATE VIEW urunbilgisi
AS
SELECT product_name ,brand_name ,list_price
FROM production.products p
INNER JOIN production.brands b
ON p.brand_id = b.brand_id;

-- Daha sonra SELECT deyimindeki görünüme aşağıdaki gibi bir tablo gibi başvurabilirsiniz:--
SELECT * FROM dbo.urunbilgisi;

-- Biz Bu Sorguyu çalıştırdığımızda aşşağıdaki sorgu yürütülüyor --
SELECT * 
FROM(
    SELECT product_name , brand_name , list_price 
     FROM production.products p
     INNER JOIN production.brands b
     ON p.brand_id = b.brand_id
);

/*
    Peki Views kullanmak bize ne getirir.

    1-) Güvenlik (Security)
    Kullanıcıların doğrudan bir tabloya erişmelerini kısıtlayabilir ve 
    görünümler aracılığıyla bir veri alt kümesine erişmelerine izin verebilirsiniz.

    2-) Basitlik (Simplicity)
    İlişkisel bir veritabanında, gezinmeyi zorlaştıran bire bir ve bire çok gibi 
    karmaşık ilişkilere sahip birçok tablo olabilir.
    Ancak, bir dizi görünüm kullanarak birleşimler ve koşullarla karmaşık sorguları basitleştirebilirsiniz.

*/


