# SQL NEDİR ?

<img src = "https://github.com/rasitesdmr/SQL/blob/master/images/sql1.png">

* Structured Query Language kelimelerinin kısaltılmışı olan SQL bir veri tabanı uygulamasıdır.
* Türkçe karşılığı Yapılandırılmış Sorgu Dili anlamına gelmektedir.
* Birçok veriyi farklı boyutlarda ve farklı fonksiyonlarda barındıran veri tabanlarını yönetim sistemine verilen isimdir.
* SQL ile bu verilerin yönetimi, silinmesi, aktif edilmesi ve üzerinde çalışılması mümkündür.
* Bir programlama dili olmamasına karşın çoğu kişi tarafından bir dil olarak algılanır ve bilinir. 
* Oysa tam anlamıyla veri tabanında kullanılabilecek bir alt dildir. 

## SQL Ne İşe Yarar ?

* Veri tabanında var olan verileri kaydedebilirsiniz.
* Veri tabanına yeni veriler çekebilirsiniz.
* Veri tabanındaki verilerin tamamını güncelleyebilirsiniz.
* Milyonlarca veri üzerinden sorgulama ve arama yapabilirsiniz.
* Verileri silebilir, veri kayıtlarını yeniden oluşturarak yeni bir veri tabanı kurabilirsiniz
* Veri tabanına ait yeni tablolar üretebilirsiniz.
* Kimlerin veri tabanına bağlanarak verilere ulaşabileceğini ayarlayabilir, güvenlik ayarlarınızı bu doğrultuda değiştirebilirsiniz.

## SQL İle Kontrol Edebileceğiniz Veri Tabanları ? 

* MySQL
* Mssql
* Microsoft SQL Server
* Oracle
* IBM Database 2 (IBM DB2)
* PostgreSQL

# SQL Server Nedir ?

<img src ="https://github.com/rasitesdmr/SQL/blob/master/images/sql2.jfif">

* SQL Server nedir sorusu tüm veri tabanı ile ilgili kişiler tarafından soruluyor.
* Çünkü SQL ile verileri işleyebilmek için bir server gerekiyor ve bunu bize Microsoft sağlıyor. 
* RDBMS ismi verilen SQL server Microsoft tarafından ilişkisel veri yönetimi için geliştirildi. Relational Database Management System (İlişkisel veritabanı yönetim sistemi) olarak kısaltılmış olan bu tanım veri yönetiminde ilişkili ya da ilişkisi olmayan verileri kolayca kontrol etmemize olanak sağlıyor.
* SQL server ile web ya da masaüstü uygulaması geliştiren programcıya rastlayamazsınız.
* Bu uygulamaların çekirdeğini oluşturan verileri SQL server içinde barındıran programcılara rastlayabilirsiniz.
* Program geliştirirken SQL server ile gayet uyumlu olan Visual Basic.NET ya da C# kullanmanız daha olasıdır.
* Uygulamayı bu program dilleriyle geliştirerek verilerinizi işledikten sonra T-SQL kodlarıyla istediğiniz platform üzerinde kullanmanız mümkün olacak.

## T-SQL NEDİR ? 

* Transact (işlem yapmak) SQL anlamına gelen kısaltmadır.
* SQL server içinde barındırdığınız verilerin bir kullanıcıya ulaşmadan önce istemci yani Client ile akışını sağlayan sistemdir.
* Kolay kullanımı ile çok tercih edilmektedir.

# SQL Server Mimarisi ? 

<img src = "https://github.com/rasitesdmr/SQL/blob/master/images/sql3.png">

* SQL Server iki ana bileşenden oluşur:
* Database Engine
* SQLOS

## Database Engine ? 

* SQL Server'ın temel bileşeni Veritabanı Motorudur.
* Veritabanı Motoru, sorguları işleyen bir ilişkisel motor ve veritabanı dosyalarını, sayfaları, dizinleri vb. yöneten bir depolama motorundan oluşur.

### Relational Engine (İlişkisel Motor) ?

 * İlişkisel motor, giriş sorgusuna dayalı olarak depolama motorundan veri ister ve sonuçları işler.
 * İlişkisel motorun bazı görevleri arasında sorgulama işlemi, bellek yönetimi, iş parçacığı ve görev yönetimi, arabellek yönetimi ve dağıtılmış sorgu işleme yer alır.

 ### Storage Engine (Depolama Motoru) ?

 * Depolama motoru, diskler ve SAN gibi depolama sistemlerinden verilerin depolanmasından ve alınmasından sorumludur.

## SQLOS ?
* İlişkisel motor ve depolama motorunun altında SQL Server İşletim Sistemi veya SQLOS bulunur.
* SQLOS, bellek ve G/Ç yönetimi gibi birçok işletim sistemi hizmeti sağlar.
* Diğer hizmetler, istisna işleme ve senkronizasyon hizmetlerini içerir.


