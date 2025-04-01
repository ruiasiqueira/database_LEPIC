CREATE TABLE alunos(
id_aluno NUMBER(8) CONSTRAINT pk_alunos PRIMARY KEY,
nm_aluno VARCHAR2(70)NOT NULL,
nr_idade NUMBER(3) NOT NULL,
tx_sexo VARCHAR(10) NOT NULL CONSTRAINT ck_aluno CHECK(tx_sexo IN ('M','F')),
nr_rm NUMBER(8) NOT NULL,
nr_pontuacao NUMBER(38) NOT NULL,
nr_quant_simulacoes NUMBER(38) NOT NULL,
nr_insignias NUMBER(15) NOT NULL,
tx_rank VARCHAR(20) CONSTRAINT rank_alunos NULL,
nr_rank NUMBER (15) CONSTRAINT posicao_alunos NULL
);

CREATE TABLE professores(
id_professor NUMBER(8) CONSTRAINT pk_professores PRIMARY KEY,
nm_professor VARCHAR(70) NOT NULL,
nr_idae NUMBER(3) NOT NULL,
tx_sexo VARCHAR(10) NOT NULL CONSTRAINT ck_professores CHECK(tx_sexo IN ('M','F')),
nr_registro NUMBER(8) NOT NULL
);

CREATE TABLE coordenadores(
id_coordenador NUMBER(8) CONSTRAINT pk_coordenadores PRIMARY KEY,
nm_coordenador VARCHAR2(70) NOT NULL,
nr_idade NUMBER(3) NOT NULL,
tx_sexo VARCHAR(10)  NOT NULL CONSTRAINT ck_coordenadores CHECK(tx_sexo IN ('M','F')),
nr_registro NUMBER(10) NOT NULL
);

CREATE TABLE simulacoes(
tp_dificuldade VARCHAR2(10) NOT NULL,
tp_simulacao VARCHAR2(10) NOT NULL
);

CREATE TABLE turmas(
nm_turma VARCHAR(70) CONSTRAINT pk_turmas PRIMARY KEY,
tx_periodo VARCHAR(20) CONSTRAINT ck_turmas CHECK(tx_periodo IN ('NOTURNO' , 'MATUTINO'))
);

ALTER TABLE alunos
ADD nm_turma VARCHAR(70);


ALTER TABLE alunos
ADD CONSTRAINT fk_turma_alunos
FOREIGN KEY (nm_turma)
REFERENCES turmas (nm_turma);

ALTER TABLE simulacoes 
ADD id_aluno NUMBER(8);


ALTER TABLE simulacoes
ADD CONSTRAINT fk_aluno_responsavel 
FOREIGN KEY (id_aluno)
REFERENCES alunos (id_aluno);


ALTER TABLE turmas
ADD id_coordenador NUMBER(8)

ALTER TABLE turmas
ADD id_professor NUMBER(8)

ALTER TABLE turmas
ADD CONSTRAINT fk_coordenador_responsavel
FOREIGN KEY (id_coordenador)
REFERENCES coordenadores (id_coordenador);

ALTER TABLE turmas
ADD CONSTRAINT fk_professor_responsavel
FOREIGN KEY (id_professor)
REFERENCES professores (id_professor);

ALTER TABLE simulacoes 
ADD vl_tempo_exeucao NUMBER(3,3) NOT NULL;

--INSERT alunos
INSERT INTO alunos (id_aluno, nm_aluno, nr_idade, tx_sexo, nr_rm, nr_pontuacao, nr_quant_simulacoes, nr_insignias, tx_rank, nr_rank)
VALUES (1, 'Davi Passanha', 20, 'M', 54321, 535, 48, 5, 'Bronze', 3);

UPDATE alunos SET nm_turma = '1LPNX' WHERE id_aluno = 1;

INSERT INTO alunos (id_aluno, nm_aluno, nr_idade, tx_sexo, nr_rm, nr_pontuacao, nr_quant_simulacoes, nr_insignias, tx_rank, nr_rank, nm_turma)
VALUES (2, 'Rui Siqueira', 20, 'M', 65432, 580, 50, 8, 'Ouro', 1,'2LPNX' );

INSERT INTO alunos (id_aluno, nm_aluno, nr_idade, tx_sexo, nr_rm, nr_pontuacao, nr_quant_simulacoes, nr_insignias, tx_rank, nr_rank, nm_turma)
VALUES (3, 'Carlos Queiroz', 28, 'M', 76543, 520, 49, 6, 'Prata', 2,'4LPNX' );

INSERT INTO alunos (id_aluno, nm_aluno, nr_idade, tx_sexo, nr_rm, nr_pontuacao, nr_quant_simulacoes, nr_insignias, tx_rank, nr_rank, nm_turma)
VALUES (4, 'Cau� Gon�alves', 30, 'M', 87654, 530, 35, 3, 'Sem classifica��o', 10,'5LPNX' );

INSERT INTO alunos (id_aluno, nm_aluno, nr_idade, tx_sexo, nr_rm, nr_pontuacao, nr_quant_simulacoes, nr_insignias, tx_rank, nr_rank, nm_turma)
VALUES (5, 'Luigi Sinno', 35, 'M', 98765, 500, 10, 1, 'Sem classifica��o', 20,'3LPNX' );

ALTER TABLE professores RENAME COLUMN nr_idae TO nr_idade;


--INSERT coordenadores
INSERT INTO coordenadores (id_coordenador, nm_coordenador, nr_idade, tx_sexo, nr_registro)
VALUES (1, 'J�ao da Silva Santos', 45, 'M', 14523);

INSERT INTO coordenadores (id_coordenador, nm_coordenador, nr_idade, tx_sexo, nr_registro)
VALUES (2, 'Antonio Silveira', 48, 'M', 25634);

INSERT INTO coordenadores (id_coordenador, nm_coordenador, nr_idade, tx_sexo, nr_registro)
VALUES (3, 'Pedro Rocha', 40, 'M', 35634);

INSERT INTO coordenadores (id_coordenador, nm_coordenador, nr_idade, tx_sexo, nr_registro)
VALUES (3, 'Manoel Zanetti', 50, 'M', 46745);

INSERT INTO coordenadores (id_coordenador, nm_coordenador, nr_idade, tx_sexo, nr_registro)
VALUES (4, 'Maria Cavalcante', 48, 'F', 57856);

INSERT INTO coordenadores (id_coordenador, nm_coordenador, nr_idade, tx_sexo, nr_registro)
VALUES (5, 'Luana Miguetti', 50, 'F', 68956);

--INSERT professores

INSERT INTO professores (id_professor, nm_professor, nr_idade, tx_sexo, nr_registro)
VALUES (1, 'Carlos Silva', 50, 'M', 13468);

INSERT INTO professores (id_professor, nm_professor, nr_idade, tx_sexo, nr_registro)
VALUES (2, 'Camila Pizzoti', 38, 'F', 24579);

INSERT INTO professores (id_professor, nm_professor, nr_idade, tx_sexo, nr_registro)
VALUES (3, 'Lais Moreira', 50, 'F', 35681);

INSERT INTO professores (id_professor, nm_professor, nr_idade, tx_sexo, nr_registro)
VALUES (4, 'Guilherme Pedroso', 45, 'M', 46792);

INSERT INTO professores (id_professor, nm_professor, nr_idade, tx_sexo, nr_registro)
VALUES (5, 'Luana Carpacci', 40, 'F', 57813);

--INSERT turmas

INSERT INTO turmas (nm_turma, tx_periodo, id_coordenador, id_professor)
VALUES ('1LPNX', 'NOTURNO',1, 4);

INSERT INTO turmas (nm_turma, tx_periodo, id_coordenador, id_professor)
VALUES ('3LPNX', 'MATUTINO',2, 5);

INSERT INTO turmas (nm_turma, tx_periodo, id_coordenador, id_professor)
VALUES ('2LPNX', 'NOTURNO',3, 1);

INSERT INTO turmas (nm_turma, tx_periodo, id_coordenador, id_professor)
VALUES ('5LPNX', 'MATUTINO',4, 2);

INSERT INTO turmas (nm_turma, tx_periodo, id_coordenador, id_professor)
VALUES ('4LPNX', 'NOTURNO' ,5, 3);

--INSERT simulacoes



--COMMENTS TABLES
COMMENT ON TABLE alunos IS 'Dados sobre o aluno e seus treinamentos';

COMMENT ON TABLE coordenadores IS 'Dados sobre os coordenadores';

COMMENT ON TABLE professores IS 'Dados sobre os professores';

COMMENT ON TABLE simulacoes IS 'Dados b�sicos sobre cada simula��o';

COMMENT ON TABLE turmas IS 'Dados sobre cada turma';

--COMMENTS COLUMN alunos

COMMENT ON COLUMN alunos.id_aluno IS 'Identificador do aluno';
COMMENT ON COLUMN alunos.nm_aluno IS 'Nome do aluno';
COMMENT ON COLUMN alunos.nr_idade IS 'Idad do aluno';
COMMENT ON COLUMN alunos.tx_sexo IS 'Sexo do aluno';
COMMENT ON COLUMN alunos.nr_rm IS 'N�mero da matr�cula';
COMMENT ON COLUMN alunos.nr_pontuacao IS 'N�mero de pontua��o atingido pelo aluno';
COMMENT ON COLUMN alunos.nr_quant_simulacoes IS 'Simula��es realizadas pelo aluno';
COMMENT ON COLUMN alunos.nr_insignias IS 'N�mero de insignias(conquistas) atingidas pelo aluno';
COMMENT ON COLUMN alunos.tx_rank IS 'Ranking de classifica��o do aluno';
COMMENT ON COLUMN alunos.nr_rank IS 'Ranking geral do aluno';
COMMENT ON COLUMN alunos.nm_turma IS 'Nome da turma do aluno';

--COMMENTS COLUMN coordenadores

COMMENT ON COLUMN coordenadores.id_coordenador IS 'Identificador do coordenador';
COMMENT ON COLUMN coordenadores.nm_coordenador IS 'Nome do coordenador';
COMMENT ON COLUMN coordenadores.nr_idade IS 'Idade do coordenador';
COMMENT ON COLUMN coordenadores.tx_sexo IS 'Sexo do coordenador';
COMMENT ON COLUMN coordenadores.nr_registro IS 'N�mero de registro do coordenador';


--COMMENT COLUMN professores

COMMENT ON COLUMN professores.id_professor IS 'Identificador do professor';
COMMENT ON COLUMN professores.nm_professor IS 'Nome do professor';
COMMENT ON COLUMN professores.nr_idade IS 'Idade do professor';
COMMENT ON COLUMN professores.tx_sexo IS 'Sexo do professor';
COMMENT ON COLUMN professores.nr_registro IS 'N�mero de registro do professor';


ALTER TABLE SIMULACOES RENAME COLUMN vl_tempo_exeucao TO vl_tempo_execucao;

--COMMENT COLUMN simulacoes

COMMENT ON COLUMN simulacoes.tp_dificuldade IS 'Dificuldade escolhida para a simula��o';
COMMENT ON COLUMN simulacoes.tp_simulacao IS 'Simula��o escolhida dentre as op��es dispon�veis';
COMMENT ON COLUMN simulacoes.id_aluno IS 'Identificador do aluno';
COMMENT ON COLUMN simulacoes.vl_tempo_execucao IS 'Tempo at� o t�rmino da simula��o';


--COMMENT COLUMN turmas

COMMENT ON COLUMN turmas.nm_turma IS 'Nome da turma';
COMMENT ON COLUMN turmas.tx_periodo IS 'Per�odo de aulas da turma';
COMMENT ON COLUMN turmas.id_coordenador IS 'Identificador do coordenador respos�vel pela turma';
COMMENT ON COLUMN turmas.id_professor IS 'Identificador do professor respos�vel pela turma';

--SEQUENCE

CREATE SEQUENCE pontuacao
    START WITH 1
    INCREMENT BY 100;
    
UPDATE alunos
SET nr_pontuacao = pontuacao.NEXTVAL;






















