CREATE TABLE Funcionario(
	CPF			           NUMERIC(11)		NOT NULL	UNIQUE, 
	Nome			       VARCHAR(30)		NOT NULL,
	Historico_Escolar	   VARCHAR(50),
	Teste_Personalidade	   VARCHAR(50),
	Email			       VARCHAR(30),
	Periodo			       NUMERIC(2)    	NOT NULL,
	Preferencia_Projetos   VARCHAR(50),
	Afinidades_Curso	   VARCHAR(50),
	RG			           NUMERIC(8)		NOT NULL	UNIQUE,

CONSTRAINT	PK_Funcionario	PRIMARY KEY(CPF)
	
);


CREATE TABLE Projetos_Func(
	CPF_Func		       NUMERIC(11)		NOT NULL,		
	Projeto_Realizado	   NUMERIC(4)       NOT NULL, 	
	
	CONSTRAINT PK_Projetos_Func PRIMARY KEY(CPF_Func, Projeto_Realizado),
	CONSTRAINT FK_CPF_Func FOREIGN KEY(CPF_Func) REFERENCES Funcionario(CPF) ON DELETE CASCADE
);


CREATE TABLE Telefones_Func(
	CPF_Func	          NUMERIC(11)	NOT NULL,		
	Telefone		      VARCHAR(11)	NOT NULL, 	
	
	CONSTRAINT PK_Telefones_Func	PRIMARY KEY(Telefone),
	CONSTRAINT FK_CPF_Func FOREIGN KEY(CPF_Func) REFERENCES Funcionario(CPF) ON DELETE CASCADE
);


CREATE TABLE Gestor_Orcamento_Negociacao(
	CPF_Func 	           NUMERIC(11)	  NOT NULL	UNIQUE,		 	
	
	CONSTRAINT PK_Gestor_Orcamento_Negociacao PRIMARY KEY(CPF_Func),
	CONSTRAINT FK_CPF_Func FOREIGN KEY(CPF_Func) REFERENCES Funcionario(CPF) ON DELETE RESTRICT
);


CREATE TABLE Diretor_Juridico(
	CPF_Func	           NUMERIC(11)	  NOT NULL	UNIQUE,		 	
	
	CONSTRAINT PK_Diretor_Juridico	PRIMARY KEY(CPF_Func),
	CONSTRAINT FK_CPF_Func FOREIGN KEY(CPF_Func) REFERENCES Funcionario(CPF) ON DELETE RESTRICT
);


CREATE TABLE Gerente_Projeto(
	CPF_Func	           NUMERIC(11)	   NOT NULL	 UNIQUE,		 	
	
	CONSTRAINT PK_Gerente_Projeto PRIMARY KEY(CPF_Func),
	CONSTRAINT FK_CPF_Func FOREIGN KEY(CPF_Func) REFERENCES Funcionario(CPF) ON DELETE RESTRICT
);

CREATE TABLE Membro_Equipe(
	Codigo		          NUMERIC(4)	    NOT NULL  UNIQUE,	
		
	CONSTRAINT PK_Membro_Equipe PRIMARY KEY(Codigo)
);

CREATE TABLE Relacionamento_Cliente(
	CPF_Func		        NUMERIC(11)		NOT NULL	UNIQUE,
	Codigo_Membro_Equipe	NUMERIC(4), 
	
	CONSTRAINT PK_Relacionamento_Cliente	PRIMARY KEY(CPF_Func),
	CONSTRAINT FK_CPF_Func FOREIGN KEY(CPF_Func) REFERENCES Funcionario(CPF) ON DELETE RESTRICT,
	CONSTRAINT FK_Codigo_Membro_Equipe	FOREIGN KEY(Codigo_Membro_Equipe) REFERENCES Membro_Equipe(Codigo) ON DELETE SET NULL
);

CREATE TABLE Gestor_Conhecimento(
	CPF_Func 		        NUMERIC(11) 	NOT NULL	UNIQUE,	
	Codigo_Membro_Equipe	NUMERIC(4), 
	
	CONSTRAINT PK_Gestor_Conhecimento PRIMARY KEY(CPF_Func),
	CONSTRAINT FK_CPF_Func FOREIGN KEY(CPF_Func) REFERENCES Funcionario(CPF) ON DELETE RESTRICT,
	CONSTRAINT FK_Codigo_Membro_Equipe FOREIGN KEY(Codigo_Membro_Equipe) REFERENCES Membro_Equipe(Codigo) ON DELETE SET NULL
);

CREATE TABLE Tecnico(
	CPF_Func		        NUMERIC(11)	     NOT NULL	UNIQUE,	
	Codigo_Membro_Equipe	NUMERIC(4), 
	
	CONSTRAINT PK_Tecnico PRIMARY KEY(CPF_Func),
	CONSTRAINT FK_CPF_Func FOREIGN KEY(CPF_Func) REFERENCES Funcionario(CPF)	 ON DELETE RESTRICT,
	CONSTRAINT FK_Codigo_Membro_Equipe	FOREIGN KEY(Codigo_Membro_Equipe) REFERENCES Membro_Equipe(Codigo) ON DELETE SET NULL
);

CREATE TABLE Equipe(
	Codigo		           NUMERIC(4) 	      NOT NULL   UNIQUE,
	Nome		           VARCHAR(30),
    
	CONSTRAINT PK_Equipe PRIMARY KEY(Codigo)
);


CREATE TABLE Contrato(
	Codigo					NUMERIC(4) 	   NOT NULL     UNIQUE,
	Descricao				VARCHAR(100),
	Data					DATE		   NOT NULL,
	Prazo					DATE,
	PDF					    VARCHAR(50),
	CPF_Diretor_Juridico 	NUMERIC(11)	   NOT NULL,
	
	CONSTRAINT PK_Contrato PRIMARY KEY(Codigo),
	CONSTRAINT FK_CPF_Diretor_Juridico FOREIGN KEY(CPF_Diretor_Juridico) REFERENCES Diretor_Juridico(CPF_Func) ON DELETE RESTRICT
);

CREATE TABLE Demanda(
	Codigo_Contrato			NUMERIC(4) 		NOT NULL,
	Descricao			    VARCHAR(100),
	Data				    DATE			NOT NULL,
	CPF_Gestor_Negociacao   NUMERIC(11)		NOT NULL,
	Orcamento			    DECIMAL(10,2),
	
	CONSTRAINT PK_Demanda PRIMARY KEY(Codigo_Contrato, Data),
	CONSTRAINT FK_Codigo_Contrato FOREIGN KEY(Codigo_Contrato) REFERENCES Contrato(Codigo) ON DELETE RESTRICT,
	CONSTRAINT FK_CPF_Gestor_Negociacao FOREIGN KEY(CPF_Gestor_Negociacao) REFERENCES Gestor_Orcamento_Negociacao(CPF_Func) ON DELETE RESTRICT
);

CREATE TABLE Foto_Demanda(
	Codigo_Demanda		    NUMERIC(4) 		NOT NULL,
	Data_Demanda			DATE			NOT NULL,
	Foto				    VARCHAR(50)     NOT NULL,	
	
	CONSTRAINT PK_Foto_Demanda PRIMARY KEY(Codigo_Demanda, Data_Demanda,Foto),
	CONSTRAINT FK_Foto_Demanda FOREIGN KEY(Codigo_Demanda,Data_Demanda) REFERENCES Demanda(Codigo_Contrato,Data) ON DELETE CASCADE
);

CREATE TABLE Croqui_Demanda(
	Codigo_Demanda		    NUMERIC(4) 		NOT NULL,
	Data_Demanda			DATE			NOT NULL,
	Croqui				    VARCHAR(50)     NOT NULL,	
	
	CONSTRAINT PK_Croqui_Demanda PRIMARY KEY(Codigo_Demanda, Data_Demanda,Croqui),
	CONSTRAINT FK_Croqui_Demanda FOREIGN KEY(Codigo_Demanda,Data_Demanda) REFERENCES Demanda(Codigo_Contrato,Data) ON DELETE CASCADE
);

CREATE TABLE Cliente(
	CPF			     	        NUMERIC(11)	 	NOT NULL   UNIQUE,
	Nome		     		    VARCHAR(30)		NOT NULL,
	Email		    		    VARCHAR(30),	
	CEP			     	        NUMERIC(8),
	Estado		       		    VARCHAR(2),
	Cidade			           	VARCHAR(30),
	Bairro			         	VARCHAR(30),
	Rua			         	    VARCHAR(30),
	Numero	    		      	NUMERIC(4),
	Complemento	           		VARCHAR(30),
	CPF_Relacionamento_Cliente	NUMERIC(11)     NOT NULL,
	Registro		     		VARCHAR(50),
	
	CONSTRAINT PK_Cliente PRIMARY KEY(CPF),
	CONSTRAINT FK_CPF_Relacionamento_Cliente FOREIGN KEY(CPF_Relacionamento_Cliente) REFERENCES Relacionamento_Cliente(CPF_Func) ON DELETE RESTRICT
);


CREATE TABLE Telefone_Cliente(
	CPF_Cliente			        NUMERIC(11) 	NOT NULL,
	Telefone		     		VARCHAR(11)		NOT NULL,
	
	CONSTRAINT PK_Telefone_Cliente PRIMARY KEY(Telefone),
	CONSTRAINT FK_CPF_Cliente FOREIGN KEY(CPF_Cliente) REFERENCES Cliente(CPF) ON DELETE CASCADE
);

CREATE TABLE E_Assinado(
	Codigo_Contrato			    NUMERIC(4) 		NOT NULL    UNIQUE,
	CPF_Cliente	           		NUMERIC(11)		NOT NULL,
	
	CONSTRAINT PK_E_Assinado PRIMARY KEY(Codigo_Contrato),
	CONSTRAINT FK_Codigo_Contrato FOREIGN KEY(Codigo_Contrato) REFERENCES Contrato(Codigo) ON DELETE RESTRICT,
	CONSTRAINT FK_CPF_Cliente FOREIGN KEY(CPF_Cliente) REFERENCES Cliente(CPF) ON DELETE RESTRICT
);

CREATE TABLE Projeto(
	Codigo	        			NUMERIC(4)	     NOT NULL	UNIQUE,
	Descricao          			VARCHAR(100)	 NOT NULL,
	Prazo		        		DATE      		 NOT NULL,
	Prazo_Preliminar			DATE,
	Briefieng			       	VARCHAR(50),
	Resumo_Lei         			VARCHAR(50), 
	Projeto_3D		           	VARCHAR(50), 
	Prazo_Executivo		       	DATE,
	CPF_Gerente_Projeto	       	NUMERIC(11)      NOT NULL,
	CPF_Gestor_Conhecimento    	NUMERIC(11)      NOT NULL,
	Planilha_Metas	       		VARCHAR(50),
	Codigo_Equipe			    NUMERIC(4)	     NOT NULL,
	Codigo_Contrato_Assinado	NUMERIC(4)	     NOT NULL,
	
	CONSTRAINT PK_Projeto PRIMARY KEY(Codigo),
	CONSTRAINT FK_CPF_Gerente_Projeto FOREIGN KEY(CPF_Gerente_Projeto) REFERENCES Gerente_Projeto(CPF_Func) ON DELETE RESTRICT,
	CONSTRAINT FK_CPF_Gestor_Conhecimento FOREIGN KEY(CPF_Gestor_Conhecimento) REFERENCES Gestor_Conhecimento(CPF_Func) ON DELETE RESTRICT,
	CONSTRAINT FK_Codigo_Equipe FOREIGN KEY(Codigo_Equipe) REFERENCES Equipe(Codigo) ON DELETE RESTRICT,
	CONSTRAINT FK_Codigo_Contrato_Assinado FOREIGN KEY(Codigo_Contrato_Assinado) REFERENCES E_Assinado(Codigo_Contrato) ON DELETE RESTRICT
);

CREATE TABLE Croqui_Projeto_Preliminar(
	Codigo_Projeto		NUMERIC(4)     	NOT NULL,
	Croqui			    VARCHAR(50)     NOT NULL,
	
	CONSTRAINT PK_Croqui_Projeto_Preliminar PRIMARY KEY(Codigo_Projeto, Croqui),
	CONSTRAINT FK_Codigo_Projeto FOREIGN KEY(Codigo_Projeto) REFERENCES Projeto(Codigo) ON DELETE CASCADE
);

CREATE TABLE Planta_Projeto_Preliminar(
	Codigo_Projeto		NUMERIC(4) 		NOT NULL,
	Planta			    VARCHAR(50)     NOT NULL,
	
	CONSTRAINT PK_Planta_Projeto_Preliminar PRIMARY KEY(Codigo_Projeto, Planta),
	CONSTRAINT FK_Codigo_Projeto FOREIGN KEY(Codigo_Projeto) REFERENCES Projeto(Codigo) ON DELETE CASCADE
);

CREATE TABLE Planta_Projeto_Executivo(
	Codigo_Projeto		NUMERIC(4) 	NOT NULL,
	Planta			    VARCHAR(50) NOT NULL,
	
	CONSTRAINT PK_Planta_Projeto_Executivo PRIMARY KEY(Codigo_Projeto, Planta),
	CONSTRAINT FK_Codigo_Projeto FOREIGN KEY(Codigo_Projeto) REFERENCES Projeto(Codigo) ON DELETE CASCADE
);
CREATE TABLE Corte_Projeto_Executivo(
	Codigo_Projeto		NUMERIC(4) 	NOT NULL,
	Corte			    VARCHAR(50) NOT NULL,
	
	CONSTRAINT PK_Corte_Projeto_Executivo PRIMARY KEY(Codigo_Projeto, Corte),
	CONSTRAINT FK_Codigo_Projeto FOREIGN KEY(Codigo_Projeto) REFERENCES Projeto(Codigo) ON DELETE CASCADE
);

CREATE TABLE Render_Projeto_Executivo(
	Codigo_Projeto		NUMERIC(4) 	NOT NULL,
	Imagem			    VARCHAR(50) NOT NULL,
	
	CONSTRAINT PK_Render_Projeto_Executivo PRIMARY KEY(Codigo_Projeto, Imagem),
	CONSTRAINT FK_Codigo_Projeto FOREIGN KEY(Codigo_Projeto) REFERENCES Projeto(Codigo) ON DELETE CASCADE
);


CREATE TABLE Anteprojeto(
	Codigo_Projeto		NUMERIC(4) 	NOT NULL   UNIQUE,
	Prazo			    DATE        NOT NULL,
	CAD			        VARCHAR(50),
	Sketch			    VARCHAR(50),
	PDF			        VARCHAR(50),
	Orcamento		    DECIMAL(10,2),
	
	CONSTRAINT PK_Anteprojeto PRIMARY KEY(Codigo_Projeto, Prazo),
	CONSTRAINT FK_Codigo_Projeto FOREIGN KEY(Codigo_Projeto) REFERENCES Projeto(Codigo) ON DELETE RESTRICT
);

CREATE TABLE Imagem_Anteprojeto(
	Codigo_Anteprojeto	NUMERIC(4) 	NOT NULL,
	Prazo_Anteprojeto	DATE        NOT NULL,
	Imagem			    VARCHAR(50) NOT NULL,
	
	CONSTRAINT PK_Imagem_Anteprojeto PRIMARY KEY(Codigo_Anteprojeto, Prazo_Anteprojeto, Imagem),
	CONSTRAINT FK_Codigo_Anteprojeto FOREIGN KEY(Codigo_Anteprojeto) REFERENCES Anteprojeto(Codigo_Projeto) ON DELETE CASCADE
);


CREATE TABLE Compoe(
	Codigo_Membro		NUMERIC(4) 	NOT NULL,
	Codigo_Equipe		NUMERIC(4)  NOT NULL,
	
	CONSTRAINT PK_Compoe PRIMARY KEY(Codigo_Membro, Codigo_Equipe),
	CONSTRAINT FK_Codigo_Membro FOREIGN KEY(Codigo_Membro) REFERENCES Membro_Equipe(Codigo) ON DELETE CASCADE,
	CONSTRAINT FK_Codigo_Equipe FOREIGN KEY(Codigo_Equipe) REFERENCES Equipe(Codigo) ON DELETE CASCADE
);




