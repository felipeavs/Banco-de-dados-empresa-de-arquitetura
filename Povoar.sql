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
