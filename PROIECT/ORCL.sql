create table BROKER (id_broker number(5) constraint pk_broker primary key,
                    nume varchar2(25) constraint nume_null not null);


create table CLIENT (id_client number(5) constraint pk_client primary key,
                     id_broker number(5) not null,
                     nume varchar2(25) constraint nume_client_null not null,
                     prenume varchar2(25) constraint prenume_client_null not null,
                     cnp number(15),
                     constraint fk_broker foreign key (id_broker) references BROKER(id_broker)
                     );

create table PORTOFOLIU (id_portofoliu number(6) constraint pk_portofoliu primary key, 
                         id_client number(5) not null,
                         balanta number(10),
                         constraint fk_client foreign key (id_client) references CLIENT(id_client));

create table ORDIN (id_ordin number(5) constraint pk_ordin primary key,
                    id_portofoliu number(6) not null,
                    tip varchar2 (10) not null,
                    numar number(7),
                    pret_unitate number(8,2),
                    stare varchar2(10) not null,
                    constraint fk_portofoliu foreign key (id_portofoliu) 
                    references PORTOFOLIU(id_portofoliu)
                    );
                    
create table ETF   (id_etf number(5) constraint pk_etf primary key,
                    id_ordin number(5) not null,
                    simbol varchar2(25) not null,
                    pret_curent number(10,2),
                    constraint fk_ordin foreign key (id_ordin) 
                    references ORDIN(id_ordin)
                    );
                    
create table OBLIGATIUNE    (id_obligatiune number(5) constraint pk_obligatiune primary key,
                            id_ordin number(5) not null,
                            emitent varchar2(25) constraint emitent_obligatiune_null not null,
                            valoare number(7,2),
                            data_scadenta date not null,
                            constraint fk_ordin_obligatiune foreign key (id_ordin) references ORDIN(id_ordin)
                    );

create table COMPANIE (id_companie number(5) constraint pk_companie primary key,
                       nume varchar2(25) constraint nume_companie not null,
                       simbol varchar2(10) constraint simbol_companie not null,
                       capitalizare number(15),
                       sector varchar2(20) constraint sector_companie not null
                       );
                       
create table DIVIDEND (id_dividend number(5) constraint pk_dividend primary key,
                       id_companie number(5) not null,
                       valoare number(15,2),
                       data_plata date not null,
                       constraint fk_dividend_companie foreign key (id_companie) references COMPANIE(id_companie)
                       );

create table ACTIUNE (id_actiune number(5) constraint pk_actiune primary key,
                      id_ordin number(5) not null, 
                      id_companie number(5) not null,
                      pret_curent number(7,2),
                      constraint fk_actiune_ordin foreign key (id_ordin) references ORDIN(id_ordin),
                      constraint fk_actiune_companie foreign key (id_companie) references COMPANIE(id_companie)
                      );

create table ACTIONAR (id_actionar number(5) constraint pk_actionar primary key,
                       nume varchar2(25) constraint nume_actionar not null,
                       adresa varchar2(25) constraint adresa_actionar not null,
                       tip_actionar varchar2(20) constraint chk_actionar check 
                       (tip_actionar in ('persoana fizica', 'persoana juridica'))
                       );

create table INVESTESTE (id_act_comp number(5) constraint pk_actionar_companie primary key,
                         id_actionar number(5) not null,
                         id_companie number(5) not null,
                         data_achizitie date not null,
                         procent number(3),
                         valoare_investitie number(10),
                         constraint fk_inv_act foreign key (id_actionar) references ACTIONAR(id_actionar),
                         constraint fk_inv_comp foreign key (id_companie) references COMPANIE(id_companie)
                         );

create table DETINE (id_detine number(5) constraint pk_detine primary key,
                     id_client number(5) not null,
                     id_portofoliu number(6) not null,
                     id_actiune number(5) not null,
                     data_achizitie date constraint data_ach_cln not null,
                     constraint fk_cln_det foreign key (id_client) references CLIENT(id_client),
                     constraint fk_por_det foreign key (id_portofoliu) references PORTOFOLIU(id_portofoliu),
                     constraint fk_act_det foreign key (id_actiune) references ACTIUNE(id_actiune)
                     );




INSERT INTO BROKER VALUES (100, 'Tradeville');
INSERT INTO BROKER VALUES (101, 'XTB');
INSERT INTO BROKER VALUES (102, 'Interactive Brokers');
INSERT INTO BROKER VALUES (103, 'BRK Financial Group');
INSERT INTO BROKER VALUES (104, 'Swiss Capital');
INSERT INTO BROKER VALUES (105, 'Finconta');
INSERT INTO BROKER VALUES (106, 'BCR Invest');
INSERT INTO BROKER VALUES (107, 'United Capital');
INSERT INTO BROKER VALUES (109, 'Eurobroker');
INSERT INTO BROKER VALUES (110, 'IFB Finwest');
INSERT INTO BROKER VALUES (472, 'GOLDRING');
select * from broker;
commit;
--////////////////////////////////////////////////////////////////
INSERT INTO CLIENT VALUES (7381, 105, 'Popescu', 'Mihai', 5030925280154);
INSERT INTO CLIENT VALUES (7401, 102, 'Petre', 'Cristian', 5020812180256);
INSERT INTO CLIENT VALUES (3281, 105, 'Popescu', 'Mihai', 5030925280154);
INSERT INTO CLIENT VALUES (1000, 106, 'Stefanescu', 'Alexandru', 5000217170069);
INSERT INTO CLIENT VALUES (923, 472, 'Ionescu', 'Miruna', 6020228180154);
INSERT INTO CLIENT VALUES (927, 100, 'Dan', 'Liviu', 5010215189801);
INSERT INTO CLIENT VALUES (342, 101, 'Ralea', 'Andreea', 2900223123456);
INSERT INTO CLIENT VALUES (328, 107, 'Matala', 'Darius', 1890701234567);
INSERT INTO CLIENT VALUES (594, 107, 'Mardare', 'Mihnea', 1920320123456);
INSERT INTO CLIENT VALUES (2439, 102, 'Toc', 'Theodor', 1910702123456);
INSERT INTO CLIENT VALUES (238, 103, 'Sorinescu', 'Catalin', 1740504123456);
INSERT INTO CLIENT VALUES (1992, 103, 'Niculescu', 'Ion', 1760102123456);
INSERT INTO CLIENT VALUES (813, 106, 'Stoica', 'Andrei',1750218123456);
INSERT INTO CLIENT VALUES (653, 106, 'Gheorghe', 'Radu', 1940425123456);
INSERT INTO CLIENT VALUES (290, 109, 'Dragomir', 'Bogdan', 1920334455667);
INSERT INTO CLIENT VALUES (119, 110, 'Simion', 'Sorin', 1940556677889);
INSERT INTO CLIENT VALUES (568, 472, 'Porumbescu', 'Liviu', 1980990011223);
INSERT INTO CLIENT VALUES (992, 110, 'Toma', 'Rares', 1960778899001);
INSERT INTO CLIENT VALUES (444, 104, 'Casian', 'Sorin', 1900416123456);
select * from client;
commit;
--/////////////////////////////////////////////////////////////////////////////////
INSERT INTO PORTOFOLIU VALUES (1234, 444, 6000);
INSERT INTO PORTOFOLIU VALUES (5678, 238, 7500);
INSERT INTO PORTOFOLIU VALUES (9012, 1992, 90000);
INSERT INTO PORTOFOLIU VALUES (3456, 1992, 0);
INSERT INTO PORTOFOLIU VALUES (7890, 813, 5000);
INSERT INTO PORTOFOLIU VALUES (2345, 653, 10000000);
INSERT INTO PORTOFOLIU VALUES (6789, 290, 25000);
INSERT INTO PORTOFOLIU VALUES (1230, 119, 98765430);
INSERT INTO PORTOFOLIU VALUES (4561, 568, 8000);
INSERT INTO PORTOFOLIU VALUES (7903, 992, 60000000);
INSERT INTO PORTOFOLIU VALUES (2342, 444, 12000);
INSERT INTO PORTOFOLIU VALUES (6784, 3281, 3456789123);
INSERT INTO PORTOFOLIU VALUES (125, 1000, 9500);
INSERT INTO PORTOFOLIU VALUES (4566, 923, 100000001);
INSERT INTO PORTOFOLIU VALUES (8907, 927, 42000);
INSERT INTO PORTOFOLIU VALUES (2348, 342, 5678912345);
INSERT INTO PORTOFOLIU VALUES (6780, 328, 20000);
INSERT INTO PORTOFOLIU VALUES (7129, 594, 78123456);
INSERT INTO PORTOFOLIU VALUES (4563, 2439, 15000);
commit;
select * from portofoliu;
--/////////////////////////////////////////////////////////////////////////////////
INSERT INTO ORDIN VALUES (592, 1234, 'vanzare', 34, 1222.3, 'deschis');
INSERT INTO ORDIN VALUES (5434, 1234, 'vanzare', 6000, 100, 'inchis');
INSERT INTO ORDIN VALUES (711, 5678, 'vanzare', 34, 771.3, 'deschis');
INSERT INTO ORDIN VALUES (5876, 9012, 'cumparare', 1000, 2.3, 'inchis');
INSERT INTO ORDIN VALUES (555, 3456, 'vanzare', 10, 22.9, 'inchis');
INSERT INTO ORDIN VALUES (222, 3456, 'cumparare', 354, 4422.1, 'deschis');
INSERT INTO ORDIN VALUES (598, 7890, 'vanzare', 1000, 96.5, 'deschis');
INSERT INTO ORDIN VALUES (792, 2345, 'cumparare', 4, 8800, 'inchis');
INSERT INTO ORDIN VALUES (888, 2345, 'cumparare', 3, 100000, 'deschis');
INSERT INTO ORDIN VALUES (900, 6789, 'vanzare', 1000, 9999, 'deschis');
INSERT INTO ORDIN VALUES (687, 6789, 'cumparare', 3114, 686.5, 'inchis');
INSERT INTO ORDIN VALUES (777, 1230, 'vanzare', 1200, 22.2, 'deschis');
INSERT INTO ORDIN VALUES (551, 4561, 'vanzare', 2, 56622.7, 'inchis');
INSERT INTO ORDIN VALUES (567, 7903, 'cumparare', 6660, 1222.8, 'deschis');
INSERT INTO ORDIN VALUES (5923, 2342, 'cumparare', 778, 8998.1, 'deschis');
INSERT INTO ORDIN VALUES (87655, 6784, 'cumparare', 3002, 1222.3, 'inchis');
INSERT INTO ORDIN VALUES (4564, 125, 'vanzare', 3, 12.9, 'inchis');
INSERT INTO ORDIN VALUES (3443, 4561, 'vanzare', 7, 12227.1, 'deschis');
INSERT INTO ORDIN VALUES (110, 4566, 'vanzare', 10000, 6, 'deschis');
INSERT INTO ORDIN VALUES (112, 4566, 'cumparare', 2, 880.3, 'deschis');
INSERT INTO ORDIN VALUES (668, 8907, 'cumparare', 1, 5765.5, 'inchis');
INSERT INTO ORDIN VALUES (999, 2348, 'vanzare', 60, 3765.1, 'deschis');
INSERT INTO ORDIN VALUES (1000, 6780, 'cumparare', 99999, 0.8, 'inchis');
INSERT INTO ORDIN VALUES (1010, 7129, 'vanzare', 3, 789.9, 'inchis');
INSERT INTO ORDIN VALUES (1111, 7129, 'vanzare', 5, 900, 'deschis');
INSERT INTO ORDIN VALUES (6799, 4563, 'cumparare', 10, 100000, 'inchis');
select * from ordin;
--/////////////////////////////////////////////////////////////////////////////////
INSERT INTO ETF VALUES(6712, 5434, 'SPY', 110);
INSERT INTO ETF VALUES(1000, 598, 'QQQ', 280.5);
INSERT INTO ETF VALUES(267, 777, 'VTI', 12.8);
INSERT INTO ETF VALUES(85, 4564, 'EEM', 60);
INSERT INTO ETF VALUES(676, 1000, 'AGG', 5.5);
INSERT INTO ETF VALUES(893, 1111, 'VOO', 1000);
select * from etf;
--/////////////////////////////////////////////////////////////////////////////////
INSERT INTO OBLIGATIUNE VALUES(355, 6799, 'Banca Transilvania', 20000, TO_DATE('16-MAY-2023', 'DD-MON-YYYY'));
INSERT INTO OBLIGATIUNE VALUES(789, 112, 'Romgaz', 1000.5, TO_DATE('19-FEB-2020', 'DD-MON-YYYY'));
INSERT INTO OBLIGATIUNE VALUES(600, 110, 'Ministerul Finantelor', 7.1, TO_DATE('20-JAN-2022', 'DD-MON-YYYY'));
INSERT INTO OBLIGATIUNE VALUES(800, 687, 'CEC Bank', 600, TO_DATE('01-JUN-2012', 'DD-MON-YYYY'));
INSERT INTO OBLIGATIUNE VALUES(1000, 711, 'ING', 1180.2, TO_DATE('09-SEP-2022', 'DD-MON-YYYY'));
INSERT INTO OBLIGATIUNE VALUES(2020, 555, 'Ministerul Culturii', 12, TO_DATE('26-OCT-2022', 'DD-MON-YYYY'));
select * from OBLIGATIUNE;
--/////////////////////////////////////////////////////////////////////////////////
INSERT INTO COMPANIE VALUES(757, 'Romgaz', 'SNG', 6000000000, 'energie');
INSERT INTO COMPANIE VALUES(685, 'Banca Transilvania', 'TLV', 9000000000, 'bancar');
INSERT INTO COMPANIE VALUES(545, 'One United Properties', 'ONE', 400000000, 'imobiliar');
INSERT INTO COMPANIE VALUES(444, 'OMV Petrom', 'SNP', 5000000000, 'petrol si gaze');
INSERT INTO COMPANIE VALUES(324, 'Antibiotice Iasi', 'ATB', 6000000000, 'farmaceutic');
INSERT INTO COMPANIE VALUES(877, 'Transelectrica', 'TEL', 20000000, 'distributie energie');
INSERT INTO COMPANIE VALUES(363, 'Aeroportul Henri Coanda', 'BBU', 900000000, 'transporturi');
INSERT INTO COMPANIE VALUES(12, 'Aquila', 'AQA', 70000000, 'energie');
INSERT INTO COMPANIE VALUES(807, 'Transgaz', 'SNG', 7500000000, 'energie');
INSERT INTO COMPANIE VALUES(576, 'Purcari', 'WINE', 22000000, 'vitivinicola');
INSERT INTO COMPANIE VALUES(457, 'Medlife', 'M', 600000000, 'medical');
INSERT INTO COMPANIE VALUES(222, 'Regina Maria', 'RM', 800000000, 'medical');
select * from companie;
--/////////////////////////////////////////////////////////////////////////////////
INSERT INTO ACTIONAR VALUES(883, 'Electrica', 'Bucuresti', 'persoana juridica');
INSERT INTO ACTIONAR VALUES(587, 'Ionescu Daria', 'Botosani', 'persoana fizica');
INSERT INTO ACTIONAR VALUES(999,  'Castellano Joshua', 'Constanta', 'persoana fizica');
INSERT INTO ACTIONAR VALUES(13, 'Sasu Jean', 'Bucuresti', 'persoana fizica');
INSERT INTO ACTIONAR VALUES(646, 'Pop Florin', 'Constanta', 'persoana fizica');
INSERT INTO ACTIONAR VALUES(456,  'BOA Entertainment SRL', 'Bucuresti', 'persoana juridica');
INSERT INTO ACTIONAR VALUES(554, 'Tiras Invest SRL', 'Bucuresti', 'persoana juridica');
INSERT INTO ACTIONAR VALUES(8483,  'Mihalache Marius', 'Bucuresti', 'persoana fizica');
INSERT INTO ACTIONAR VALUES(333, 'Nuba SRL', 'Bucuresti', 'persoana juridica');
INSERT INTO ACTIONAR VALUES(534, 'Stan Eric', 'Timisoara', 'persoana fizica');
INSERT INTO ACTIONAR VALUES(303,  'Urdu Florina', 'Timisoara', 'persoana fizica');
INSERT INTO ACTIONAR VALUES(56, 'Codreanu Alexandra', 'Iasi', 'persoana fizica');
INSERT INTO ACTIONAR VALUES(3,  'Biris Ion', 'Constanta', 'persoana fizica');
INSERT INTO ACTIONAR VALUES(888,  'Paval Sorin', 'Botosani', 'persoana fizica');
INSERT INTO ACTIONAR VALUES(500, 'Paval Alex', 'Timisoara', 'persoana fizica');
INSERT INTO ACTIONAR VALUES(76, 'Kapital SRL', 'Bucuresti', 'persoana juridica');
INSERT INTO ACTIONAR VALUES(2691, 'Biris Georgiana', 'Constanta', 'persoana fizica');
INSERT INTO ACTIONAR VALUES(446, 'Ghinea Andra', 'Galati', 'persoana fizica');
INSERT INTO ACTIONAR VALUES(676, 'Mihalcea Jasmina', 'Galati', 'persoana fizica');
INSERT INTO ACTIONAR VALUES(7567, 'Mihalcea Jasmina', 'Galati', 'persoana fizica');
select * from actionar;
--/////////////////////////////////////////////////////////////////////////////////
create SEQUENCE id_dividend
start with 1000
increment by 2
nocache
nocycle;

INSERT INTO DIVIDEND VALUES(id_dividend.nextval, 757, 1.2, TO_DATE('26-DEC-2012', 'DD-MON-YYYY'));
INSERT INTO DIVIDEND VALUES(id_dividend.nextval, 757, 1.3, TO_DATE('23-JAN-2020', 'DD-MON-YYYY'));
INSERT INTO DIVIDEND VALUES(id_dividend.nextval, 757, 0.2, TO_DATE('14-MAY-2019', 'DD-MON-YYYY'));
INSERT INTO DIVIDEND VALUES(id_dividend.nextval, 685, 7.5, TO_DATE('06-DEC-2022', 'DD-MON-YYYY'));
INSERT INTO DIVIDEND VALUES(id_dividend.nextval, 545, 0.11, TO_DATE('16-DEC-2022', 'DD-MON-YYYY'));
INSERT INTO DIVIDEND VALUES(id_dividend.nextval, 444, 50.5, TO_DATE('19-MAY-2022', 'DD-MON-YYYY'));
INSERT INTO DIVIDEND VALUES(id_dividend.nextval, 324, 0.25, TO_DATE('01-MAY-2022', 'DD-MON-YYYY'));
INSERT INTO DIVIDEND VALUES(id_dividend.nextval, 324, 0.05, TO_DATE('07-JAN-2022', 'DD-MON-YYYY'));
INSERT INTO DIVIDEND VALUES(id_dividend.nextval, 877, 2.8, TO_DATE('09-MAY-2021', 'DD-MON-YYYY'));
INSERT INTO DIVIDEND VALUES(id_dividend.nextval, 877, 0.7, TO_DATE('11-MAY-2020', 'DD-MON-YYYY'));
INSERT INTO DIVIDEND VALUES(id_dividend.nextval, 877, 0.9, TO_DATE('30-DEC-2021', 'DD-MON-YYYY'));
INSERT INTO DIVIDEND VALUES(id_dividend.nextval, 363, NULL, TO_DATE('28-JAN-2012', 'DD-MON-YYYY'));
INSERT INTO DIVIDEND VALUES(id_dividend.nextval, 12, 1.52, TO_DATE('14-DEC-2021', 'DD-MON-YYYY'));
INSERT INTO DIVIDEND VALUES(id_dividend.nextval, 12, NULL, TO_DATE('14-MAY-2020', 'DD-MON-YYYY'));
INSERT INTO DIVIDEND VALUES(id_dividend.nextval, 807, 80.5, TO_DATE('16-MAY-2020', 'DD-MON-YYYY'));
INSERT INTO DIVIDEND VALUES(id_dividend.nextval, 807, 100, TO_DATE('17-JAN-2021', 'DD-MON-YYYY'));
INSERT INTO DIVIDEND VALUES(id_dividend.nextval, 576, 10, TO_DATE('02-MAY-2020', 'DD-MON-YYYY'));
INSERT INTO DIVIDEND VALUES(id_dividend.nextval, 457, NULL, TO_DATE('11-MAY-2021', 'DD-MON-YYYY'));
INSERT INTO DIVIDEND VALUES(id_dividend.nextval, 222, 50, TO_DATE('10-JAN-2021', 'DD-MON-YYYY'));
select * from dividend;

commit;

select * from investeste;
create SEQUENCE id_act_comp
start with 100
increment by 1
nocache
nocycle;
INSERT INTO INVESTESTE VALUES(id_act_comp.nextval, 883, 757, TO_DATE('10-JUL-2017', 'DD-MON-YYYY'), 8, 100000000);
INSERT INTO INVESTESTE VALUES(id_act_comp.nextval, 883, 685, TO_DATE('10-JUL-2017', 'DD-MON-YYYY'), 7, 100000000);
INSERT INTO INVESTESTE VALUES(id_act_comp.nextval, 587, 545, TO_DATE('10-AUG-2010', 'DD-MON-YYYY'), 20, 500000000);
INSERT INTO INVESTESTE VALUES(id_act_comp.nextval, 587, 444, TO_DATE('10-JUL-2017', 'DD-MON-YYYY'), 15, 100000000);
INSERT INTO INVESTESTE VALUES(id_act_comp.nextval, 999, 757, TO_DATE('10-JUL-2017', 'DD-MON-YYYY'), 90, 950000000);
INSERT INTO INVESTESTE VALUES(id_act_comp.nextval, 999, 576, TO_DATE('10-JUL-2017', 'DD-MON-YYYY'), 100, 10000000);
INSERT INTO INVESTESTE VALUES(id_act_comp.nextval, 13, 12, TO_DATE('02-MAR-2016', 'DD-MON-YYYY'), 10, 100000000);
INSERT INTO INVESTESTE VALUES(id_act_comp.nextval, 646, 12, TO_DATE('09-SEP-2017', 'DD-MON-YYYY'), 5, 100000000);
INSERT INTO INVESTESTE VALUES(id_act_comp.nextval, 456, 12, TO_DATE('09-JAN-2023', 'DD-MON-YYYY'), 50, 5000000);
INSERT INTO INVESTESTE VALUES(id_act_comp.nextval, 456, 222, TO_DATE('09-MAR-2017', 'DD-MON-YYYY'), 25, 2500000);
INSERT INTO INVESTESTE VALUES(id_act_comp.nextval, 554, 576, TO_DATE('16-NOV-2023', 'DD-MON-YYYY'), 14, 900000);
INSERT INTO INVESTESTE VALUES(id_act_comp.nextval, 554, 807, TO_DATE('18-AUG-2017', 'DD-MON-YYYY'), 8, 200000);
INSERT INTO INVESTESTE VALUES(id_act_comp.nextval, 8483, 576, TO_DATE('17-SEP-2022', 'DD-MON-YYYY'), 9, 70000000);
INSERT INTO INVESTESTE VALUES(id_act_comp.nextval, 333, 12, TO_DATE('14-AUG-2017', 'DD-MON-YYYY'), 12, 800000);
INSERT INTO INVESTESTE VALUES(id_act_comp.nextval, 534, 757, TO_DATE('18-NOV-2019', 'DD-MON-YYYY'), 80, 50000000);
INSERT INTO INVESTESTE VALUES(id_act_comp.nextval, 534, 444, TO_DATE('11-FEB-2015', 'DD-MON-YYYY'), 100, 900000000);
INSERT INTO INVESTESTE VALUES(id_act_comp.nextval, 534, 324, TO_DATE('22-MAR-2012', 'DD-MON-YYYY'), 40, 10000000);
INSERT INTO INVESTESTE VALUES(id_act_comp.nextval, 303, 324, TO_DATE('25-JAN-2017', 'DD-MON-YYYY'), 22, 30000000);
INSERT INTO INVESTESTE VALUES(id_act_comp.nextval, 56, 324, TO_DATE('28-AUG-2021', 'DD-MON-YYYY'), 33, 9000000);
INSERT INTO INVESTESTE VALUES(id_act_comp.nextval, 3, 877, TO_DATE('29-SEP-2021', 'DD-MON-YYYY'), 1, 10000);
INSERT INTO INVESTESTE VALUES(id_act_comp.nextval, 888, 877, TO_DATE('01-JAN-2004', 'DD-MON-YYYY'), 9, 100000);
INSERT INTO INVESTESTE VALUES(id_act_comp.nextval, 888, 807, TO_DATE('09-AUG-2000', 'DD-MON-YYYY'), 75, 3000000);
INSERT INTO INVESTESTE VALUES(id_act_comp.nextval, 500, 363, TO_DATE('08-SEP-2007', 'DD-MON-YYYY'), 60, 50000000);
INSERT INTO INVESTESTE VALUES(id_act_comp.nextval, 76, 222, TO_DATE('07-NOV-2020', 'DD-MON-YYYY'), 35, 20000000);
INSERT INTO INVESTESTE VALUES(id_act_comp.nextval, 76, 457, TO_DATE('03-FEB-2018', 'DD-MON-YYYY'), 45, 800000);
INSERT INTO INVESTESTE VALUES(id_act_comp.nextval, 2691, 12, TO_DATE('17-JAN-2022', 'DD-MON-YYYY'), 99, 1000000000);
INSERT INTO INVESTESTE VALUES(id_act_comp.nextval, 2691, 877, TO_DATE('18-MAR-2017', 'DD-MON-YYYY'), 90, 10000000);
INSERT INTO INVESTESTE VALUES(id_act_comp.nextval, 446, 807, TO_DATE('12-NOV-2022', 'DD-MON-YYYY'), 8, 3000000);
INSERT INTO INVESTESTE VALUES(id_act_comp.nextval, 676, 457, TO_DATE('03-AUG-2014', 'DD-MON-YYYY'), 10, 200000);
INSERT INTO INVESTESTE VALUES(id_act_comp.nextval, 676, 877, TO_DATE('02-FEB-2019', 'DD-MON-YYYY'), 33, 700000);
INSERT INTO INVESTESTE VALUES(id_act_comp.nextval, 7567, 363, TO_DATE('01-MAR-2017', 'DD-MON-YYYY'), 25, 9900000);
INSERT INTO INVESTESTE VALUES(id_act_comp.nextval, 3, 545, TO_DATE('30-MAY-2001', 'DD-MON-YYYY'), 2, 80000);
select * from investeste;
--/////////////////////////////////////////////////////////////////////////////////
create SEQUENCE id_actiune
start with 2
nocache
nocycle;

INSERT INTO ACTIUNE VALUES(id_actiune.nextval, 5876, 757, 3);
INSERT INTO ACTIUNE VALUES(id_actiune.nextval, 222, 757, 3.2);
INSERT INTO ACTIUNE VALUES(id_actiune.nextval, 792, 685, 7800);
INSERT INTO ACTIUNE VALUES(id_actiune.nextval, 888, 545, 15000);
INSERT INTO ACTIUNE VALUES(id_actiune.nextval, 900, 444, 10000.77);
INSERT INTO ACTIUNE VALUES(id_actiune.nextval, 551, 324, 69000.5);
INSERT INTO ACTIUNE VALUES(id_actiune.nextval, 567, 877, 1000.6);
INSERT INTO ACTIUNE VALUES(id_actiune.nextval, 5923, 363, 9600.1);
INSERT INTO ACTIUNE VALUES(id_actiune.nextval, 87655, 12, 700.2);
INSERT INTO ACTIUNE VALUES(id_actiune.nextval, 3443, 807, 7000.9);
INSERT INTO ACTIUNE VALUES(id_actiune.nextval, 668, 807, 5000.5);
INSERT INTO ACTIUNE VALUES(id_actiune.nextval, 999, 576, 1500.55);
INSERT INTO ACTIUNE VALUES(id_actiune.nextval, 5923, 757, 1500.55);
select * from actiune;
--/////////////////////////////////////////////////////////////////////////////////
create SEQUENCE id_detine
start with 500
increment by 5
nocache
nocycle;

INSERT INTO DETINE VALUES (id_detine.nextval, 1992, 9012,4 ,TO_DATE('10-JUL-2017', 'DD-MON-YYYY'));
INSERT INTO DETINE VALUES (id_detine.nextval, 1992, 3456,5 , TO_DATE('10-AUG-2020', 'DD-MON-YYYY'));
INSERT INTO DETINE VALUES (id_detine.nextval, 653, 2345, 6, TO_DATE('16-SEP-2021', 'DD-MON-YYYY'));
INSERT INTO DETINE VALUES (id_detine.nextval, 653, 2345, 17,TO_DATE('15-FEB-2019', 'DD-MON-YYYY'));
INSERT INTO DETINE VALUES (id_detine.nextval, 290, 6789, 8,TO_DATE('04-OCT-2021', 'DD-MON-YYYY'));
INSERT INTO DETINE VALUES (id_detine.nextval, 568, 4561,9 ,TO_DATE('12-DEC-2019', 'DD-MON-YYYY'));
INSERT INTO DETINE VALUES (id_detine.nextval, 568, 4561,13 ,TO_DATE('25-JUL-2021', 'DD-MON-YYYY'));
INSERT INTO DETINE VALUES (id_detine.nextval, 992, 7903,10 ,TO_DATE('23-OCT-2019', 'DD-MON-YYYY'));
INSERT INTO DETINE VALUES (id_detine.nextval, 444, 2342,11 ,TO_DATE('10-SEP-2021', 'DD-MON-YYYY'));
INSERT INTO DETINE VALUES (id_detine.nextval, 444, 2342,16 ,TO_DATE('06-DEC-2018', 'DD-MON-YYYY'));
INSERT INTO DETINE VALUES (id_detine.nextval, 3281, 6784,12 ,TO_DATE('07-OCT-2020', 'DD-MON-YYYY'));
INSERT INTO DETINE VALUES (id_detine.nextval, 927, 8907,14,TO_DATE('16-FEB-2021', 'DD-MON-YYYY'));
INSERT INTO DETINE VALUES (id_detine.nextval, 342, 2348, 15,TO_DATE('19-JUL-2018', 'DD-MON-YYYY'));
select * from detine;
commit;



--numele, prenumele si suma de bani din portofel pe care o are fiecare client a carui broker contine litera c in nume
--FUNCTIE PE SIRURI CARACTERE + CLAUZA WITH + GRUPARE
with brk as (
            select id_broker from broker where 
            lower(nume) like '%c%'
            )
select c.nume, c.prenume, sum(p.balanta) as "SUMA"
from client c, portofoliu p
where c.id_client=p.id_client
and c.id_broker in (select id_broker from brk)
group by c.nume, c.prenume;

--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
-- Afisati daca o companie a oferit sau nu dividende inainte de data la care compania REGINA MARIA a oferit dividend,
--la care se adauga un trimestru(adica 3 luni), 
--dividendele oferite, si sortati dupa data in care au fost oferite
-- NVL + DECODE + FUNCTIE PT DATE
SELECT c.nume,
DECODE(d.valoare, NULL, 'Compania nu a oferit dividend', 'Compania a oferit dividend') AS "DIVIDEND OFERIT",
NVL(d.valoare, 0) AS VALOARE_DIVIDEND, 
d.data_plata
FROM DIVIDEND d, COMPANIE c
where d.data_plata < add_months((select d1.data_plata 
from dividend d1, companie c
where c.id_companie=d1.id_companie
and upper(c.nume) LIKE '%REGINA MARIA%'), 3)
and c.id_companie=d.id_companie
order by 4;

select * from dividend;

--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

--numele companiilor din sectorul energetic, tipul lor (mare sau mic, in functie de capitalizare) si id-ul ordinelor corespunzatoare
-- CASE + FUNCTIE PE SIRURI CARACTERE
SELECT c.nume, 
       CASE
       WHEN c.capitalizare >= 1000000000 THEN 'Companie Mare'
       WHEN c.capitalizare < 1000000000 THEN 'Companie Mica'
       ELSE 'Necunoscuta'
       END 
       AS TIP_COMPANIE,
        o.id_ordin, o.tip, o.pret_unitate*o.numar as "PRET TOTAL",  o.stare
FROM ordin o, actiune a, companie c
where o.id_ordin=a.id_ordin and 
a.id_companie=c.id_companie
and lower(c.sector)='energie';

------------------------------

--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

--brokerul cu clienti a caror portofolii au o balanta mai mare de 100000000 RON.
-- cereri sincronizate in 3 tabele
select distinct b.nume
            from broker b
            join client c on b.id_broker=c.id_broker
            where c.nume in ( select c1.nume from client c1
                              join portofoliu p on p.id_client=c.id_client
                              where p.balanta>100000000 
                              );
                              
--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

--numele companiilor din sectorul medical si simbolul lor daca au existat investitori pana in anul 2022
--GROUP BY + FUNCTIE DATA CALENDARISTICA + CERERE IN FROM
SELECT c.nume, c.simbol
FROM (
    SELECT id_companie, nume, simbol
    FROM companie
    where sector='medical'
    
) c
JOIN investeste i ON i.id_companie = c.id_companie
WHERE EXTRACT(YEAR FROM i.data_achizitie) < 2022
group by c.nume, c.simbol;

--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
--sa se stearga dividendele oferite de catre companiile din sectorul vitivinicol
delete from dividend
where id_companie in (select id_companie
                      from companie
                      where sector='vitivinicola');

--sa se stearga etf-urile care au pretul mai mic decat jumatate din pretul mediu al etf-urile
delete from etf
where pret_curent<(select avg(pret_curent) from etf)/2;

--

-- sa se stabileasca valoarea de 15 lei pentru obligatiunile emise de catre Statul Roman (prin orice Minister)
update obligatiune
set valoare=15
where lower(emitent) like 'ministerul%';
commit;

--//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
-- primele 7 companii impreuna cu capitalizarea lor, sortate dupa capitalizare in ordine descrescatoare, in care actionarii companiei sa aiba aceeasi adresa ca a actionarului "Sasu Jean"
-- TOP N
select c.nume,c.capitalizare from actionar a, investeste i, companie c
where rownum<=3
and c.id_companie=i.id_companie
and a.id_actionar=i.id_actionar
and lower(a.adresa) = (select lower(adresa) from actionar where lower(nume)='sasu jean')
group by c.nume,c.capitalizare
order by 2 desc;

select * from 
                (select ;
                
select * from companie;
select * from investeste;

--ANALIZA TOP N
--procentul din companie, precum si invstitorii, pe care il au cele mai bune 10 valori medii ale procentelor pe care le au actionarii 
WITH topsalarii AS (
  SELECT *
  FROM (
         SELECT avg(procent) medie
         FROM investeste
         GROUP BY id_actionar
         ORDER BY avg(procent) desc
      )
  WHERE rownum <= 8)
SELECT id_actionar, avg(procent)
FROM investeste
group by id_actionar
having avg(procent) in (select medie from topsalarii)
order by 2 desc;

--numele actionarilor care sunt persoane juridice, tipul lor, adresa, si compania in care au investit, in cazul in care compania a oferit dividedn mai mare decat media dividendelor oferite de toate companiile.
--se cere id-ul companiei in care actionarii investesc, precum si numele, sectorul, valoarea dividendului oferit de companie si data platii dividendului
-- OUTER JOIN 4 TABELE
select  a.nume as "NUME ACTIONAR", a.tip_actionar, a.adresa, c.id_companie, c.nume, c.sector,  d.valoare, d.data_plata from companie c
full  outer join dividend d on c.id_companie=d.id_companie
full outer join investeste i on i.id_companie=c.id_companie
full outer join actionar a on a.id_actionar=i.id_actionar
where a.tip_actionar='persoana juridica'
and d.valoare > (select avg(valoare) from dividend) ;


--DIVISION
--numele actionarului si adresa sa daca acesta a investit la cel putin aceleasi companii ca si actionarul care are id-ul 333
select distinct a.nume, a.adresa
from investeste i, actionar a
where a.id_actionar=i.id_actionar and 
not exists 
          (select i1.id_companie
            from investeste i1, companie c
            where i1.id_companie=c.id_companie
            and i1.id_actionar=333
        minus
            (select i1.id_companie
            from investeste i1, companie c
            where i1.id_companie=c.id_companie
            and i.id_actionar=i1.id_actionar))
and i.id_actionar !=333;



select * from companie;
commit;
