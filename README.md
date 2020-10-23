# BancoDeDados
2019

1. Requisitos de dados do sistema

Uma empresa de arquitetura necessita da estruturação de um sistema para gerenciar projetos a partir de um banco de dados, considerando os seguintes requisitos:
Um cliente que possui nome, CPF, telefones, e-mail e endereço(Rua, número, complemento, bairro, cidade, estado e CEP), possui uma demanda que armazena as
informações como fotos, croquis, data e uma descrição. A demanda é analisada pelo Funcionário de Gestor de Orçamento e Negociação e, essa análise gera um orçamento.
O diretor jurídico é responsável por escrever o contrato, se o cliente assinar um contrato, que armazena código, a data, prazo, um pdf (Contrato formal) e descrição,
acarretará na criação de um projeto. O projeto, por sua vez armazena código, descrição breve e prazo, também possui um acompanhamento de um Gerente de Projeto. O projeto
possui um estudo preliminar que armazena o prazo, um Resumo da lei, briefing e um levantamento que contém Plantas, projeto 3D e croquis. O projeto também possui
anteprojetos, para cada anteprojeto é armazenado o prazo, uma proposta volumétrica que contém CAD, Sketch e Revit, uma estruturação do memorial descritivo que contém um pdf e
imagens do projeto, e o orçamento da obra. Além disso, o projeto possui um projeto executivo que armazena o prazo, plantas, cortes e imagens renderizadas. Todo projeto
está relacionado com uma equipe, que possui nome, e é composta por membros de três áreas diferentes, sendo elas técnico, Gestão de conhecimento e Relacionamento com o
cliente. De cada funcionário deve ser armazenado Nome, telefones, CPF, RG, email, Histórico, resultado de testes de Personalidade, Período, projetos realizados, afinidades no
curso, preferências de projeto. Além disso, para o Técnico, deve ser armazenado o conhecimento em softwares, para o Gestor do conhecimento deve ser armazenado a
planilha de Metas para cada projeto em que está inserido e, por fim para Relacionamento com cliente devem ser armazenados os registros das conversas realizadas com o cliente.
Tanto o Técnico, o Gestor de Conhecimento e o Relacionamento com o Cliente pode exercer mais de uma função dentro desse conjunto.
