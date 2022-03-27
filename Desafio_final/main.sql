CREATE DATABASE CATALOGO; 
USE CATALOGO;

CREATE TABLE Serie ( 
                    
                    site varchar(35), 
                    serie varchar(60), 
                    descricao varchar (120),
                    temporadas integer
);



CREATE TABLE Filme ( 
                    
                    codf integer,
                    site varchar(200), 
                    nome varchar(40), 
                    sinopse varchar(100), 
                    pais varchar(15),
                    data DATE,
                    imagem varchar(100),
                    diretor varchar(50),
                    genero varchar(25),
                    PRIMARY KEY (codf)
);

CREATE TABLE Paglog ( 
                    
                    site varchar(200), 
                    email varchar(70), 
                    senha integer,
                    nick varchar(20),
                    FOREIGN KEY(nick) REFERENCES PagCliente(Id)
);

CREATE TABLE PagCliente ( 
                    
                    Id varchar(25), 
                    idade integer, 
                    endereco varchar(100),
                    contrato integer,
                    site varchar(200),
                    PRIMARY KEY(Id)
);

CREATE TABLE PagHist ( 
                    
                    codf integer,
                    filme varchar(70), 
                    tempo varchar(4), 
                    views integer,
                    lik integer,
                    deslike integer,
                    site varchar(200),
                    PRIMARY KEY(filme),
                    FOREIGN KEY (codf) REFERENCES Filme(codf)
);


CREATE TABLE Comentarios ( 
                    
                    codf integer,
                    negativo integer, 
                    positivo integer,
                    palavras varchar(300),
                    Id varchar(25),
                    FOREIGN KEY (codf) REFERENCES Filme(codf),
                    FOREIGN KEY (Id) REFERENCES PagCliente(Id)
);


CREATE TABLE EmAlta ( 
                    
                    codf integer,
                    dias_seguidos integer,
                    views integer,
                    nota varchar(10),
                    site varchar(50),
                    FOREIGN KEY (codf) REFERENCES Filme(codf),
                    FOREIGN KEY (views) REFERENCES PagHist(views)
);


CREATE TABLE Top3Serie ( 
                    
                    name varchar(50),
                    temporadas integer,
                    nota varchar(10),
                    posicao varchar(3),
                    FOREIGN KEY (name) REFERENCES Serie(serie)
);

CREATE TABLE Telenovelas (

                    novela varchar(25),
                    epsodios integer,
                    nacionalidade varchar(20),
                    ano integer,
                    direcao varchar(60),
                    PRIMARY KEY(novela)
);

CREATE TABLE CriticasNovelas (

                    usuario varchar(25),
                    novelinha varchar(25),
                    comentario varchar(500),
                    nota_publico varchar(10),
                    FOREIGN KEY (usuario) REFERENCES PagCliente(Id),
                    FOREIGN KEY (novelinha) REFERENCES Telenovelas(novela)
);


INSERT INTO Filme (site, codf, nome, sinopse, pais, data, imagem, diretor, genero) VALUES
('BD.movies', '1', 'O Resgate do soldado Ryan', 'Em meio a 2° guerra mun...', 'EUA', '99-03-05', null, 'Steven Spielberg', 'Guerra'),
('BD.movies', '2',  'American Pie', 'Um grupo de amigos tentam perder a v...', 'EUA', '99-10-29', null, 'Paul Weitz', 'Comédia'),
('BD.movies', '3',  'Se beber,não case!', '4 amigos se encontram numa fria em Las Ve...', 'EUA', '09-08-21', null, 'Todd Philips', 'Comédia'),
('BD.movies', '4',  'Tropa de elite', 'A realidade obscura do cotidiano no Rio de Ja...', 'BR', '07-10-05', null, 'José Padilha', 'Drama'),
('BD.movies', '5',  'Interestelar', 'O planeta Terra está em uma situ...', 'EUA', '14-11-06', null, 'Cristopher Nolan', 'Ficção Científica'),
('BD.movies', '6',  'Auto da Compadecida', 'No sertão nordestino dois amigos tentam ganhar...', 'BR', '00-10-09', null, 'Guel Arraes', 'Comédia'),
('BD.movies', '7',  'Platoon', 'O conflito dentro de um pelotão em meio a uma guerra com adversários implacaveis...', 'EUA', '87-02-27', null, 'Oliver Stone', 'Drama/Guerra'),
('BD.movies', '8',  'Minha mãe é uma peça', 'O dia a dia de uma família brasileira com os filhos crescidos...', 'BR', '13-06-21', null, 'André Pellenz', 'Comédia'),
('BD.movies', '9',  'Procurando Nemo', 'Martin um peixe palhaço desbrava o oceano a procura de seu filho Nemo...', 'EUA', '03-07-04', null, 'Andrew Stanton', 'Animação'),
('BD.movies', '10',  'Shrek', 'Um ogro tenta reaver seu pantano depois de criaturas mágicas invadirem...', 'EUA', '01-06-22', null, 'Vicky Jenson / Andrew Adamson', 'Animação');

INSERT INTO Paglog(site, email, senha, nick) VALUES
('BD.movies/login_vi', 'vini41@yu.br', '125478', 'Vinissola41'),
('BD.movies/login_ga', 'gabigol@yu.br', '874965', 'GabigolDaVila'),
('BD.movies/login_iz', 'izinha@yu.br', '123654', 'IzinhaCaçapavense'),
('BD.movies/login_ig', 'igor22@yu.br', '985632', 'Igão22'),
('BD.movies/login_bo', 'boris@yu.ru', '123456', 'Boris'),
('BD.movies/login_ge', 'geoconda@yu.br', '852147', 'Gege'),
('BD.movies/login_cr', 'cris@yu.us', '145289', 'Cristiano Ronaldo'),
('BD.movies/login_mx', 'max@yu.ho', '211287', 'Max Verstappen');

INSERT INTO PagCliente(Id, idade, endereco, contrato, site) VALUES
('Vinissola41', '41', 'Jacare-SP', '12', 'BD.movies/dados'),
('GabigolDaVila', '32', 'Jacarei-SP', '1', 'BD.movies/dados'),
('IzinhaCaçapavense', '27', 'Caçapava-SP', '6', 'BD.movies/dados'),
('Igão22', '22', 'SJC-SP', '3', 'BD.movies/dados'),
('Boris', '87', 'Moscow-Rússia', '12', 'BD.movies/dados'),
('Gege', '15', 'Acre-Brasil', '12', 'BD.movies/dados'),
('Cristiano Ronaldo', '36', 'Funchal-Portugal', '6', 'BD.movies/dados'),
('Max Verstappen', '24', 'Hasselt-Holanda', '12', 'BD.movies/dados');

INSERT INTO PagHist(codf, filme, tempo, views, lik, deslike, site) VALUES
('1', 'O Resgate do soldado Ryan', '2h49', '450', '448', '2', 'BD.movies/hist_1'),
('2', 'American Pie', '1h35', '687', '600', '87', 'BD.movies/hist_2'),
('3', 'Se beber,não case!' ,'1h40', '784', '702', '82', 'BD.movies/hist_3'),
('4', 'Tropa de elite', '1h55', '1054', '1048', '6', 'BD.movies/hist_4'),
('5', 'Interestelar', '2h49', '578', '578', '0', 'BD.movies/hist_5'),
('6', 'Auto da Compadecida', '1h44', '888', '667', '0', 'BD.movies/hist_6'),
('7', 'Platoon', '2h00', '987', '720', '3', 'BD.movies/hist_7'),
('8', 'Minha mãe é uma peça', '1h24', '2247', '1587', '78', 'BD.movies/hist_8'),
('9', 'Procurando Nemo', '1h40', '3358', '1789', '7', 'BD.movies/hist_9'),
('10', 'Shrek', '1h30', '2879', '2300', '6', 'BD.movies/hist_10');

INSERT INTO Serie(site, serie, descricao, temporadas) VALUES
('BD.movies/series_Grey', 'Grey´s Anatomy', 'Acompanhe a evolução de uma jovem médica ao longo d...', '12'),
('BD.movies/series_Bnad', 'Band of Brothers', 'Conheça a historia da 101 Airborne em sua participa...', '1'),
('BD.movies/series_Breaking', 'Breaking Bad', 'Um senhor diagnosticado com cancer passa por problemas financeiros e acaba utilizando meios ilegais para...', '5'),
('BD.movies/series_Modern', 'Modern Family', 'Uma família peculiar e muito singular mostra seu cotidiano...', '11'),
('BD.movies/series_Round', 'Round 6', 'Quebrados financeiramente um grupo de pessoas tenta obter uma quan...', '1'),
('BD.movies/series_Prision', 'Prision Break', 'Irmãos se ajudam a escapar de uma prisão no qual foram presos ilegalmente...', '5'),
('BD.movies/series_Round', 'Missa da Meia Noite', 'Um padre chega a uma ilha e coisas estranhas começam a acontecer...', '1'),
('BD.movies/series_Cobra', 'Cobra Kai', 'Muito tempo depois dos originais "Karate Kid", Cobra Kai chega para contar...', '4');

INSERT INTO Comentarios(codf, negativo, positivo, palavras, Id) VALUES
('5', '1', '7', 'Muito bom o filme' , 'Vinissola41'),
('4', '2', '24', 'Realidade Brasileira estampada na bela atuação.', 'GabigolDaVila'),
('3', '4', '21', 'Rachei de rir hahahahahah', 'IzinhaCaçapavense'),
('1', '0', '77', 'Impactante, profundo e realistico.', 'Igão22'),
('2', '6', '33', 'Engraçado porém meio "besteirol" ', 'GabigolDaVila'),
('6', '0', '48', 'Uma obra prima do cinema brasileiro', 'Gege'),
('7', '1', '22', 'Comovente até o final', 'Max Verstappen'),
('8', '9', '79', 'Muito com, excelente atuação hahahaha', 'Cristiano Ronaldo'),
('9', '0', '87', 'Me emocionei, filme lindo pra criançada', 'GabigolDaVila'),
('10', '0', '68', 'Simplesmente sensacional, muito engraçado e cheio de sabedoria', 'Igão22');

INSERT INTO EmAlta(codf, dias_seguidos, views, nota, site) VALUES
('5', '23', '578', '4,5 / 5' , 'BD.movies/EmAlta_5'),
('4', '18', '1054', '5 / 5' , 'BD.movies/EmAlta_4'),
('3', '38', '784', '4 / 5' , 'BD.movies/EmAlta_3'),
('1', '58', '450', '4,8 / 5' , 'BD.movies/EmAlta_1'),
('2', '11', '687', '3,7 / 5' , 'BD.movies/EmAlta_2'),
('7', '18', '987', '4,4 / 5' , 'BD.movies/EmAlta_7'),
('6', '55', '888', '4,9 / 5' , 'BD.movies/EmAlta_6'),
('8', '60', '2247', '5 / 5' , 'BD.movies/EmAlta_8'),
('9', '87', '3358', '5 / 5' , 'BD.movies/EmAlta_9'),
('10', '62', '2879', '4,9 / 5' , 'BD.movies/EmAlta_10');


INSERT INTO Top3Serie(name, temporadas, nota, posicao) VALUES
('Modern Family', '11', '4,8 / 5', '1st'),
('Breaking Bad', '5', '4,4 / 5', '2nd'),
('Round 6', '1', '4,2 / 5', '3rd');

INSERT INTO Telenovelas(novela, epsodios, nacionalidade, ano, direcao) VALUES
('O Cravo e a Rosa', '221', 'BRASILEIRA', '2000', 'Dennis Carvalho e Walter Avancini'),
('Rebelde', '440', 'MEXICANA', '2004', 'Luis P. / Juan M. / Felipe N.'),
('Chocolate com pimenta', '209', 'BRASILEIRA', '2003', 'Jorge Fernando'),
('Malhação', '263', 'BRASILEIRA', '2002', 'Edson Spinello'),
('A usurpadora', '102', 'MEXICANA', '1998', 'Beatriz Sheridan'),
('Caminho das Indias', '203', 'BRASILEIRA', '2009', 'Marcos Schechtman'),
('Salve Jorge', '179', 'BRASILEIRA', '2012', 'Marcos Schechtman'),
('Chiquititas', '545', 'BRASILEIRA', '2013', 'Reynaldo Boury'),
('Mutantes', '242', 'BRASILEIRA', '2008', 'Alexandre Avanciniy'),
('Carinha de anjo', '175', 'MEXICANA', '2000', 'Marta Luna / Juan Carlos Muñoz');

INSERT INTO CriticasNovelas(usuario, novelinha, comentario, nota_publico) VALUES
('Igão22', 'O Cravo e a Rosa', 'Muito boa essa novela, com personagens singulares desenvolvidos por um ótimo elenco', '9,9/10'),
('Gege', 'Rebelde', 'ADOOOROOOOO, AMO MUITO ESSES REBELDES ; )', '6/10'),
('Max Verstappen', 'Chocolate com pimenta', 'Sem palavras, sensacional.', '8/10'),
('GabigolDaVila', 'Malhação', 'Sempre gostei dessa novela, espero que as temporadas se renovem por mais anos', '8/10'),
('IzinhaCaçapavense', 'A usurpadora', 'Misteriosa, sedutora, não me deixa tirar os olhos da tela, excelente novela', '7/10'),
('Cristiano Ronaldo','Caminho das Indias', 'Aprendi muito mais da India com essa novela', '9/10'),
('Vinissola41', 'Salve Jorge', 'É preciso desconfiar de qualquer emprego no exterior', '6,5/10'),
('Boris','Chiquititas', 'Minhas filhas adoram hahahahahahha', '9,4/10'),
('Boris','Mutantes', 'Não perco um epsódio', '7,2/10'),
('Gege','Carinha de anjo', 'Intrigante e sensacional', '8/10');



/* SELECIONE A POSIÇÃO NO TOP3 A SÉRIE "BREAKING BAD", A NOTA DO PÚBLICO E A DESCRIÇÃO COM A POSIÇÃO DA MESMA */

SELECT Top3Serie.nota, Top3Serie.name, Serie.descricao, Top3Serie.posicao
FROM Top3Serie, Serie
WHERE Serie.serie = 'Breaking Bad'
AND Top3Serie.temporadas = Serie.temporadas;

/* SELECIONE OS FILMES E OS COMENTÁRIOS FEITOS PELOS USUÁRIOS (COM OS FILMES EM ORDEM ALFABÉTICA) */

SELECT Filme.nome, Comentarios.Id, Comentarios.palavras
FROM Filme
LEFT JOIN Comentarios
ON Filme.codf = Comentarios.codf
ORDER BY Filme.nome;

/* SELECIONE O EMAIL E O ID DOS USUÁRIOS UTILIZANDO 'LEFT' */

SELECT Paglog.email, PagCliente.Id
FROM Paglog LEFT JOIN PagCliente
ON Paglog.nick = PagCliente.Id;

/* SELECIONE A QUANTIDADE DE COMENTÁRIOS QUE CADA USUÁRIO FEZ, JUNTO COM SEUS NOMES */

SELECT COUNT(nick), Comentarios.Id
FROM Paglog, Comentarios
WHERE Paglog.nick = Comentarios.Id
GROUP BY Comentarios.Id;

/* SELECIONE OS FILMES COM MAIS DE 600 VIZUALIZAÇÕES NO CATÁLOGO */

SELECT COUNT(PagHist.codf), PagHist.filme, PagHist.views
FROM PagHist
WHERE PagHist.views > '601'
GROUP BY PagHist.filme;

/* SELECIONE A MÉDIA DE VIZUALIZAÇÕES DE TODOS OS FILMES */

SELECT AVG(EmAlta.views)
FROM EmAlta;

/* SELECIONE A QUANTIDADE DE COMENTÁRIOS NEGATIVOS DO MENOR PARA O MAIOR DE CADA FILME NO CATÁLOGO */

SELECT Comentarios.negativo, Filme.nome
FROM Comentarios
LEFT JOIN Filme
ON Comentarios.codf = Filme.codf
ORDER BY negativo;

/* SELECIONE USANDO 'HAVING' OS FILMES QUE TIVERAM MAIS DE MIL VISUALIZAÇÕES NO CATÁLOGO */

SELECT filme, SUM(views)
FROM PagHist
GROUP BY filme
HAVING SUM(views) > '1000';

/* SELECIONE A NACIONALIDADE DA NOVELA, SEU ANO DE LANÇAMENTO E TAMBÉM A NOTA GERAL DO PÚBLICO (SÓ AS NOVELAS COM NOTA MAIOR QUE 9), DE ACORDO COM CADA NOVELA */

SELECT Telenovelas.novela, Telenovelas.nacionalidade, Telenovelas.ano, CriticasNovelas.nota_publico
FROM Telenovelas, CriticasNovelas
WHERE Telenovelas.novela = CriticasNovelas.novelinha AND nota_publico > '9';

/* SELECIONE OS COMENTÁRIOS DE CADA NOVELA COM OS USUÁRIOS DE ACORDO COM A IDADE (DO MENOR PARA O MAIOR) */

SELECT CriticasNovelas.comentario, PagCliente.Id, PagCliente.idade
FROM CriticasNovelas, PagCliente
WHERE CriticasNovelas.usuario = PagCliente.Id
ORDER BY idade;

/* SELECIONE O EMAIL DE MAX VERSTAPPEN E SEU COMENTARIO FEITO NA NOVELA 'CHOCOLATE COM PIMENTA'  */

SELECT email, comentario
FROM Paglog, CriticasNovelas
WHERE Paglog.nick = 'Max Verstappen' AND CriticasNovelas.usuario = 'Max Verstappen';

/* SELECIONE TODAS AS NOVELAS ESTRANGEIRAS QUE EXISTEM NO CATÁLOGO E OS COMENTÁRIOS COM AS NOTAS DAS MESMAS */

SELECT Telenovelas.novela, Telenovelas.nacionalidade, CriticasNovelas.usuario, CriticasNovelas.comentario, CriticasNovelas.nota_publico
FROM Telenovelas, CriticasNovelas
WHERE Telenovelas.nacionalidade != 'BRASILEIRA' AND Telenovelas.novela = CriticasNovelas.novelinha
GROUP BY Telenovelas.novela;