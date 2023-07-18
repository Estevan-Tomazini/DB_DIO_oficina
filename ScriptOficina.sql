DROP DATABASE oficina;

CREATE DATABASE oficina;

USE oficina;

CREATE TABLE clientes (
  idclientes INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(45) NOT NULL,
  email VARCHAR(45) NOT NULL,
  telefone VARCHAR(45) NOT NULL,
  endereco VARCHAR(45) NOT NULL,
  idade int not null,
  PRIMARY KEY (idclientes)
);

CREATE TABLE servicos (
  idservicos INT NOT NULL AUTO_INCREMENT,
  nome VARCHAR(145) NOT NULL,
  descricao VARCHAR(145) NOT NULL,
  valor FLOAT NOT NULL,
  PRIMARY KEY (idservicos)
);

CREATE TABLE ordens_de_servico (
  idordens_de_servico INT NOT NULL AUTO_INCREMENT,
  idcliente INT NOT NULL,
  idservico INT NOT NULL,
  data_ordem DATE NOT NULL,
  status_ordem VARCHAR(145) NOT NULL,
  observacoes VARCHAR(145) NOT NULL,
  clientes_idclientes int NOT NULL default 0,
  PRIMARY KEY (idordens_de_servico)
);

CREATE TABLE ordens_de_servico_has_servico (
  ordens_de_servico_idordens_de_servico int not null primary key,
  ordens_de_servico_clientes_idclientes int not null,
  servicos_idservicos int not null
  );




-- Add dados as tabelas:

INSERT INTO clientes (nome, email, telefone, endereco, idade) VALUES ('João da Silva', 'joao.da.silva@email.com', '(11) 9999-9999', 'Rua da Paz, 123, São Paulo, SP', 23),
	('Maria da Silva', 'maria.da.silva@email.com', '(11) 8888-8888', 'Rua da Felicidade, 456, São Paulo, SP', 84),
	('José da Silvia', 'jose.da.silvia@email.com', '(23) 7777-7777', 'Rua da Alegria, 789, Rio de Janeiro, RJ', 74),
	('Ana da Silva', 'ana.da.silva@email.com', '(32) 6666-6666', 'Rua da Esperança, 1011, Espiro Santo, ES', 10),
	('Pedro da Silva', 'pedro.da.silva@email.com', '(11) 5555-5555', 'Rua da Caridade, 2020, São Paulo, SP', 19),
	('Clara da Silva', 'clara.da.silva@email.com', '(11) 4444-4444', 'Rua da Saúde, 3030, São Paulo, SP', 29),
	('Luis da Silva', 'luis.da.silva@email.com', '(53) 3333-3333', 'Rua da Vida, 4040, Rio Grande do Sul, RS', 53),
	('Rafael da Silva', 'rafael.da.silva@email.com', '(11) 2222-2222', 'Rua da Paz, 5050, São Paulo, SP', 23),
	('Beatriz da Silva', 'beatriz.da.silva@email.com', '(47) 1111-1111', 'Rua da Felicidade, 6060, Santa Catarina, SC', 13),
    ('Roque da Silva', 'roque.da.silva@email.com', '(41) 1111-1111', 'Rua da Luz, 603, Paraná, PR', 43);

INSERT INTO servicos (nome, descricao, valor) VALUES ('Troca de óleo', 'Troca do óleo do motor do veículo', 100.00),
	('Revisão preventiva', 'Revisão geral do veículo para verificar a necessidade de reparos ou troca de peças', 200.00),
	('Balanceamento de rodas', 'Balanceamento das rodas do veículo para evitar vibrações', 150.00),
	('Calibragem dos pneus', 'Calibragem dos pneus do veículo para garantir a pressão correta', 50.00),
	('Trocar o filtro de óleo', 'Troca do filtro de óleo do motor do veículo', 50.00),
	('Trocar o filtro de ar', 'Troca do filtro de ar do motor do veículo', 30.00),
	('Trocar o filtro de combustível', 'Troca do filtro de combustível do veículo', 40.00),
	('Trocar o filtro de ar condicionado', 'Troca do filtro de ar condicionado do veículo', 60.00),
	('Alinhamento das rodas', 'Alinhamento das rodas do veículo para garantir a direção', 200.00),
	('Suspensão do veículo', 'Revisão da suspensão do veículo para garantir o conforto e segurança', 300.00),
	('Freios do veículo', 'Revisão dos freios do veículo para garantir a segurança', 400.00),
	('Eletrônica do veículo', 'Revisão da parte eletrônica do veículo para garantir o funcionamento dos sistemas', 500.00);

INSERT INTO ordens_de_servico (idcliente, idservico, data_ordem, status_ordem, observacoes) VALUES (1, 1, '2023-03-08', 'Em andamento', 'Troca de óleo do motor'),
	(2, 2, '2023-03-09', 'Finalizada', 'Revisão preventiva'),
	(3, 3, '2023-03-10', 'Em andamento', 'Balanceamento de rodas'),
	(4, 4, '2023-03-11', 'Finalizada', 'Calibragem dos pneus'),
	(5, 5, '2023-03-12', 'Em andamento', 'Trocar o filtro de óleo'),
	(6, 6, '2023-03-13', 'Finalizada', 'Trocar o filtro de ar'),
	(7, 7, '2023-03-14', 'Em andamento', 'Trocar o filtro de combustível'),
	(8, 8, '2023-03-15', 'Finalizada', 'Trocar o filtro de ar condicionado');
    
    
    -- Querries:
    -- 1 - Uma querry semples para recuperar o nome, sobrenome e idade dos clientes
    SELECT nome, idade FROM clientes;
    -- 2 - Com a clausula where, mostra nome, sobrenome e idade dos cliente com mais de 18 anos
    SELECT nome, idade FROM clientes WHERE idade > 18;
    -- 3 - Retorna os dados anteriores e adiciona ideda vezes 2 com o alias idade_em_anos_2
    SELECT nome, idade, idade * 2 AS idade_em_anos_dois FROM clientes;
    -- 4 - Mesmo das ultimas querries mas ordena os dados em ordem decrescente
    SELECT nome, idade FROM clientes ORDER BY idade DESC;
    -- 5 - agrupa os clientes em grupos de idade onde clientes estão em mais de um grupo
    SELECT nome, idade FROM clientes GROUP BY idade HAVING COUNT(*) > 1;
    -- 6 - Recupera nomes, preços e produtos numa mesma tabela, por serviço realizado
    SELECT nome_cliente, nome_produto, preco FROM clientes INNER JOIN pedidos ON clientes.id = pedidos.cliente_id;