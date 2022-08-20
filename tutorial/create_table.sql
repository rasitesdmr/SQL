/*
1-) Tablolar veri tabanında veri depolamak için kullanılır. 
    Tablolar, bir veritabanı ve şema içinde benzersiz olarak adlandırılır. 
    Her tablo bir veya daha fazla sütun içerir. Ve her sütunun, örneğin sayılar, 
    dizeler veya geçici veriler gibi depolayabileceği veri türünü tanımlayan 
    ilişkili bir veri türü vardır.

2-) İlk olarak, tablonun oluşturulduğu veritabanının adını belirtin.

3-) İkinci olarak, yeni tablonun ait olduğu şemayı belirtin.

4-) Üçüncüsü, yeni tablonun adını belirtin.

5-) Dördüncüsü, her tablonun bir veya daha fazla sütundan oluşan bir birincil 
    anahtarı olmalıdır. Tipik olarak, önce birincil anahtar sütunlarını, ardından 
    diğer sütunları listelersiniz. Birincil anahtar yalnızca bir sütun içeriyorsa, sütun 
    adından sonra PRIMARY KEY anahtar sözcüklerini kullanabilirsiniz.

6-) Her sütunun, ifadedeki adından sonra belirtilen ilişkili bir veri türü vardır. 
    Bir sütun, NOT NULL ve UNIQUE gibi bir veya daha fazla sütun kısıtlamasına sahip olabilir.

7-) Bir tabloda FOREIGN KEY, PRIMARY KEY, UNIQUE and CHECK gibi tablo kısıtlamaları olabilir.
*/
CREATE TABLE users(
    user_id INT PRIMARY KEY IDENTITY(1,1),
    first_name VARCHAR(20) NOT NULL,
    last_name VARCHAR(20) NOT NULL,
    date_of_registration DATETIME,
    phone VARCHAR(10),
    product_id INT NOT NULL,
    FOREIGN KEY (product_id) REFERENCES products (product_id)
);

/*
8-) Oluşturduğumuz tabloya yeni bir sütun eklemek için ALTER TABLE tablo_adı ADD kullanırız .
*/
ALTER TABLE users 
ADD 
username VARCHAR(20) NOT NULL,
PASSWORD int ;

