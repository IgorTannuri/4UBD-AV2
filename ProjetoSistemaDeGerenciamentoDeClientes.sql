CREATE TABLE Cliente (
    CodCli NUMBER PRIMARY KEY,
    Nome VARCHAR2(100) NOT NULL
);

CREATE TABLE Cliente_Fisico (
    CodCli NUMBER PRIMARY KEY,
    CPF VARCHAR2(11) UNIQUE NOT NULL,
    CONSTRAINT FK_Cliente_Fisico FOREIGN KEY (CodCli) REFERENCES Cliente(CodCli)
);

CREATE TABLE Cliente_Juridico (
    CodCli NUMBER PRIMARY KEY,
    CNPJ VARCHAR2(14) UNIQUE NOT NULL,
    InscricaoEstadual VARCHAR2(20),
    CONSTRAINT FK_Cliente_Juridico FOREIGN KEY (CodCli) REFERENCES Cliente(CodCli)
);

CREATE TABLE Orcamento (
    CodOrc NUMBER PRIMARY KEY,
    CodCli NUMBER NOT NULL,
    DataCriacao DATE NOT NULL,
    DataValidade DATE NOT NULL,
    ValorTotal DECIMAL(10, 2) NOT NULL,
    CONSTRAINT FK_Orcamento_Cliente FOREIGN KEY (CodCli) REFERENCES Cliente(CodCli)
);

CREATE TABLE Produto_Servico (
    Codigo NUMBER PRIMARY KEY,
    Nome VARCHAR2(100) NOT NULL,
    Descricao VARCHAR2(255),
    Preco DECIMAL(10, 2) NOT NULL,
    Tipo VARCHAR2(20) CHECK (Tipo IN ('Produto', 'Servico'))
);

CREATE TABLE Ordem_Servico (
    CodOS NUMBER PRIMARY KEY,
    CodOrc NUMBER NOT NULL,
    Valor DECIMAL(10, 2) NOT NULL,
    Aprovacao VARCHAR2(10) CHECK (Aprovacao IN ('Aprovado', 'Rejeitado')),
    CONSTRAINT FK_Ordem_Servico_Orcamento FOREIGN KEY (CodOrc) REFERENCES Orcamento(CodOrc)
);

CREATE TABLE Endereco (
    CodEndereco NUMBER PRIMARY KEY,
    CodCli NUMBER NOT NULL,
    Cidade VARCHAR2(100) NOT NULL,
    Bairro VARCHAR2(100) NOT NULL,
    Logradouro VARCHAR2(255) NOT NULL,
    Complemento VARCHAR2(255),
    CodUF NUMBER NOT NULL,
    TipoLogradouro VARCHAR2(50) NOT NULL,
    CONSTRAINT FK_Endereco_Cliente FOREIGN KEY (CodCli) REFERENCES Cliente(CodCli),
    CONSTRAINT FK_Endereco_UF FOREIGN KEY (CodUF) REFERENCES UF(CodUF)
);

CREATE TABLE Telefone (
    CodTelefone NUMBER PRIMARY KEY,
    CodCli NUMBER NOT NULL,
    NumeroTelefone VARCHAR2(15) NOT NULL,
    CONSTRAINT FK_Telefone_Cliente FOREIGN KEY (CodCli) REFERENCES Cliente(CodCli)
);

CREATE TABLE Email (
    CodEmail NUMBER PRIMARY KEY,
    CodCli NUMBER NOT NULL,
    Email VARCHAR2(100) NOT NULL,
    CONSTRAINT FK_Email_Cliente FOREIGN KEY (CodCli) REFERENCES Cliente(CodCli)
);

CREATE TABLE ItemOrcamento (
    CodItem NUMBER PRIMARY KEY,
    CodOrc NUMBER NOT NULL,
    CodProdutoServico NUMBER NOT NULL,
    Quantidade NUMBER NOT NULL,
    ValorAprovado DECIMAL(10, 2) NOT NULL,
    CONSTRAINT FK_ItemOrcamento_Orcamento FOREIGN KEY (CodOrc) REFERENCES Orcamento(CodOrc),
    CONSTRAINT FK_ItemOrcamento_ProdutoServico FOREIGN KEY (CodProdutoServico) REFERENCES Produto_Servico(Codigo)
);

CREATE TABLE UF (
    CodUF NUMBER PRIMARY KEY,
    Nome VARCHAR2(50) NOT NULL
);

CREATE TABLE TipoLogradouro (
    CodTipoLogradouro NUMBER PRIMARY KEY,
    Descricao VARCHAR2(50) NOT NULL
);

CREATE TABLE Logradouro (
    CodLogradouro NUMBER PRIMARY KEY,
    Descricao VARCHAR2(255) NOT NULL
);

CREATE TABLE Bairro (
    CodBairro NUMBER PRIMARY KEY,
    Nome VARCHAR2(100) NOT NULL
);

CREATE TABLE Cidade (
    CodCidade NUMBER PRIMARY KEY,
    Nome VARCHAR2(100) NOT NULL
);
