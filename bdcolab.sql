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
    descricao_atividade VARCHAR(255) NOT NULL,
	PRIMARY KEY(id_org),
    FOREIGN KEY (id_responsavel_org) REFERENCES tb_no_responsavel(id_responsavel_org)
);

CREATE TABLE tb_no_responsavel (
	id_responsavel_org INT(6) NOT NULL AUTO_INCREMENT,
    nome_responsavel VARCHAR(55) NOT NULL,
    num_cpf VARCHAR(11) NOT NULL,
    num_rg VARCHAR(11) NOT NULL,
    PRIMARY KEY(id_responsavel_org)
);

CREATE TABLE tb_telefone_org (
	id_org INT,
    tel_org VARCHAR(14),
    FOREIGN KEY(id_org) REFERENCES tb_organizacao(id_org)
);

CREATE TABLE tb_endereco_org(
	id_org INT,
	endereco VARCHAR(20),
    bairro VARCHAR(20),
    cep CHAR(8),
    cidade VARCHAR(30),
    uf CHAR(2),
	FOREIGN KEY(id_org) REFERENCES tb_organizacao(id_org)
);

CREATE TABLE tb_pessoa_fs (
	id_pessoa_fs INT(6) NOT NULL AUTO_INCREMENT,
    nome_pessoa VARCHAR(55) NOT NULL,
    num_cpf_pessoa VARCHAR(11) NOT NULL,
    num_rg_pessoa VARCHAR(14),
	endereco VARCHAR(20),
    bairro VARCHAR(20),
    cep CHAR(8),
    cidade VARCHAR(30),
    uf CHAR(2),
    PRIMARY KEY(id_pessoa_fs)
);

CREATE TABLE tb_telefone_pessoa (
	id_pessoa_fs INT,
    tel_pessoa VARCHAR(14),
    FOREIGN KEY (id_pessoa_fs) REFERENCES tb_pessoa_fs(id_pessoa_fs)
);