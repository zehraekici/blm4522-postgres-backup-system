# PostgreSQL Yedekleme ve Otomasyon Projesi

## Proje Amacı
Bu projede PostgreSQL veritabanı için yedekleme (backup) işlemleri otomatik hale getirilmiştir. 
Ayrıca yedeklerin düzenli alınması, loglanması ve gerektiğinde geri yüklenmesi (restore) sağlanmaktadır.

## Özellikler
- pg_dump ile veritabanı yedekleme
- Bash script ile otomasyon
- Cron ile zamanlanmış görev (SQL Server Agent karşılığı)
- Loglama ve hata kontrolü
- Yedek geri yükleme (restore) işlemi

## Kullanılan Teknolojiler
- PostgreSQL
- Bash (Shell Script)
- Cron

## Proje Yapısı
```text
pg_backup_project/
.
├── scripts/
│   ├── backup.sh
├── backups/
├── logs/
└── README.md


## Kurulum
Script dosyasına çalıştırma izni verilir:

```bash
chmod +x scripts/backup.sh

### Manuel Yedek Alma

./scripts/backup.sh

### Otomatik Yedekleme (Cron)

Cron ile belirli aralıklarla otomatik yedek alınır:
crontab -e

(Örnek: her gün saat 02.00)
0 2 * * * ~/pg_backup_project/scripts/backup.sh >> ~/pg_backup_project/logs/cron.log 2>&1

### Yedekleri Kontrol Etme
ls backups
cat logs/cron.log


### Geri Yükleme (Restore)
psql -U postgres backup_demo < backups/backup.sql

---

## NOT
Yedek dosyaları ve loglar güvenlik ve performans nedeniyle GitHub reposuna eklenmemiştir.
Bu dosyalar çalışma sırasında dinamik olarak oluşturulmaktadır.


