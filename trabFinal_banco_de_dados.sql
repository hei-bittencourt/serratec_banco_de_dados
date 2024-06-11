create database trabalho_final_bd;

create table Funcionarios(
	Id SERIAL primary key,	
	Nome VARCHAR(100) not null,
	Email VARCHAR(255) unique not null check(Email ~ '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+.[A-Z|a-z]{2,}$' ),
	Departamento VARCHAR(100) default 'TI'
);

select * from Funcionarios;

create table Quiz(
	Id SERIAL primary key,	
	Tema VARCHAR(100) not null,
	Data_inicio DATE,
	Data_fim DATE
);

select * from Quiz;

create table Perguntas(
	Id SERIAL primary key,
	Enunciado VARCHAR(997) unique not null,
	Opcao_A VARCHAR(273) not null,
	Opcao_B VARCHAR(273) not null,
	Opcao_C VARCHAR(273) not null,
	Opcao_D VARCHAR(273) not null,
	Opcao_Correta VARCHAR(273) not null,
	Quiz_Id INT,
	foreign key (Quiz_Id) references Quiz (Id)
);

select * from Perguntas;

create table Participacao(
	Id SERIAL primary key,
	Conclusao TIMESTAMP,
	Funcionario_Id INT,
	Quiz_Id INT,
	foreign key (Funcionario_Id) references Funcionarios (Id),
	foreign key (Quiz_Id) references Quiz (Id)
);

select * from Participacao;

create table Resposta(
	Id SERIAl primary key,
	Resposta_escolhida VARCHAR(273) not null,
	Perguntas_Id INT,
	Participacao_Id INT,
	foreign key (Perguntas_Id) references Perguntas (Id),
	foreign key (Participacao_Id) references Participacao (Id)
);

select * from Resposta;


insert into Funcionarios 
(Nome, Email, Departamento)
values
('Cassio','cassio.rh1994@gmail.com','RH'),
('Dionatan','dionatan.infra1990@gmail.com','Infra'),
('Emanuel','emanuel.design2004@gmail.com','Design'),
('Enzo','enzo.marketing2003@gmail.com','Marketing'),
('Heitor','heitor.agile1994@gmail.com','Agile'),
('Matheus','matheus.contador1998@gmail.com','Contabilidade');

insert into Quiz
(Tema, Data_inicio, Data_fim)
values
('Ciência e Tecnologia','2024-08-01','2024-08-08'),
('História Mundial','2024-08-09','2024-08-16'),
('Cultura Pop','2024-08-17','2024-08-24'),
('Geografia','2024-08-25','2024-08-31');

insert into Perguntas
(Enunciado, Opcao_A, Opcao_B, Opcao_C, Opcao_D, Opcao_Correta, Quiz_Id)
values
('Qual desses elementos químicos é o mais abundante na crosta terrestre?','Ferro','Oxigênio','Carbono','Silício','Oxigênio',1);,
('Quem é considerado o pai da computação?','Steve Jobs','Alan Turing','Bill Gates','Tim Berners-Lee','Alan Turing',1),
('Qual destes fenômenos naturais é causado pela refração da luz?','Arco-íris','Tempestade','Terremoto','Tornado','Arco-íris',1),
('Qual foi o evento que marcou o início da Primeira Guerra Mundial em 1914?','Ataque a Pearl Harbor','Assassinato de Franz Ferdinand','Revolução Russa','Tratado de Versalhes','Tratado de Versalhes',2),
('Quem foi o líder da Revolução Cubana em 1959?','Che Guevara','Fidel Castro','Ernesto Cardenal','Salvador Allende','Fidel Castro',2),
('Qual foi o período conhecido como "Idade das Trevas" na Europa?','Renascimento','Idade Média','Era Vitoriana','Renascimento Cultural','Idade Média',2),
('Qual é o nome da série de livros escrita por J.K. Rowling que se tornou um fenômeno mundial?','As Crônicas de Nárnia','O Senhor dos Anéis','Harry Potter','Percy Jackson','Harry Potter',3),
('Quem é o diretor do filme "O Poderoso Chefão" lançado em 1972?','Quentin Tarantino','Steven Spielberg','Francis Ford Coppola','Martin Scorsese','Francis Ford Coppola',3),
('Qual é o nome da primeira série original da Netflix?','House of Cards','Stranger Things','Narcos','Orange is the New Black','House of Cards',3),
('Qual é o maior país do mundo em extensão territorial?','Estados Unidos','China','Rússia','Brasil','Rússia',4),
('Qual é a capital do Canadá?','Toronto','Vancouver','Montreal','Ottawa','Ottawa',4),
('Qual é o maior oceano do mundo em área?','Oceano Atlântico','Oceano Índico','Oceano Ártico','Oceano Pacífico','Oceano Pacífico',4);

insert into Participacao
(Conclusao, Funcionario_id, Quiz_id)
values
(TIMESTAMP '2024-08-01 14:30:00', 1, 1),
(TIMESTAMP '2024-08-01 16:30:00', 2, 1),
(TIMESTAMP '2024-08-01 10:20:00', 3, 1),
(TIMESTAMP '2024-08-01 19:30:00', 4, 1),
(TIMESTAMP '2024-08-01 12:30:00', 5, 1),
(TIMESTAMP '2024-08-01 21:00:00', 6, 1),
(TIMESTAMP '2024-08-10 15:30:00', 2, 2),
(TIMESTAMP '2024-08-13 09:30:00', 5, 2),
(TIMESTAMP '2024-08-14 10:21:00', 3, 2),
(TIMESTAMP '2024-08-10 19:30:00', 6, 2),
(TIMESTAMP '2024-08-15 11:30:00', 1, 2),
(TIMESTAMP '2024-08-09 21:40:00', 4, 2),
(TIMESTAMP '2024-08-19 15:30:00', 1, 3),
(TIMESTAMP '2024-08-21 09:30:00', 5, 3),
(TIMESTAMP '2024-08-21 10:21:00', 4, 3),
(TIMESTAMP '2024-08-17 19:30:00', 6, 3),
(TIMESTAMP '2024-08-24 11:30:00', 2, 3),
(TIMESTAMP '2024-08-20 21:40:00', 3, 3),
(TIMESTAMP '2024-08-25 15:30:00', 6, 4),
(TIMESTAMP '2024-08-25 09:30:00', 5, 4),
(TIMESTAMP '2024-08-27 10:21:00', 4, 4),
(TIMESTAMP '2024-08-30 19:30:00', 1, 4),
(TIMESTAMP '2024-08-31 11:30:00', 2, 4),
(TIMESTAMP '2024-08-28 21:40:00', 3, 4);



select * from Participacao;


/*insert into Resposta
(resposta_escolhida, perguntas_id, participacao_id)
values
('Oxigênio',1,1),
('Carbono',1,2),
('Alan Turing',2,1),
('Alan Turing',2,2),
('Arco-íris',3,1),
('Tempestade',3,2),
('Ataque a Pearl Harbor',4,11),
('Revolução Russa',4,7),
('Che Guevara',5,11),
('Ernesto Cardenal',5,7),
('Renascimento',6,11),
('Idade Média',6,7);
*/

drop table Resposta;

insert into Resposta
(resposta_escolhida, perguntas_id, participacao_id)
values
--id_funcionario1
('Oxigênio',1,1),
('Alan Turing',2,1),
('Arco-íris',3,1),
('Ataque a Pearl Harbor',4,11),
('Che Guevara',5,11),
('Renascimento',6,11),
('Percy Jackson',7,13),
('Martin Scorsese',8,13),
('Orange is the New Black',9,13),
--id_funcionario2
('Carbono',1,2),
('Alan Turing',2,2),
('Tempestade',3,2),
('Revolução Russa',4,7),
('Ernesto Cardenal',5,7),
('Idade Média',6,7),
('O Senhor dos Anéis',7,17),
('Steven Spielberg',8,17),
('Stranger Things',9,17),
--id_funcionario3
('Ferro',1,3),
('Bill Gates',2,3),
('Terremoto',3,3),
('Tratado de Versalhes',4,9),
('Salvador Allende',5,9),
('Era Vitoriana',6,9),
('As Crônicas de Nárnia',7,18),
('Quentin Tarantino',8,18),
('House of Cards',9,18),
--id_funcionario4
('Silício',1,4),
('Tim Berners-Lee',2,4),
('Tornado',3,4),
('Assassinato de Franz Ferdinand',4,12),
('Fidel Castro',5,12),
('Renascimento Cultural',6,12),
('Harry Potter',7,15),
('Francis Ford Coppola',8,15),
('Narcos',9,15),
--id_funcionario5
('Oxigênio',1,5),
('Alan Turing',2,5),
('Arco-íris',3,5),
('Tratado de Versalhes',4,8),
('Fidel Castro',5,8),
('Idade Média',6,8),
('Harry Potter',7,14),
('Francis Ford Coppola',8,14),
('House of Cards',9,14),
--id_funcionario6
('Ferro',1,6),
('Steve Jobs',2,6),
('Tempestade',3,6),
('Ataque a Pearl Harbor',4,10),
('Che Guevara',5,10),
('Renascimento Cultural',6,10),
('Percy Jackson',7,16),
('Quentin Tarantino',8,16),
('Stranger Things',9,16)
;

select * from resposta;


/*Selecinando as colunas: nome, departamento da tabela Funcionario
a coluna Quiz_id da tabela Participação
Onde temos uma resposta registrada na tabela de resposta. */

select f.nome, f.departamento, p.quiz_id from funcionarios f
inner join participacao p on (f.id = p.funcionario_id)
inner join resposta r on (p.id = r.participacao_id);

--Verifica se a resposta esta correta ou errada. Quando correta 1 e 0 quando errada
select f.nome, f.departamento, p.quiz_id, case when per.opcao_correta = r.resposta_escolhida
then 1 else 0 end as pontuacao from funcionarios f
inner join participacao p on (f.id = p.funcionario_id)
inner join resposta r on (p.id = r.participacao_id)
inner join perguntas per on (r.perguntas_id = per.id);

--Temos a soma de pontos de cada quiz, ccom os funcionarios que responderam
select f.nome, f.departamento, p.quiz_id, sum( case when per.opcao_correta = r.resposta_escolhida
then 1 else 0 end) as pontuacao from funcionarios f
inner join participacao p on (f.id = p.funcionario_id)
inner join resposta r on (p.id = r.participacao_id)
inner join perguntas per on (r.perguntas_id = per.id)
group by f.nome, f.departamento, p.quiz_id;


--Acrescentou filtro de Quiz.
select f.nome, f.departamento, p.quiz_id, sum( case when per.opcao_correta = r.resposta_escolhida
then 1 else 0 end) as pontuacao from funcionarios f
inner join participacao p on (f.id = p.funcionario_id)
inner join resposta r on (p.id = r.participacao_id)
inner join perguntas per on (r.perguntas_id = per.id)
where p.quiz_id = 2
--where p.quiz_id =:Tema --dessa forma eu consigo solicitar ao usuario qual quiz ele deseja consultar. 
group by f.nome, f.departamento, p.quiz_id;

--Tira o agrupamento do Quiz_id e ordena a Pontuação do maior para o menor e limita a quantidade de registro que aparecerá.
select f.nome, f.departamento, sum( case when per.opcao_correta = r.resposta_escolhida
then 1 else 0 end) as pontuacao from funcionarios f
inner join participacao p on (f.id = p.funcionario_id)
inner join resposta r on (p.id = r.participacao_id)
inner join perguntas per on (r.perguntas_id = per.id)
group by f.nome, f.departamento
order by pontuacao desc
limit 3;

--Agora ranking por Quiz. 
select f.nome, f.departamento,p.quiz_id,  sum( case when per.opcao_correta = r.resposta_escolhida
then 1 else 0 end) as pontuacao from funcionarios f
inner join participacao p on (f.id = p.funcionario_id)
inner join resposta r on (p.id = r.participacao_id)
inner join perguntas per on (r.perguntas_id = per.id)
group by f.nome, f.departamento, p.quiz_id
order by pontuacao desc
limit 3;

---------
delete from funcionarios where departamento = 'Agile';

update funcionarios set Email = 'enzo.Frontmarketing2003@gmail.com' where id = 4

delete from participacao where id>=19;
