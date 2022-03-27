CREATE DATABASE CINEMA;    /* Nome: Igor Vieira | RA: 141004 */

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

INSERT into FILME (codf, nome, ano, orcamento, tempo) values 
 (1,"AJurada",1996,10000000,18),
 (2,"ALetraEscarlate",1998,100000000,24),
 (3,"Seven",1995,1500000,20),
 (4,"Tootsie",1982,50000,16),
 (5,"Tieta",1995,200000,18);

INSERT into PERSONAGEM (coda, codf, personagem, cache) values 
 (1,1,"Mary",3000),
 (1,2,"Sandy",5000),
 (2,3,"John",5000),
 (3,4,"Mary",1000),
 (4,4,"Tootsie",2000),
 (5,5,"Tieta",500);
 
UPDATE ATOR SET sexo = 'm' WHERE coda = '2';
SELECT * from ATOR WHERE sexo = 'f'; /*EXER 01, CONSULTANDO OS DADOS DAS ATRIZES */

SELECT nomereal,sexo from ATOR; /*EXER 02, CONSULTANDO O NOME E O SEXO DOS ARTISTAS */

SELECT nomereal,indicacoesoscar,num_oscar from ATOR; /*EXER 03, CONSULTANDO O NOME, INDICAÇÕES A OSCAR, E QUANTIDADE DE OSCAR O SEXO DOS ARTISTAS */

SELECT codf from PERSONAGEM WHERE cache < '1000'; /*EXER 04, CÓDIGO DO FILME QUE POSSUÍ UM CACHE < 1000 */

SELECT nome from FILME WHERE codf = '1'; /*EXER 06, FILMES DESEMPENHADOS POR DEMI MOORE */

SELECT nomereal from ATOR WHERE nomereal LIKE 'Je%'; /*EXER 07, NOME COMPLETO DA JESSICA USANDO 'LIKE' */

SELECT nomeart from ATOR WHERE indicacoesoscar = 2 * num_oscar AND indicacoesoscar != 0; /*EXER 08, DOUAS INDICAÇÕES A MAIS DO QUE OSCARS GANHOS */

SELECT nomereal from ATOR ORDER BY nomereal ASC; /*EXER 09, ORDEM ALFABÉTICA USANDO 'ORDER BY' */

SELECT nomeart,nomereal from ATOR WHERE sexo = 'f'; /*EXER 10, NOMES ARTISTICOS DA MULHERADA QUE É ATRIZ */

SELECT COUNT(nomereal) FROM ATOR WHERE sexo = 'f'; /*EXER 11, NÚMERO DE ATRIZES */

SELECT SUM(orcamento) FROM FILME; /* EXER 12, ORÇAMENTO TOTAL */