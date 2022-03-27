CREATE DATABASE CINEMA;

CREATE TABLE  ATOR (coda integer, nomeart varchar(25), nomereal varchar(25), nacionalidade varchar (25), sexo char, indicacoesoscar integer, num_oscar integer, primary key (coda));
CREATE TABLE  FILME (codf integer, nome varchar(20), ano integer, orcamento float, tempo float, primary key (codf));
CREATE TABLE  PERSONAGEM (coda integer, codf integer, personagem varchar(25), cache float, primary key (coda,codf), foreign key (coda) REFERENCES ATOR (coda), foreign key (codf) REFERENCES FILME (codf));
CREATE TABLE tabela (a integer, b integer, c integer);
INSERT INTO tabela(a,b,c) values(1,2,3),(4,5,6),(7,8,9);

INSERT into ATOR (coda, nomeart, nomereal,nacionalidade, sexo, indicacoesoscar, num_oscar) values 
 (1,"DemiMoore","MariadaSilva","USA","f",0,0),
 (2,"BradPitt","JoaoPaulo","USA","f",1,0),
 (3,"DustinHoffman","DustinHoffman","USA","m",2,0),
 (4,"JessicaLange","JessicaLange","USA","f",4,2),
 (5,"SoniaBraga","SoniaBraga","Brasil","f",0,0);
select * from ATOR; /*IMPRIMINDO OS DADOS ADICIONADOS */

INSERT into FILME (codf, nome, ano, orcamento, tempo) values 
 (1,"AJurada",1996,10000000,18),
 (2,"ALetraEscarlate",1998,100000000,24),
 (3,"Seven",1995,1500000,20),
 (4,"Tootsie",1982,50000,16),
 (5,"Tieta",1995,200000,18);
select * from FILME; /*IMPRIMINDO OS DADOS ADICIONADOS */

INSERT into PERSONAGEM (coda, codf, personagem, cache) values 
 (1,1,"Mary",3000),
 (1,2,"Sandy",5000),
 (2,3,"John",5000),
 (3,4,"Mary",1000),
 (4,4,"Tootsie",2000),
 (5,5,"Tieta",500);
select * from PERSONAGEM; /*IMPRIMINDO OS DADOS ADICIONADOS */

UPDATE ATOR SET sexo = 'm' WHERE coda = '2';   /*ALTERANDO O SEXO DO BRAD PITT EXER 01*/
SELECT coda,nomeart,sexo FROM ATOR; /*DEU BOM*/

UPDATE PERSONAGEM SET cache = cache*1.1 WHERE cache > 0;   /*ALTERANDO O CACHE DOS PERSONAGENS EM 10% EXER 02*/
SELECT personagem,cache FROM PERSONAGEM; /*DEU BOM*/

DELETE FROM FILME WHERE nome = 'Tieta';  /*EXCLUINDO O FILME "TIETA", LOCALIZANDO A INFORMAÇÃO NA TABELA É POSSÍVEL FAZER A EXCLUSÃO*/
SELECT codf,nome,ano FROM FILME;        /*ENTRETANTO TODAS AS OUTRAS INFORMÇÕES RELACIONADAS A TIETA TAMBÉM SÃO EXCLUIDAS, EXER 03*/

DELETE FROM PERSONAGEM WHERE personagem = 'Tootsie';  /*EXCLUINDO O PERSONAGEM "TOOTSIE", LOCALIZANDO A INFORMAÇÃO NA TABELA É POSSÍVEL FAZER A EXCLUSÃO,*/
SELECT coda,codf,personagem FROM PERSONAGEM;         /*PORÉM A "LINHA" TODA É EXCLUÍDA EM RELAÇÃO AS OUTRAS INFORMAÇÕES DE TOOTSIE, EXER 04*/