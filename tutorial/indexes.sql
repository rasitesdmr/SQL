-- users adında tablo oluşturalım. id ve first_name sütunları oluşturalım--
CREATE TABLE users(
    id INT NOT NULL,
    first_name VARCHAR(20)
);

-- içine ekleme yapalım --
INSERT INTO users(id,first_name)
VALUES(1,'Raşit') , (2, 'Ömer') , (3,'Ayşe');

/*
    indexes temel amacı istenen bilginin daha az bilgi okunarak hada kısa zamanda getirmesini sağlamaktır.

    users tablosunun birincil anahtarı yok. 
    Bu nedenle SQL Server, satırlarını yığın adı verilen sırasız bir yapıda depolar.

    users tablosundaki verileri sorguladığınızda, sorgu optimize 
    edicinin arama yapmak için tüm tabloyu taraması gerekir.

    users tablosunda yalnızca dört satır olduğundan, sorgu çok hızlı yürütülür. 
    Ancak, tablo çok sayıda satır içeriyorsa, veri aramak çok zaman ve kaynak alacaktır.

    Bu sorunu çözmek için SQL Server, index adlı bir tablodan 
    satırların alınmasını hızlandırmak için özel bir yapı sağlar.

    SQL Server'ın iki tür dizini vardır: kümelenmiş dizin ve kümelenmemiş dizin.
*/;

/*
    Kümelenmiş bir dizin, veri satırlarını anahtar(primary key) değerlerine göre sıralanmış 
    bir yapıda saklar. Veri satırları yalnızca bir sırada sıralanabildiğinden, 
    her tablonun yalnızca bir kümelenmiş dizini vardır. Kümelenmiş bir dizine 
    sahip bir tabloya kümelenmiş tablo denir.

    Bir tablonun birincil anahtarı yoksa, ki bu çok nadirdir, ona kümelenmiş 
    bir dizin eklemek için CREATE CLUSTERED INDEX deyimini kullanabilirsiniz.

    Aşağıdaki ifade, dbo.users tablosu için kümelenmiş bir dizin oluşturur:
*/
CREATE CLUSTERED INDEX id
ON dbo.users(id);

CREATE INDEX first_name
On dbo.users(first_name);


-- İstatislik verilerini görmemiz için aktif etmeliyiz --
SET STATISTICS IO ON
Set STATISTICS TIME ON

