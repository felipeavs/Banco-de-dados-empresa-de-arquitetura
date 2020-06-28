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


//---------------------------------------------------------------------------------------------------------------------
POVOAR BANCO DE DADOS
//---------------------------------------------------------------------------------------------------------------------

INSERT INTO Funcionario
VALUES (11111111111,'Joao Silva','Link Historico Escolar 1', 'Link Teste de Personalidade 1', 'joaosilva@gmail.com',1,'Preferencias de projetos 1', 'Afinidades do curso 1', 11111111);
INSERT INTO Projetos_Func
VALUES (11111111111, 0001);
INSERT INTO Telefones_Func
VALUES (11111111111, 31992929830);

INSERT INTO Funcionario
VALUES (22222222222,'Frank Santos','Link Historico Escolar 2', 'Link Teste de Personalidade 2', 'franksantos@gmail.com',2,'Preferencias de projetos 2', 'Afinidades do curso 2', 22222222);
INSERT INTO Projetos_Func
VALUES (22222222222, 0002);
INSERT INTO Telefones_Func
VALUES (22222222222, 37875465733);

INSERT INTO Funcionario
VALUES (33333333333,'Alice Pereira','Link Historico Escolar 3', 'Link Teste de Personalidade 3', 'alicepereira@gmail.com',3,'Preferencias de projetos 3', 'Afinidades do curso 3', 33333333);
INSERT INTO Projetos_Func
VALUES (33333333333, 0001);
INSERT INTO Telefones_Func
VALUES (33333333333, 32958765431);

INSERT INTO Funcionario
VALUES (44444444444,'Junia Mendes','Link Historico Escolar 4', 'Link Teste de Personalidade 4', 'juniamendes@gmail.com',4,'Preferencias de projetos 4', 'Afinidades do curso 4', 44444444);
INSERT INTO Projetos_Func
VALUES (44444444444, 0002);
INSERT INTO Telefones_Func
VALUES (44444444444, 31948577898);

INSERT INTO Funcionario
VALUES (55555555555,'Jose Tavares','Link Historico Escolar 5', 'Link Teste de Personalidade 5', 'josetavares@gmail.com',5,'Preferencias de projetos 5', 'Afinidades do curso 5', 55555555);
INSERT INTO Projetos_Func
VALUES (55555555555, 0001);
INSERT INTO Telefones_Func
VALUES (55555555555, 31993457899);

INSERT INTO Funcionario
VALUES (66666666666,'Luciana Santos','Link Historico Escolar 6', 'Link Teste de Personalidade 6', 'lucianasantos@gmail.com',6,'Preferencias de projetos 6', 'Afinidades do curso 6', 66666666);
INSERT INTO Projetos_Func
VALUES (66666666666, 0002);
INSERT INTO Telefones_Func
VALUES (66666666666, 11967833454);


INSERT INTO Membro_Equipe
VALUES (1230);
INSERT INTO Membro_Equipe
VALUES (1231);
INSERT INTO Membro_Equipe
VALUES (1232);
INSERT INTO Membro_Equipe
VALUES (1233);
INSERT INTO Membro_Equipe
VALUES (1234);
INSERT INTO Membro_Equipe
VALUES (1235);


INSERT INTO Relacionamento_Cliente
VALUES(11111111111, 1230);
INSERT INTO Relacionamento_Cliente
VALUES(22222222222, 1231);

INSERT INTO Gestor_Conhecimento
VALUES(33333333333, 1232);
INSERT INTO Gestor_Conhecimento
VALUES(44444444444, 1233);

INSERT INTO Tecnico
VALUES(55555555555, 1234);
INSERT INTO Tecnico
VALUES(66666666666, 1235);

INSERT INTO Gestor_Orcamento_Negociacao
VALUES(11111111111);
INSERT INTO Gestor_Orcamento_Negociacao
VALUES(33333333333);

INSERT INTO Diretor_Juridico
VALUES(22222222222);
INSERT INTO Diretor_Juridico
VALUES(55555555555);

INSERT INTO Gerente_Projeto
VALUES(44444444444);
INSERT INTO Gerente_Projeto
VALUES(66666666666);


INSERT INTO Contrato
VALUES(0001, 'Descricao do projeto 0001', '12/04/2019', '17/12/2019', 'Link do PDF do Contrato 0002', 22222222222);
INSERT INTO Contrato
VALUES(0002, 'Descricao do projeto 0002', '28/01/2019', '15/03/2019', 'Link do PDF do Contrato 0001', 55555555555);
INSERT INTO Contrato
VALUES(0003, 'Descricao do projeto 0003', '24/01/2019', '16/03/2019', 'Link do PDF do Contrato 0003', 55555555555);


INSERT INTO cliente
VALUES (00000000001, 'Jose da Silva', 'josemail@email.com', 35400000, 'MG', 	'Ouro Preto', 'Bauxita', 'R joao pedro da silva', 0001, 'Casa', 11111111111, 'link_Registo_01');	
INSERT INTO telefone_cliente
VALUES (00000000001, '38 38210001');


INSERT INTO cliente
VALUES (00000000002, 'Maria Augusta', 'mariamail@email.com', 35400000, 'MG', 'Ouro Preto', 'Bauxita', 'R joao pedro da silva', 0002, 'Casa', 22222222222, 'link_Registo_02');
INSERT INTO telefone_cliente
VALUES (00000000002, '38 38210002');


INSERT INTO cliente
VALUES (00000000003, 'Ana Maria', 'anamail@email.com', 35400000, 'MG', 'Ouro Preto', 'Bauxita', 'R Carlos Gomes', 0003, 'Ap', NULL, NULL);
INSERT INTO telefone_cliente
VALUES (00000000003, '38 38210003');


INSERT INTO cliente
VALUES (00000000004, 'Lucas', 'lucasmail@email.com', 35400000, 'MG', 'Ouro Preto', 'Lagoa', 'R logoa quatro', 0004, 'Ap', NULL, NULL);	
INSERT INTO telefone_cliente
VALUES (00000000004, '38 38210004');
INSERT INTO telefone_cliente
VALUES (00000000004, '38 38210014');


INSERT INTO Demanda
VALUES (0001, 'Descricao da demanda 0001', '01/01/2019', 11111111111, 30.00);
INSERT INTO Foto_Demanda
VALUES (0001, '01/01/2019', 'Link Fotos da Demanda 0001');
INSERT INTO Croqui_Demanda
VALUES (0001, '01/01/2019', 'Link Croqui da Demanda 0001');

INSERT INTO Demanda
VALUES (0002, 'Descricao da demanda 0002', '02/02/2019', 33333333333, 50.90);
INSERT INTO Foto_Demanda
VALUES (0002, '02/02/2019', 'Link Fotos da Demanda 0002');
INSERT INTO Croqui_Demanda
VALUES (0002, '02/02/2019', 'Link Croqui da Demanda 0002');

INSERT INTO Demanda
VALUES (0003, 'Descricao da demanda 0003', '03/03/2019', 11111111111, 40.00);
INSERT INTO Foto_Demanda
VALUES (0003, '03/03/2019' ,'Link Fotos da Demanda 0003');
INSERT INTO Croqui_Demanda
VALUES (0003, '03/03/2019', 'Link Croqui da Demanda 0003');


INSERT INTO E_Assinado
VALUES (0001, 00000000001);
INSERT INTO E_Assinado
VALUES (0002, 00000000002);



INSERT INTO Equipe
VALUES (0001, 'Nome da Equipe 1');
INSERT INTO Equipe
VALUES (0002, 'Nome da Equipe 2');


INSERT INTO Compoe
VALUES (1230, 0001);
INSERT INTO Compoe
VALUES (1232, 0001);
INSERT INTO Compoe
VALUES (1234, 0001);
INSERT INTO Compoe
VALUES (1231, 0002);
INSERT INTO Compoe
VALUES (1233, 0002);
INSERT INTO Compoe
VALUES (1235, 0002);



INSERT INTO Projeto
VALUES (0001, 'Descricao do Projeto 0001', '15/07/2019', '01/07/2019', 'Link Briefieng do Projeto 0001', 'Link Resumo da Lei do projeto 0001', 'Link do Projeto 3D do Projeto 0001', '01/06/2019', 44444444444, 33333333333, 'Link do Planilha do Projeto 0001' , 0001, 0001);
INSERT INTO Croqui_Projeto_Preliminar
VALUES (0001, 'Link do Croqui do Projeto Preliminar 0001');
INSERT INTO Planta_Projeto_Preliminar
VALUES (0001, 'Link da Planta do Projeto Preliminar 0001');
INSERT INTO Planta_Projeto_Executivo
VALUES (0001, 'Link da Planta do Projeto Executivo 0001');
INSERT INTO Corte_Projeto_Executivo
VALUES (0001, 'Link do Corte do Projeto Executivo do Projeto 0001');
INSERT INTO Render_Projeto_Executivo
VALUES (0001, 'Link Render do Projeto Executivo do Projeto 0001');

INSERT INTO Projeto
VALUES (0002, 'Descricao do Projeto 0002', '07/05/2019', '11/02/2019', 'Link Briefieng do Projeto 0002', 'Link Resumo da Lei do projeto 0002', 'Link do Projeto 3D do Projeto 0002', '21/09/2019', 66666666666, 44444444444, 'Link do Planilha do Projeto 0002' , 0002, 0002);
INSERT INTO Croqui_Projeto_Preliminar
VALUES (0002, 'Link do Croqui do Projeto Preliminar 0002');
INSERT INTO Planta_Projeto_Preliminar
VALUES (0002, 'Link da Planta do Projeto Preliminar 0002');
INSERT INTO Planta_Projeto_Executivo
VALUES (0002, 'Link da Planta do Projeto Executivo 0002');
INSERT INTO Corte_Projeto_Executivo
VALUES (0002, 'Link do Corte do Projeto Executivo do Projeto 0002');
INSERT INTO Render_Projeto_Executivo
VALUES (0002, 'Link Render do Projeto Executivo do Projeto 0002');


INSERT INTO Anteprojeto
VALUES (0001, '29/04/2019', 'Link do CAD do Anteprojeto', 'Link do Sketch', 'Link do PDF', 60.00);
INSERT INTO Imagem_Anteprojeto
VALUES (0001, '29/04/2019', 'Link da Imagem 0001');

INSERT INTO Anteprojeto
VALUES (0002, '13/05/2019', 'Link do CAD do Anteprojeto', 'Link do Sketch', 'Link do PDF', 50.00);
INSERT INTO Imagem_Anteprojeto
VALUES (0002, '13/05/2019', 'Link da Imagem 0002');

