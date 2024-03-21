create database senac;

use senac;

create table Endereco(
	id_endereco int identity(1,1) primary key,
	rua varchar(100) not null,
	numero varchar not null,
	complemento varchar(100),
	cep varchar(10) not null
	);

create table Senac(
	id_senac int identity(1,1) primary key,
	nome varchar(100) not null,
	telefone varchar(20),
	cnpj varchar(20) unique,
	id_endereco int,
	foreign key(id_endereco) references Endereco(id_endereco)
	);

create table Funcionario(
	id_funcionario int identity primary key,
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
	id_contrato int identity primary key,
	id_funcionario int,
	id_senac int,
	foreign key(id_funcionario) references Funcionario(id_funcionario),
	foreign key(id_senac) references Senac(id_senac)
	);

create table Professor(
	id_professor int identity primary key,
	id_funcionario int,
	foreign key(id_funcionario) references Funcionario(id_funcionario)
	);

create table Pedagogo(
	id_pedagogo int identity primary key,
	id_funcionario int,
	foreign key(id_funcionario) references Funcionario(id_funcionario)
	);

create table Asg(
	id_asg int identity primary key,
	id_funcionario int,
	foreign key(id_funcionario) references Funcionario(id_funcionario)
	);

create table Porteiro(
	id_porteiro int identity primary key,
	id_funcionario int,
	foreign key(id_funcionario) references Funcionario(id_funcionario)
	);

create table Curso(
	id_curso int identity primary key,
	nome nvarchar(100) not null,
	cargaHoraria int,
	dataInicio Date,
	dataTermino Date,
	);

create table Cursos(
	id_cursos int identity primary key,
	id_senac int,
	id_curso int,
	foreign key(id_senac) references Senac(id_senac),
	foreign key (id_curso) references Cursos(id_cursos)
	);

create table Uc(
	id_uc int identity primary key,
	nome nvarchar(100) not null,
	descricao varchar(250),
	cargaHoraria int
	);

create table Turma(
	id_turma int identity primary key,
	id_curso int,
	id_uc int,
	foreign key(id_curso) references Curso(id_curso),
	foreign key(id_uc) references Uc(id_uc),
	);

create table Aluno(
    id_aluno int identity primary key,
    nome nvarchar(100) not null, 
    dataNascimento Date,
    cpf varchar(11) unique,
    telefone varchar(20),
    e-mail varchar (20) unique,
    id_endereco int,
    foreign(id_endereco) references Endereco(id_endereco)
    );

create table A_psg(
    id_psg int identity primary key,
    id_aluno int,
    foreign(id_aluno) references Aluno(id_aluno)
    );

create table A_pagador(
    id_pagador int identity primary key,
    valor_pago decimal,
    status_pagamento varchar(20),
    detalhes_pagamento varchar(150),
    id_aluno int,
    foreign(id_aluno) references Aluno(id_aluno)
    );

create table A_aprendiz(
    id_aprendiz int identity primary key,
    id_aluno int,
    foreign(id_aluno) references Aluno(id_aluno)
    );

create table Matrícula(
    id_matricula int identity primary key,
    datamatricula Date not null,
    id_senac int,
    id_aluno int,
    foreign(id_senac) references Senac(id_senac),
    foreign(id_aluno) references Aluno(id_aluno) 
    );









































