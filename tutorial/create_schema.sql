/*
1-) Şema, tablolar (tables), görünümler (views), tetikleyiciler (triggers), 
    saklı yordamlar(stored procedures), dizinler (indexes) vb. dahil olmak üzere 
    bir veritabanı nesneleri topluluğudur.

2-) Bir şema her zaman bir veritabanına aittir.

3-) Öte yandan, bir veritabanı bir veya birden fazla şemaya sahip olabilir.

4-) Yeni oluşturulan bir veritabanı için varsayılan şema, dbo kullanıcı hesabına
    ait olan dbo'dur. Varsayılan olarak, CREATE USER komutuyla yeni bir kullanıcı 
    oluşturduğunuzda, kullanıcı varsayılan şeması olarak dbo'yu alacaktır.

5-) CREATE SCHEMA ifadesi, geçerli veritabanında yeni bir şema oluşturmanıza olanak tanır.
*/
 CREATE SCHEMA customer;

 