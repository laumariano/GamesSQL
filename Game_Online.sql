CREATE DATABASE IF NOT EXISTS db_generation_game_online;

USE db_generation_game_online;

CREATE TABLE IF NOT EXISTS tb_classes (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    descricao VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS tb_personagens (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(50) NOT NULL,
    classe_id INT,
    poder_ataque INT,
    poder_defesa INT,
    FOREIGN KEY (classe_id) REFERENCES tb_classes(id)
);

INSERT INTO tb_classes (nome, descricao) VALUES
('Guerreiro', 'Personagens especializados em combate corpo a corpo.'),
('Mago', 'Personagens que utilizam magia para atacar e defender.'),
('Arqueiro', 'Personagens que atacam à distância.');

INSERT INTO tb_personagens (nome, classe_id, poder_ataque, poder_defesa) VALUES
('Super Herói', 1, 2500, 1500),
('Feiticeira', 2, 1800, 1200),
('Archer', 3, 2100, 1000),
('Barbaro', 1, 2800, 2000),
('Wizard', 2, 1600, 800),
('Thief', 3, 1900, 900),
('Paladin', 1, 2200, 1800),
('Sorcerer', 2, 2000, 1300);

SELECT * FROM tb_personagens WHERE poder_ataque > 2000;

SELECT * FROM tb_personagens WHERE poder_defesa BETWEEN 1000 AND 2000;

SELECT * FROM tb_personagens WHERE nome LIKE '%C%';

SELECT p.*, c.nome AS classe
FROM tb_personagens p
INNER JOIN tb_classes c ON p.classe_id = c.id;

SELECT p.*, c.nome AS classe
FROM tb_personagens p
INNER JOIN tb_classes c ON p.classe_id = c.id
WHERE c.nome = 'Arqueiro';
