create table satici(
    satis_fiyati int,
    alis_fiyati int,
    kur int,
    paket_no int,
    toplam_metreküp int primary key,
    malzeme_turu varchar(50)
);
create table mal_sahibi(
    firma_adi varchar(59) primary key,
    yer varchar(50),
    mal_türü varchar(50),
    mal_miktari int,
    fiyat int not NULL
);
create table alir(
    alirid int primary key,
    firma_adiid varchar(59),
    toplam_metreküpid int,
    constraint fk_alir_firmaadiid foreign key (firma_adiid) references mal_sahibi,
    constraint fk_alir_toplammetreküpid foreign key (toplam_metreküpid) references satici
);
create table ilk_lojistik(
    irsaliye_no int primary key not NULL,
    irsaliye_no_tarih date,
    arac_model varchar(50),
    mesafe int
);
create table anlasir(
    anlasirid int primary key,
    ilk_lojistikid int,
    firma_id varchar(59),
    constraint fk_anlasir_ilklojistikid foreign key (ilk_lojistikid) references ilk_lojistik,
    constraint fk_anlasir_firmaid foreign key (firma_id) references mal_sahibi
);
create table ilk_sofor(
    plaka varchar (8) primary key not null,
    isim varchar(35),
    soyisim varchar(35),
    dogum_tarihi date,
    arac_km int,
    irsaliyenoid int,
    constraint fk_ilksofor_irsaliyenoid foreign key (irsaliyenoid) references ilk_lojistik
);
create table lojistik_2(
    irsaliye_no2 int primary key not null,
    irsaliye_no2_tarih date,
    arac_model2 varchar(35),
    mesafe int,
);
create table anlasýr_2(
    anlasýr2id int primary key,
    metreküpid int,
    irsaliyeid int,
    constraint fk_anlasýr2_metreküpid foreign key (metreküpid) references satici,
    constraint fk_anlasýr2_irsaliyeid foreign key (irsaliyeid) references lojistik_2
);
create table sofor_2(
    plaka2 varchar(8) primary key not null,
    isim2 varchar (35),
    soyisim2 varchar (35),
    dogum_tarihi2 date,
    arac2_km int,
    irsaliyeno2id int,
    constraint fk_sofor2_irsaliyeno2id foreign key (irsaliyeno2id) references lojistik_2
);
create table musteri(
    toplam_satis_m3 int primary key not null,
    satis_fiyati int,
    musteri_firma_adi varchar(50),
    satis_tarihi date,
    yer varchar(50),
    satilan_malzeme varchar(50)
);
create table tasir(
    tasirid int primary key,
    irsaliye_no2_musteriid int,
    toplam_satisid int,
    constraint fk_tasir_irsaliyeno2musteriid foreign key (irsaliye_no2_musteriid) references lojistik_2,
    constraint fk_tasir_toplamsatisid foreign key (toplam_satisid) references musteri
);
create table satici_anlasýr_musteri(
satici_anlasirid int primary key,
toplam_m3id int,
toplam_satism3id int,
constraint fk_saticianlasýrmusteri_toplamm3id foreign key (toplam_m3id) references satici,
constraint fk_saticianlasýrmusteri_toplamsatism3id foreign key (toplam_satism3id) references musteri
);


select*
from satici;

update satici set satis_fiyati='7500';
update mal_sahibi set yer='bolu' where mal_miktari='42'

alter table satici
add dolar_kur int;

insert into satici
values('6800','4500','16','152','75','masa','11')




