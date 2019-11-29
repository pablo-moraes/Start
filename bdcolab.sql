CREATE DATABASE colaboradores;
USE colaboradores;

CREATE TABLE tb_organizacao (
	id_org INT(6) NOT NULL AUTO_INCREMENT,
    id_responsavel_org INT,
    no_fantasia VARCHAR(25) NOT NULL,
    no_razao_social VARCHAR(25),
    num_cnpj VARCHAR(14), 
    tp_causa_social VARCHAR(45) NOT NULL, 
    dt_criacao DATE NOT NULL, 
    dt_cadastro DATE NOT NULL,
    ds_atividade VARCHAR(255) NOT NULL,
	PRIMARY KEY(id_org),
    FOREIGN KEY (id_responsavel_org) REFERENCES tb_no_responsavel(id_responsavel_org)
);

CREATE TABLE tb_no_responsavel (
	id_responsavel_org INT(6) NOT NULL AUTO_INCREMENT,
    no_responsavel VARCHAR(55) NOT NULL,
    num_cpf VARCHAR(11) NOT NULL,
    num_rg VARCHAR(11) NOT NULL,
    PRIMARY KEY(id_responsavel_org)
);


CREATE TABLE tb_telefone(
	id_telefone INT AUTO_INCREMENT,
	num_telefone VARCHAR(14),
    PRIMARY KEY(id_telefone)
);

CREATE TABLE telefone_organizacao(
	id_telefone_organizacao INT AUTO_INCREMENT,
    id_telefone INT,
    id_org INT,
	FOREIGN KEY(id_telefone) REFERENCES tb_telefone(id_telefone),
    FOREIGN KEY(id_org) REFERENCES tb_organizacao(id_org),
    PRIMARY KEY(id_telefone_organizacao)
);

CREATE TABLE telefone_pessoa_fisica(
	id_telefone_pessoa_fs INT AUTO_INCREMENT,
    id_telefone INT,
    id_pessoa_fs INT,
	FOREIGN KEY(id_telefone) REFERENCES tb_telefone(id_telefone),
    FOREIGN KEY(id_pessoa_fs) REFERENCES tb_pessoa_fisica(id_pessoa_fs),
    PRIMARY KEY(id_telefone_pessoa_fs)
);

CREATE TABLE tb_endereco (
	id_endereco INT AUTO_INCREMENT,
	ds_endereco VARCHAR(20),
    ds_bairro VARCHAR(20),
    ds_cep CHAR(8),
    ds_cidade VARCHAR(30),
    ds_uf CHAR(2),
    PRIMARY KEY(id_endereco)
);


CREATE TABLE endereco_organizacao (
	id_endereco_organizacao INT AUTO_INCREMENT,
    id_endereco INT,
    id_org INT,
	FOREIGN KEY(id_endereco) REFERENCES tb_endereco(id_endereco),
    FOREIGN KEY(id_org) REFERENCES tb_organizacao(id_org),
    PRIMARY KEY(id_endereco_organizacao)
);

CREATE TABLE endereco_pessoa_fisica(
	id_endereco_pessoa_fs INT AUTO_INCREMENT,
    id_endereco INT,
    id_pessoa_fs INT,
	FOREIGN KEY(id_endereco) REFERENCES tb_endereco(id_endereco),
    FOREIGN KEY(id_pessoa_fs) REFERENCES tb_pessoa_fisica(id_pessoa_fs),
    PRIMARY KEY(id_endereco_pessoa_fs)
);

CREATE TABLE tb_pessoa_fisica (
	id_pessoa_fs INT(6) NOT NULL AUTO_INCREMENT,
    no_pessoa VARCHAR(55) NOT NULL,
    num_cpf_pessoa VARCHAR(11) NOT NULL,
    num_rg_pessoa VARCHAR(14),
	ds_endereco VARCHAR(20),
    ds_bairro VARCHAR(20),
    ds_cep CHAR(8),
    ds_cidade VARCHAR(30),
    PRIMARY KEY(id_pessoa_fs)
);