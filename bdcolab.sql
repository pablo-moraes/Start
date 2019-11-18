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
    descricao_atividade VARCHAR(255) NOT NULL, -- ds_atividade
	PRIMARY KEY(id_org),
    FOREIGN KEY (id_responsavel_org) REFERENCES tb_no_responsavel(id_responsavel_org)
);

CREATE TABLE tb_no_responsavel (
	id_responsavel_org INT(6) NOT NULL AUTO_INCREMENT,
    nome_responsavel VARCHAR(55) NOT NULL, -- no_responsavel
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
	id_org INT, --id_endereco_org
	endereco VARCHAR(20), -- ds_endereco_org
    bairro VARCHAR(20), -- ds_bairro
    cep CHAR(8), -- ds_cep
    cidade VARCHAR(30), --ds_cidade
    uf CHAR(2), -- UF pode ser uma tabela de fk 
	FOREIGN KEY(id_org) REFERENCES tb_organizacao(id_org)
);

CREATE TABLE tb_pessoa_fs ( --nao abrevia o nome das tabelas
	id_pessoa_fs INT(6) NOT NULL AUTO_INCREMENT,
    nome_pessoa VARCHAR(55) NOT NULL -- no_,
    num_cpf_pessoa VARCHAR(11) NOT NULL,
    num_rg_pessoa VARCHAR(14),
	endereco VARCHAR(20) --ds_,
    bairro VARCHAR(20) --ds_,
    cep CHAR(8), --ds_
    cidade VARCHAR(30), ds_
    uf CHAR(2), --ds_
    PRIMARY KEY(id_pessoa_fs)
);

CREATE TABLE tb_telefone_pessoa (
	id_pessoa_fs INT,
    tel_pessoa VARCHAR(14),
    FOREIGN KEY (id_pessoa_fs) REFERENCES tb_pessoa_fs(id_pessoa_fs)
);
