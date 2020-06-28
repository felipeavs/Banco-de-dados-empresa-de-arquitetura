#include <iostream>
#include <stdio.h>
#include <iomanip>
#include <cstring>
#include <string.h>
#include "libpq-fe.h"
using namespace std;

//Inserção
int inserir_cliente(void);
int inserir_funcionario(void);

//Pesquisas
int listar_clientes(void);
int listar_funcionarios(void);
int listar_projetos(void);
int listar_demandas(void);

int buscar_func_Projs(void);
int buscar_projs_gerente(void);
int buscar_contratos_assinados(void);

//Remoção
int deletar_cliente(void);
int deletar_funcionario(void);

//Atualização
int atualizar_orcamento_demanda(void);

int main()
{
	int op_menu, op_subMenu;

	//----------------------------------------------------------------------------------------------
	do {
		cout << "\nBANCO DE DADOS Arq_Jr" << endl << endl;
		cout << "1 - Inserir" << endl;
		cout << "2 - Buscar" << endl;
		cout << "3 - Atualizar" << endl;
		cout << "4 - Deletar" << endl;
		cout << "0 - Sair" << endl;
		cout << "Escolha: ";
		cin >> op_menu;
		cout << endl;

		switch (op_menu) {
		case 1:
			cout << "\nInserir" << endl << endl;
			cout << "1 - Inserir cliente" << endl;
			cout << "2 - Inserir funcionario" << endl;
			cout << "0 - Sair" << endl;
			cout << "Escolha: ";
			cin >> op_subMenu;
			cout << endl;

			switch (op_subMenu)
			{
			case 1:
				inserir_cliente();
				break;
			case 2:
				inserir_funcionario();
				break;
			}
			break;
		case 2:
			cout << "\nBUSCAR" << endl << endl;
			cout << "1 - Listar Clientes" << endl;
			cout << "2 - Listar Funcionarios" << endl;
			cout << "3 - Listar Projetos" << endl;
			cout << "4 - Listar Demandas" << endl << endl;
			cout << "5 - Buscar Funcionarios que trabalham em Projetos" << endl;
			cout << "6 - Buscar projetos gerenciados" << endl;
			cout << "7 - Buscar Contratos assinados" << endl;
			cout << "0 - Sair" << endl;
			cout << "Escolha: ";
			cin >> op_subMenu;
			cout << endl;

			switch (op_subMenu)
			{
			case 1:
				listar_clientes();
				break;
			case 2:
				listar_funcionarios();
				break;
			case 3:
				listar_projetos();
				break;
			case 4:
				listar_demandas();
				break;
			case 5:
				buscar_func_Projs();
				break;
			case 6:
				buscar_projs_gerente();
				break;
			case 7:
				buscar_contratos_assinados();
				break;
			}
			break;
		case 3:
			cout << "\nAtualizar" << endl << endl;
			cout << "1 - Atualizar orcamento da demanda" << endl;
			cout << "0 - Sair" << endl;
			cout << "Escolha: ";
			cin >> op_subMenu;
			cout << endl;
			switch (op_subMenu)
			{
			case 1:
				atualizar_orcamento_demanda();
				break;
			}
			break;
		case 4:
			cout << "\nDeletar" << endl << endl;
			cout << "1 - Deletar cliente via chave" << endl;
			cout << "2 - Deletar funcionario via chave" << endl;
			cout << "0 - Sair" << endl;
			cout << "Escolha: ";
			cin >> op_subMenu;
			cout << endl;
			switch (op_subMenu)
			{
			case 1:
				deletar_cliente();
				break;
			case 2:
				deletar_funcionario();
				break;
			}
			break;
		}
	} while (op_menu);

	return 0;
}


//METODOS
int inserir_cliente(void) {
	PGconn* conn = NULL;
	conn = PQconnectdb("host=localhost port=5433 dbname = Arq_Jr user = postgres password = postgres");

	if (PQstatus(conn) != CONNECTION_OK)
	{
		cout << "ERRO" << endl;
		cout << PQerrorMessage(conn);
		PQfinish(conn);
		return 1;
	}

	PGresult* res;
	res = PQexec(conn, "insert into cliente values (00000000005, 'Felipe Silva', 'felpsmail@email.com', 35400000, 'MG', 'Ouro Preto', 'Bauxita', 'R alfa', 200, 'AP', NULL, NULL);");

	if (PQresultStatus(res) != PGRES_COMMAND_OK)
	{
		cout << PQerrorMessage(conn);
		PQclear(res);
		PQfinish(conn);
		return 2;
	}

	cout << "Cliente inserido com sucesso!" << endl;
	PQclear(res);
	PQfinish(conn);
	return 0;
}

int inserir_funcionario(void) {
	PGconn* conn = NULL;
	conn = PQconnectdb("host=localhost port=5433 dbname = Arq_Jr user = postgres password = postgres");

	if (PQstatus(conn) != CONNECTION_OK)
	{
		cout << "ERRO" << endl;
		cout << PQerrorMessage(conn);
		PQfinish(conn);
		return 1;
	}

	PGresult* res;
	res = PQexec(conn, "INSERT INTO Funcionario VALUES(77777777777, 'Fernando ', 'Link Historico Escolar', 'Link Teste de Personalidade', 'frndsilva@gmail.com', 0, 'Preferencias de projetos', 'Afinidades do curso', 77777777); INSERT INTO Telefones_Func VALUES(77777777777, 31999999999); ");

	if (PQresultStatus(res) != PGRES_COMMAND_OK)
	{
		cout << PQerrorMessage(conn);
		PQclear(res);
		PQfinish(conn);
		return 2;
	}

	cout << "funcionario inserido com sucesso!" << endl;
	PQclear(res);
	PQfinish(conn);
	return 0;
}

int listar_clientes(void) {
	int n_tuplas, n_atributos;

	PGconn* conn = NULL;
	conn = PQconnectdb("host=localhost port=5433 dbname = Arq_Jr user = postgres password = postgres");

	if (PQstatus(conn) != CONNECTION_OK)
	{
		cout << "ERRO" << endl;
		cout << PQerrorMessage(conn);
		PQfinish(conn);
		return 1;
	}

	PGresult* res;
	res = PQexec(conn, "select cpf, nome, telefone from (cliente left outer join telefone_cliente on cliente.cpf = telefone_cliente.cpf_cliente);");

	if (PQresultStatus(res) != PGRES_TUPLES_OK)
	{
		cout << PQerrorMessage(conn);
		PQclear(res);
		PQfinish(conn);
		return 2;
	}

	n_tuplas = PQntuples(res);
	n_atributos = PQnfields(res);

	cout << "Clientes:" << endl;
	for (int i = 0; i < n_tuplas; i++)
	{
		for (int j = 0; j < n_atributos; j++)
		{
			// Imprime o valor do atributo j da tupla i
			cout << setw(20) << PQgetvalue(res, i, j) << "\t";
		}
		cout << endl;
	}


	PQclear(res);
	PQfinish(conn);
	return 0;
}

int listar_funcionarios(void) {
	int n_tuplas, n_atributos;

	PGconn* conn = NULL;
	conn = PQconnectdb("host=localhost port=5433 dbname = Arq_Jr user = postgres password = postgres");

	if (PQstatus(conn) != CONNECTION_OK)
	{
		cout << "ERRO" << endl;
		cout << PQerrorMessage(conn);
		PQfinish(conn);
		return 1;
	}

	PGresult* res;
	res = PQexec(conn, "select cpf, nome, rg, telefone from funcionario, telefones_func where funcionario.cpf = telefones_func.cpf_func;");

	if (PQresultStatus(res) != PGRES_TUPLES_OK)
	{
		cout << PQerrorMessage(conn);
		PQclear(res);
		PQfinish(conn);
		return 2;
	}

	n_tuplas = PQntuples(res);
	n_atributos = PQnfields(res);

	cout << "Funcionarios:" << endl;
	for (int i = 0; i < n_tuplas; i++)
	{
		for (int j = 0; j < n_atributos; j++)
		{
			// Imprime o valor do atributo j da tupla i
			cout << setw(20) << PQgetvalue(res, i, j) << "\t";
		}
		cout << endl;
	}


	PQclear(res);
	PQfinish(conn);
	return 0;
}

int listar_projetos(void) {
	int n_tuplas, n_atributos;

	PGconn* conn = NULL;
	conn = PQconnectdb("host=localhost port=5433 dbname = Arq_Jr user = postgres password = postgres");

	if (PQstatus(conn) != CONNECTION_OK)
	{
		cout << "ERRO" << endl;
		cout << PQerrorMessage(conn);
		PQfinish(conn);
		return 1;
	}

	PGresult* res;
	res = PQexec(conn, "select codigo, descricao, projeto.prazo, cpf_gerente_projeto, orcamento  from projeto, anteprojeto where projeto.codigo = anteprojeto.codigo_projeto;");

	if (PQresultStatus(res) != PGRES_TUPLES_OK)
	{
		cout << PQerrorMessage(conn);
		PQclear(res);
		PQfinish(conn);
		return 2;
	}

	n_tuplas = PQntuples(res);
	n_atributos = PQnfields(res);

	cout << "Projetos:" << endl;
	for (int i = 0; i < n_tuplas; i++)
	{
		for (int j = 0; j < n_atributos; j++)
		{
			// Imprime o valor do atributo j da tupla i
			cout << setw(20) << PQgetvalue(res, i, j) << "\t";
		}
		cout << endl;
	}


	PQclear(res);
	PQfinish(conn);
	return 0;
}

int listar_demandas(void) {
	int n_tuplas, n_atributos;

	PGconn* conn = NULL;
	conn = PQconnectdb("host=localhost port=5433 dbname = Arq_Jr user = postgres password = postgres");

	if (PQstatus(conn) != CONNECTION_OK)
	{
		cout << "ERRO" << endl;
		cout << PQerrorMessage(conn);
		PQfinish(conn);
		return 1;
	}

	PGresult* res;
	res = PQexec(conn, "select codigo_contrato, descricao, data, orcamento  from demanda;");

	if (PQresultStatus(res) != PGRES_TUPLES_OK)
	{
		cout << PQerrorMessage(conn);
		PQclear(res);
		PQfinish(conn);
		return 2;
	}

	n_tuplas = PQntuples(res);
	n_atributos = PQnfields(res);

	cout << "Projetos:" << endl;
	for (int i = 0; i < n_tuplas; i++)
	{
		for (int j = 0; j < n_atributos; j++)
		{
			// Imprime o valor do atributo j da tupla i
			cout << setw(20) << PQgetvalue(res, i, j) << "\t";
		}
		cout << endl;
	}


	PQclear(res);
	PQfinish(conn);
	return 0;
}

int buscar_func_Projs(void) {
	int n_tuplas, n_atributos;

	PGconn* conn = NULL;
	conn = PQconnectdb("host=localhost port=5433 dbname = Arq_Jr user = postgres password = postgres");

	if (PQstatus(conn) != CONNECTION_OK)
	{
		cout << "ERRO" << endl;
		cout << PQerrorMessage(conn);
		PQfinish(conn);
		return 1;
	}

	PGresult* res;
	res = PQexec(conn, "SELECT DISTINCT cpf, nome FROM funcionario WHERE cpf IN(SELECT tecnico.cpf_func FROM compoe, tecnico WHERE(compoe.codigo_membro = tecnico.codigo_membro_equipe) union SELECT gestor_conhecimento.cpf_func FROM compoe, gestor_conhecimento WHERE(compoe.codigo_membro = gestor_conhecimento.codigo_membro_equipe) union SELECT relacionamento_cliente.cpf_func FROM compoe, relacionamento_cliente WHERE(compoe.codigo_membro = relacionamento_cliente.codigo_membro_equipe) union 	SELECT gerente_projeto.cpf_func FROM projeto, gerente_projeto WHERE(projeto.cpf_gerente_projeto = gerente_projeto.cpf_func)); ");

	if (PQresultStatus(res) != PGRES_TUPLES_OK)
	{
		cout << PQerrorMessage(conn);
		PQclear(res);
		PQfinish(conn);
		return 2;
	}

	n_tuplas = PQntuples(res);
	n_atributos = PQnfields(res);

	cout << "Funcionarios:" << endl;
	for (int i = 0; i < n_tuplas; i++)
	{
		for (int j = 0; j < n_atributos; j++)
		{
			// Imprime o valor do atributo j da tupla i
			cout << setw(20) << PQgetvalue(res, i, j) << "\t";
		}
		cout << endl;
	}


	PQclear(res);
	PQfinish(conn);
	return 0;
}

int buscar_projs_gerente(void) {
	int n_tuplas, n_atributos;
	char cpf[12], str[300];

	cout << "Informe o cpf: ";
	cin >> cpf;
	cout << endl;

	PGconn* conn = NULL;
	conn = PQconnectdb("host=localhost port=5433 dbname = Arq_Jr user = postgres password = postgres");

	if (PQstatus(conn) != CONNECTION_OK)
	{
		cout << "ERRO" << endl;
		cout << PQerrorMessage(conn);
		PQfinish(conn);
		return 1;
	}

	PGresult* res;
	strcpy(str, "SELECT codigo, descricao, prazo FROM projeto WHERE cpf_gerente_projeto = ");
	strcat(str, cpf);
	strcat(str, ";");
	res = PQexec(conn, str);

	if (PQresultStatus(res) != PGRES_TUPLES_OK)
	{
		cout << PQerrorMessage(conn);
		PQclear(res);
		PQfinish(conn);
		return 2;
	}

	n_tuplas = PQntuples(res);
	n_atributos = PQnfields(res);

	cout << "Projetos:" << endl;
	for (int i = 0; i < n_tuplas; i++)
	{
		for (int j = 0; j < n_atributos; j++)
		{
			// Imprime o valor do atributo j da tupla i
			cout << setw(20) << PQgetvalue(res, i, j) << "\t";
		}
		cout << endl;
	}


	PQclear(res);
	PQfinish(conn);
	return 0;
}

int buscar_contratos_assinados(void) {
	int n_tuplas, n_atributos;

	PGconn* conn = NULL;
	conn = PQconnectdb("host=localhost port=5433 dbname = Arq_Jr user = postgres password = postgres");

	if (PQstatus(conn) != CONNECTION_OK)
	{
		cout << "ERRO" << endl;
		cout << PQerrorMessage(conn);
		PQfinish(conn);
		return 1;
	}

	PGresult* res;
	res = PQexec(conn, "select codigo, data, pdf  from contrato, e_assinado where contrato.codigo = e_assinado.codigo_contrato;");

	if (PQresultStatus(res) != PGRES_TUPLES_OK)
	{
		cout << PQerrorMessage(conn);
		PQclear(res);
		PQfinish(conn);
		return 2;
	}

	n_tuplas = PQntuples(res);
	n_atributos = PQnfields(res);

	cout << "Contratos:" << endl;
	for (int i = 0; i < n_tuplas; i++)
	{
		for (int j = 0; j < n_atributos; j++)
		{
			// Imprime o valor do atributo j da tupla i
			cout << setw(20) << PQgetvalue(res, i, j) << "\t";
		}
		cout << endl;
	}


	PQclear(res);
	PQfinish(conn);
	return 0;
}

int deletar_cliente(void) {
	char cpf[12];
	char str[100];
	
	cout << "Insira o cpf: ";
	cin >> cpf;
	cout << endl;

	PGconn* conn = NULL;
	conn = PQconnectdb("host=localhost port=5433 dbname = Arq_Jr user = postgres password = postgres");

	if (PQstatus(conn) != CONNECTION_OK)
	{
		cout << "ERRO" << endl;
		cout << PQerrorMessage(conn);
		PQfinish(conn);
		return 1;
	}


	PGresult* res;
	strcpy(str, "delete from cliente WHERE  cpf = ");
	strcat(str, cpf);
	strcat(str, ";");
	//"delete from cliente WHERE  cpf = " 00000000005 ";"
	res = PQexec(conn, str);

	if (PQresultStatus(res) != PGRES_COMMAND_OK)
	{
		cout << PQerrorMessage(conn);
		PQclear(res);
		PQfinish(conn);
		return 2;
	}

	cout << "Cliente deletado com sucesso!" << endl;
	PQclear(res);
	PQfinish(conn);
	return 0;
}

int deletar_funcionario(void) {
	char cpf[12];
	char str[100];

	cout << "Insira o cpf: ";
	cin >> cpf;
	cout << endl;

	PGconn* conn = NULL;
	conn = PQconnectdb("host=localhost port=5433 dbname = Arq_Jr user = postgres password = postgres");

	if (PQstatus(conn) != CONNECTION_OK)
	{
		cout << "ERRO" << endl;
		cout << PQerrorMessage(conn);
		PQfinish(conn);
		return 1;
	}


	PGresult* res;
	strcpy(str, "delete from funcionario WHERE  cpf = ");
	strcat(str, cpf);
	strcat(str, ";");
	//"delete from cliente WHERE  cpf = " 77777777777 ";"
	res = PQexec(conn, str);

	if (PQresultStatus(res) != PGRES_COMMAND_OK)
	{
		cout << PQerrorMessage(conn);
		PQclear(res);
		PQfinish(conn);
		return 2;
	}

	cout << "Funcionario deletado com sucesso!" << endl;
	PQclear(res);
	PQfinish(conn);
	return 0;
}

int atualizar_orcamento_demanda(void) {
	char contrato[5];
	char data[11];
	char valor[10];
	char str[300];

	cout << "Insira o codigo do contrato: ";
	cin >> contrato;
	cout << endl;

	cout << "Insira a data da demanda: ";
	cin >> data;
	cout << endl;

	cout << "Digite o novo valor do orcamento: ";
	cin >> valor;
	cout << endl;

	PGconn* conn = NULL;
	conn = PQconnectdb("host=localhost port=5433 dbname = Arq_Jr user = postgres password = postgres");

	if (PQstatus(conn) != CONNECTION_OK)
	{
		cout << "ERRO" << endl;
		cout << PQerrorMessage(conn);
		PQfinish(conn);
		return 1;
	}

	PGresult* res;

	strcpy(str, "update demanda set orcamento = ");
	strcat(str, valor);
	strcat(str, " WHERE  (codigo_contrato = ");
	strcat(str, contrato);
	strcat(str, ") AND (data = '");
	strcat(str, data);
	strcat(str, "');");

	//"update demanda set orcamento = 1000 where (codigo_contrato = 1) and (data = 01/01/2019);"
	res = PQexec(conn, str);

	if (PQresultStatus(res) != PGRES_COMMAND_OK)
	{
		cout << PQerrorMessage(conn);
		PQclear(res);
		PQfinish(conn);
		return 2;
	}

	cout << "Orcamento da demanda atualizada com sucesso!" << endl;
	PQclear(res);
	PQfinish(conn);
	return 0;
}