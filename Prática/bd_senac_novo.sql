create database senac;

use senac;

create table Endereco(
	id_endereco int identity(1,1) primary key,
	rua varchar(100) not null,
	numero varchar(10) not null,
	complemento varchar(100),
	cep varchar(10) not null
	)

create table Senac(
	id_senac int identity(1,1) primary key,
	nome varchar(100) not null,
	telefone varchar(20),
	cnpj varchar(20) unique,
	id_endereco int,
	foreign key(id_endereco) references Endereco(id_endereco)
	);

create table Funcionario(
	id_funcionario int identity(1,1) primary key,
	nome varchar(100) not null,
	cpf varchar(11) unique,
	cargo nvarchar(100),
	dataNascimento Date not null,
	telefone varchar(20),
	email varchar(100) unique,
	id_endereco int,
	foreign key(id_endereco) references Endereco(id_endereco)
	);	

create table Contrato(
	id_contrato int identity(1,1) primary key,
	id_funcionario int unique,
	id_senac int,
	foreign key(id_funcionario) references Funcionario(id_funcionario),
	foreign key(id_senac) references Senac(id_senac)
	);

create table Professor(
	id_professor int identity (1,1) primary key,
	id_funcionario int,
	foreign key(id_funcionario) references Funcionario(id_funcionario)
	);

create table Pedagogo(
	id_pedagogo int identity (1,1) primary key,
	id_funcionario int unique,
	foreign key(id_funcionario) references Funcionario(id_funcionario)
	);

create table Asg(
	id_asg int identity (1,1) primary key,
	id_funcionario int unique,
	foreign key(id_funcionario) references Funcionario(id_funcionario)
	);

create table Porteiro(
	id_porteiro int identity (1,1) primary key,
	id_funcionario int unique,
	foreign key(id_funcionario) references Funcionario(id_funcionario)
	);

create table Curso(
	id_curso int identity (1,1) primary key,
	nome nvarchar(100) not null,
	cargaHoraria int,
	dataInicio Date,
	dataTermino Date,
	);

create table Cursos(
	id_cursos int identity (1,1) primary key,
	id_senac int,
	id_curso int,
	foreign key(id_senac) references Senac(id_senac),
	foreign key (id_curso) references Cursos(id_cursos)
	);

create table Uc(
	id_uc int identity (1,1) primary key,
	nome nvarchar(100) not null,
	descricao varchar(250),
	cargaHoraria int
	);

create table Turma(
	id_turma int identity (1,1) primary key,
	id_curso int,
	id_uc int,
	foreign key(id_curso) references Curso(id_curso),
	foreign key(id_uc) references Uc(id_uc),
	);

create table Aluno(
    id_aluno int identity(1,1) primary key,
    nome nvarchar(100) not null, 
    dataNascimento Date,
    cpf varchar(11) unique,
    telefone varchar(20),
    email varchar(20) unique,
    id_endereco int,
    foreign key (id_endereco) references Endereco(id_endereco)
    );

create table A_psg(
    id_psg int identity(1,1) primary key,
    id_aluno int,
    foreign key(id_aluno) references Aluno(id_aluno)
    );

create table A_pagador(
    id_pagador int identity (1,1) primary key,
    valor_pago decimal,
    status_pagamento varchar(20),
    detalhes_pagamento varchar(150),
    id_aluno int,
    foreign key(id_aluno) references Aluno(id_aluno)
    );

create table A_aprendiz(
    id_aprendiz int identity(1,1) primary key,
    id_aluno int,
    foreign key(id_aluno) references Aluno(id_aluno)
    );

create table Matricula(
    id_matricula int identity (1,1) primary key,
    datamatricula Date not null,
    id_senac int,
    id_aluno int,
    foreign key(id_senac) references Senac(id_senac),
    foreign key(id_aluno) references Aluno(id_aluno) 
    );


	alter table Endereco alter column numero varchar(10) not null


----inserindo dados na tabela:
	insert into Endereco(rua, numero, complemento, cep)
	values 
		('rua ceu azul', '100','predio 6', '23451-330'),
		('avenida itapetinga', '57', 'casa verde', '34566-330'),
		
		(' rua tal', '11','na esquina','44455-765'),
		('avenita tal', '70', 'segundo andar', '65432-234'),

		('rua a', '111', 'predio 2', '12345-678'),
		('rua b', '222', 'predio 1 ' , '12365-432'),
		('rua x', '100', 'Bloco A', '12345-678'),
		('rua y', '200', 'Bloco B', '98765-432'),
		('avenida B', '123', 'Bloco D', '54321-987'),
		('travessa C', '456', 'Casa Amarela', '98765-123'),
		('rua D', '789', 'Apartamento 101', '45678-901'),
		('rua E', '1011', 'Sobrado Verde', '23456-789'),
		('praça F', '1314', 'Cobertura 2', '87654-321'),
		('avenida G', '1516', 'Casa Azul', '67890-234');

	 select * from Endereco;

	 DELETE FROM Endereco WHERE id_endereco = 6


	insert into Senac(nome, telefone, cnpj, id_endereco)
	values ('Senac zona norte', '123-456789', '12345678901234', 7),
       ('Senac alecrim', '987-654321', '98765432109876', 8);

	   select * from Senac;


	alter table funcionario
	add salario decimal;

	insert into Funcionario(nome, cpf, cargo, datanascimento, telefone, email, id_endereco, salario)
values 
    ('João Silva', '12345678920', 'Professor', '1980-05-10', '123456789', 'joao@email.com', 13, 5000.00),
    ('Maria Oliveira', '98765432188', 'asg', '1975-08-20', '987654321', 'maria@email.com', 14, 2500.00),
    ('Ana Souza', '45678912311', 'professor', '1990-03-15', '456123789', 'ana@email.com', 15, 4800.00),
    ('Paulo Santos', '65432198722', 'porteiro', '1988-11-25', '789654123', 'paulo@email.com', 16, 3000.00);

	UPDATE Funcionario SET salario = 3800 WHERE id_funcionario = 15;

	    select * from Funcionario;


	insert into Contrato(id_funcionario, id_senac)
	values (3,2),
		   (4,3);
		   select id_contrato from Contrato
		   SELECT id_senac FROM Senac;


    insert into Professor(id_funcionario)
	values (3),
		   (4);

	insert into Pedagogo(id_funcionario)
	values (4),
           (5);

	insert into Asg (id_funcionario)
	values (6),
           (7);

	insert into porteiro (id_funcionario)
	values (8),
           (9);
	
	insert into curso (nome, cargaHoraria, dataInicio, dataTermino)
    values ('curso a', 40, '2024-01-01', '2024-02-01'),
           ('curso b', 60, '2024-03-01', '2024-05-01');

		    select * from A_psg

    insert into uc (nome, descricao, cargaHoraria)
    values ('uinidade curricular a', 'descrição uc a', 20),
           ('ubidade curricular b', 'descrição uc b', 30);

	insert into turma (id_curso, id_uc)
    values (1, 1),
           (2, 2);

    insert into aluno (nome, dataNascimento, cpf, telefone, email, id_endereco)
    values ('Gpt da Silva', '2022-11-01','01010101010','901011010','gpt@gmail.com',19),
		('Lucas rocha', '1990-02-28', '78767895461', '988223344', 'lucas@gmail.com', 20),
	
			('Daniel cruz', '1999-01-08','77777777777','988223455','daniel@gmail.com',17),
			('Paulo Silva', '1965-06-09', '28777098765', '987234888', 'paulo@gmail.com',18),
			('fulano Junior Souza', '2000-01-01', '12345678901', '987654321', 'fulano@email.com', 15),
           ('ciclano Junior Silva', '1999-01-01', '98765432109', '123456789', 'ciclano@email.com', 16);

	insert into a_psg (id_aluno)
    values (3),
           (2);

	insert into a_pagador (valor_pago, status_pagamento, detalhes_pagamento, id_aluno)
    values (100.50, 'pago', 'pagamento realizado em 2024-03-01', 4),
       (150.75, 'pendente', 'próximo pagamento em 2024-04-01', 5);

	insert into a_aprendiz (id_aluno)
    values (6),
           (7);

	insert into matricula (datamatricula, id_senac, id_aluno)
    values 
			('2023-11-05', 2, 2),
			('2023-06-05', 3, 2),
			('2023-10-10', 2, 6),
			('2023-03-01', 3, 7),
			('2024-03-15', 2, 4),
           ('2024-03-20', 3, 5);
		   

		   select * from Matricula

	

	








































