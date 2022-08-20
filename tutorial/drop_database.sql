/*
1-) Mevcut bir veritabanını bir SQL Server örneğinden kaldırmak 
    için DROP DATABASE deyimini kullanırsınız.
*/
DROP DATABASE deneme;

/*
2-) Tek bir ifade kullanarak birden çok veritabanını bırakmak istiyorsanız, 
    DROP DATABASE yan tümcesinden sonra virgülle ayrılmış veritabanı adları 
    listesi kullanabilirsiniz.
*/
DROP DATABASE deneme1 , deneme2 , deneme3;

/*
3-) Yalnızca veritabanı zaten mevcutsa, bir veritabanını koşullu olarak 
    silmenize izin verir. IF EXISTS (EĞER VARSA) seçeneğini belirtmeden 
    var olmayan bir veritabanını silmeye çalışırsanız, SQL Server bir hata verecektir.
*/
DROP DATABASE IF EXISTS deneme;