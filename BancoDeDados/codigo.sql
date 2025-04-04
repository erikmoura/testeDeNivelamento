DROP DATABASE IF EXISTS data_ANS;
CREATE DATABASE IF NOT EXISTS data_ANS;
USE data_ANS;

-- mudar diretorio de arquivos csv conforme necessario

CREATE TABLE IF NOT EXISTS relatorio_cadop (
    id INT AUTO_INCREMENT PRIMARY KEY,
    Registro_ANS VARCHAR(20),
    CNPJ VARCHAR(18),
    Razao_Social VARCHAR(255),
    Nome_Fantasia VARCHAR(255),
    Modalidade VARCHAR(100),
    Logradouro VARCHAR(255),
    Numero VARCHAR(20),
    Complemento VARCHAR(255),
    Bairro VARCHAR(100),
    Cidade VARCHAR(100),
    UF CHAR(2),
    CEP VARCHAR(10),
    DDD CHAR(2),
    Telefone VARCHAR(30),
    Fax VARCHAR(30),
    Endereco_eletronico VARCHAR(255),
    Representante VARCHAR(255),
    Cargo_Representante VARCHAR(150),
    Regiao_de_Comercializacao TEXT,
    Data_Registro_ANS VARCHAR(255)
);

CREATE TABLE IF NOT EXISTS contas_contabeis_1T2023 (
    id INT AUTO_INCREMENT PRIMARY KEY,
    DATA VARCHAR(255),
    REG_ANS VARCHAR(20),
    CD_CONTA_CONTABIL VARCHAR(50),
    DESCRICAO VARCHAR(255),
    VL_SALDO_INICIAL DECIMAL(15,2),
    VL_SALDO_FINAL DECIMAL(15,2)
);

CREATE TABLE IF NOT EXISTS contas_contabeis_2T2023 (
    id INT AUTO_INCREMENT PRIMARY KEY,
    DATA VARCHAR(255),
    REG_ANS VARCHAR(20),
    CD_CONTA_CONTABIL VARCHAR(50),
    DESCRICAO VARCHAR(255),
    VL_SALDO_INICIAL DECIMAL(15,2),
    VL_SALDO_FINAL DECIMAL(15,2)
);

CREATE TABLE IF NOT EXISTS contas_contabeis_3T2023 (
    id INT AUTO_INCREMENT PRIMARY KEY,
    DATA VARCHAR(255),
    REG_ANS VARCHAR(20),
    CD_CONTA_CONTABIL VARCHAR(50),
    DESCRICAO VARCHAR(255),
    VL_SALDO_INICIAL DECIMAL(15,2),
    VL_SALDO_FINAL DECIMAL(15,2)
);

CREATE TABLE IF NOT EXISTS contas_contabeis_4T2023 (
    id INT AUTO_INCREMENT PRIMARY KEY,
    DATA VARCHAR(255),
    REG_ANS VARCHAR(20),
    CD_CONTA_CONTABIL VARCHAR(50),
    DESCRICAO VARCHAR(255),
    VL_SALDO_INICIAL DECIMAL(15,2),
    VL_SALDO_FINAL DECIMAL(15,2)
);

CREATE TABLE IF NOT EXISTS contas_contabeis_1T2024 (
    id INT AUTO_INCREMENT PRIMARY KEY,
    DATA VARCHAR(255),
    REG_ANS VARCHAR(20),
    CD_CONTA_CONTABIL VARCHAR(50),
    DESCRICAO VARCHAR(255),
    VL_SALDO_INICIAL DECIMAL(15,2),
    VL_SALDO_FINAL DECIMAL(15,2)
);

CREATE TABLE IF NOT EXISTS contas_contabeis_2T2024 (
    id INT AUTO_INCREMENT PRIMARY KEY,
    DATA VARCHAR(255),
    REG_ANS VARCHAR(20),
    CD_CONTA_CONTABIL VARCHAR(50),
    DESCRICAO VARCHAR(255),
    VL_SALDO_INICIAL DECIMAL(15,2),
    VL_SALDO_FINAL DECIMAL(15,2)
);

CREATE TABLE IF NOT EXISTS contas_contabeis_3T2024 (
    id INT AUTO_INCREMENT PRIMARY KEY,
    DATA VARCHAR(255),
    REG_ANS VARCHAR(20),
    CD_CONTA_CONTABIL VARCHAR(50),
    DESCRICAO VARCHAR(255),
    VL_SALDO_INICIAL DECIMAL(15,2),
    VL_SALDO_FINAL DECIMAL(15,2)
);

CREATE TABLE IF NOT EXISTS contas_contabeis_4T2024 (
    id INT AUTO_INCREMENT PRIMARY KEY,
    DATA VARCHAR(255),
    REG_ANS VARCHAR(20),
    CD_CONTA_CONTABIL VARCHAR(50),
    DESCRICAO VARCHAR(255),
    VL_SALDO_INICIAL DECIMAL(15,2),
    VL_SALDO_FINAL DECIMAL(15,2)
);

-- arquivo operadoras ativas
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/Relatorio_cadop.csv'
INTO TABLE relatorio_cadop
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(Registro_ANS, CNPJ, Razao_Social, Nome_Fantasia, Modalidade, Logradouro, Numero, Complemento, Bairro, 
Cidade, UF, CEP, DDD, Telefone, Fax, Endereco_eletronico, Representante, Cargo_Representante, 
Regiao_de_Comercializacao, Data_Registro_ANS);


-- arquivos 2023
LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/1T2023.csv'
INTO TABLE contas_contabeis_1T2023
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(DATA, REG_ANS, CD_CONTA_CONTABIL, DESCRICAO, @VL_SALDO_INICIAL, @VL_SALDO_FINAL)
SET 
    VL_SALDO_INICIAL = REPLACE(@VL_SALDO_INICIAL, ',', '.'),
    VL_SALDO_FINAL = REPLACE(@VL_SALDO_FINAL, ',', '.');
    

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/2T2023.csv'
INTO TABLE contas_contabeis_2T2023
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(DATA, REG_ANS, CD_CONTA_CONTABIL, DESCRICAO, @VL_SALDO_INICIAL, @VL_SALDO_FINAL)
SET 
    VL_SALDO_INICIAL = REPLACE(@VL_SALDO_INICIAL, ',', '.'),
    VL_SALDO_FINAL = REPLACE(@VL_SALDO_FINAL, ',', '.');


LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/3T2023.csv'
INTO TABLE contas_contabeis_3T2023
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(DATA, REG_ANS, CD_CONTA_CONTABIL, DESCRICAO, @VL_SALDO_INICIAL, @VL_SALDO_FINAL)
SET 
    VL_SALDO_INICIAL = REPLACE(@VL_SALDO_INICIAL, ',', '.'),
    VL_SALDO_FINAL = REPLACE(@VL_SALDO_FINAL, ',', '.');


LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/4T2023.csv'
INTO TABLE contas_contabeis_4T2023
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(DATA, REG_ANS, CD_CONTA_CONTABIL, DESCRICAO, @VL_SALDO_INICIAL, @VL_SALDO_FINAL)
SET 
    VL_SALDO_INICIAL = REPLACE(@VL_SALDO_INICIAL, ',', '.'),
    VL_SALDO_FINAL = REPLACE(@VL_SALDO_FINAL, ',', '.');


-- arquivos 2024

LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/1T2024.csv'
INTO TABLE contas_contabeis_1T2024
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(DATA, REG_ANS, CD_CONTA_CONTABIL, DESCRICAO, @VL_SALDO_INICIAL, @VL_SALDO_FINAL)
SET 
    VL_SALDO_INICIAL = REPLACE(@VL_SALDO_INICIAL, ',', '.'),
    VL_SALDO_FINAL = REPLACE(@VL_SALDO_FINAL, ',', '.');


LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/2T2024.csv'
INTO TABLE contas_contabeis_2T2024
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(DATA, REG_ANS, CD_CONTA_CONTABIL, DESCRICAO, @VL_SALDO_INICIAL, @VL_SALDO_FINAL)
SET 
    VL_SALDO_INICIAL = REPLACE(@VL_SALDO_INICIAL, ',', '.'),
    VL_SALDO_FINAL = REPLACE(@VL_SALDO_FINAL, ',', '.');


LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/3T2024.csv'
INTO TABLE contas_contabeis_3T2024
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(DATA, REG_ANS, CD_CONTA_CONTABIL, DESCRICAO, @VL_SALDO_INICIAL, @VL_SALDO_FINAL)
SET 
    VL_SALDO_INICIAL = REPLACE(@VL_SALDO_INICIAL, ',', '.'),
    VL_SALDO_FINAL = REPLACE(@VL_SALDO_FINAL, ',', '.');


LOAD DATA INFILE 'C:/ProgramData/MySQL/MySQL Server 8.0/Uploads/4T2024.csv'
INTO TABLE contas_contabeis_4T2024
CHARACTER SET utf8mb4
FIELDS TERMINATED BY ';'
ENCLOSED BY '"'
LINES TERMINATED BY '\n'
IGNORE 1 ROWS
(DATA, REG_ANS, CD_CONTA_CONTABIL, DESCRICAO, @VL_SALDO_INICIAL, @VL_SALDO_FINAL)
SET 
    VL_SALDO_INICIAL = REPLACE(@VL_SALDO_INICIAL, ',', '.'),
    VL_SALDO_FINAL = REPLACE(@VL_SALDO_FINAL, ',', '.');


-- criacao de indices para melhorar a performance de consultas

CREATE UNIQUE INDEX idx_registro_ans ON relatorio_cadop (Registro_ANS);

CREATE INDEX idx_cnpj ON relatorio_cadop (CNPJ);

CREATE INDEX idx_nome_fantasia ON relatorio_cadop (Nome_Fantasia);
CREATE INDEX idx_razao_social ON relatorio_cadop (Razao_Social);

CREATE INDEX idx_localizacao ON relatorio_cadop (UF, Cidade);



CREATE INDEX idx_data ON contas_contabeis_1T2023 (DATA);

CREATE INDEX idx_saldo_inicial ON contas_contabeis_1T2023(VL_SALDO_INICIAL);
CREATE INDEX idx_saldo_final ON contas_contabeis_1T2023(VL_SALDO_FINAL);

CREATE INDEX idx_cd_conta_contabil ON contas_contabeis_1T2023 (CD_CONTA_CONTABIL);

CREATE INDEX idx_reg_ans_data ON contas_contabeis_1T2023 (REG_ANS, DATA);

CREATE INDEX idx_data ON contas_contabeis_2T2023 (DATA);

CREATE INDEX idx_saldo_inicial ON contas_contabeis_2T2023(VL_SALDO_INICIAL);
CREATE INDEX idx_saldo_final ON contas_contabeis_2T2023(VL_SALDO_FINAL);

CREATE INDEX idx_cd_conta_contabil ON contas_contabeis_2T2023 (CD_CONTA_CONTABIL);

CREATE INDEX idx_reg_ans_data ON contas_contabeis_2T2023 (REG_ANS, DATA);

CREATE INDEX idx_data ON contas_contabeis_3T2023 (DATA);

CREATE INDEX idx_saldo_inicial ON contas_contabeis_3T2023(VL_SALDO_INICIAL);
CREATE INDEX idx_saldo_final ON contas_contabeis_3T2023(VL_SALDO_FINAL);

CREATE INDEX idx_cd_conta_contabil ON contas_contabeis_3T2023 (CD_CONTA_CONTABIL);

CREATE INDEX idx_reg_ans_data ON contas_contabeis_3T2023 (REG_ANS, DATA);

CREATE INDEX idx_data ON contas_contabeis_4T2023 (DATA);

CREATE INDEX idx_saldo_inicial ON contas_contabeis_4T2023(VL_SALDO_INICIAL);
CREATE INDEX idx_saldo_final ON contas_contabeis_4T2023(VL_SALDO_FINAL);

CREATE INDEX idx_cd_conta_contabil ON contas_contabeis_4T2023 (CD_CONTA_CONTABIL);

CREATE INDEX idx_reg_ans_data ON contas_contabeis_4T2023 (REG_ANS, DATA);


CREATE INDEX idx_data ON contas_contabeis_1T2024 (DATA);

CREATE INDEX idx_saldo_inicial ON contas_contabeis_1T2024(VL_SALDO_INICIAL);
CREATE INDEX idx_saldo_final ON contas_contabeis_1T2024(VL_SALDO_FINAL);

CREATE INDEX idx_cd_conta_contabil ON contas_contabeis_1T2024 (CD_CONTA_CONTABIL);

CREATE INDEX idx_reg_ans_data ON contas_contabeis_1T2024 (REG_ANS, DATA);

CREATE INDEX idx_data ON contas_contabeis_2T2024 (DATA);

CREATE INDEX idx_saldo_inicial ON contas_contabeis_2T2024(VL_SALDO_INICIAL);
CREATE INDEX idx_saldo_final ON contas_contabeis_2T2024(VL_SALDO_FINAL);

CREATE INDEX idx_cd_conta_contabil ON contas_contabeis_2T2024 (CD_CONTA_CONTABIL);

CREATE INDEX idx_reg_ans_data ON contas_contabeis_2T2024 (REG_ANS, DATA);

CREATE INDEX idx_data ON contas_contabeis_3T2024 (DATA);

CREATE INDEX idx_saldo_inicial ON contas_contabeis_3T2024(VL_SALDO_INICIAL);
CREATE INDEX idx_saldo_final ON contas_contabeis_3T2024(VL_SALDO_FINAL);

CREATE INDEX idx_cd_conta_contabil ON contas_contabeis_3T2024 (CD_CONTA_CONTABIL);

CREATE INDEX idx_reg_ans_data ON contas_contabeis_3T2024 (REG_ANS, DATA);

CREATE INDEX idx_data ON contas_contabeis_4T2024 (DATA);

CREATE INDEX idx_saldo_inicial ON contas_contabeis_4T2024(VL_SALDO_INICIAL);
CREATE INDEX idx_saldo_final ON contas_contabeis_4T2024(VL_SALDO_FINAL);

CREATE INDEX idx_cd_conta_contabil ON contas_contabeis_4T2024 (CD_CONTA_CONTABIL);

CREATE INDEX idx_reg_ans_data ON contas_contabeis_4T2024 (REG_ANS, DATA);

-- primeira consulta
SELECT 
    REG_ANS, 
    CD_CONTA_CONTABIL, 
    DESCRICAO, 
    DATA, 
    VL_SALDO_INICIAL, 
    VL_SALDO_FINAL, 
    (VL_SALDO_INICIAL - VL_SALDO_FINAL) AS DESPESA
FROM contas_contabeis_4T2024
WHERE DESCRICAO LIKE '%EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS%'
ORDER BY DESPESA DESC
LIMIT 10;


-- segunda consulta

SELECT * FROM (
    SELECT 
        '1T2024' AS Trimestre, 
        REG_ANS, 
        CD_CONTA_CONTABIL, 
        DESCRICAO, 
        DATA, 
        VL_SALDO_INICIAL, 
        VL_SALDO_FINAL, 
        (VL_SALDO_INICIAL - VL_SALDO_FINAL) AS DESPESA
    FROM contas_contabeis_1T2024
    WHERE DESCRICAO LIKE '%EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS%'

    UNION ALL

    SELECT 
        '2T2024' AS Trimestre, 
        REG_ANS, 
        CD_CONTA_CONTABIL, 
        DESCRICAO, 
        DATA, 
        VL_SALDO_INICIAL, 
        VL_SALDO_FINAL, 
        (VL_SALDO_INICIAL - VL_SALDO_FINAL) AS DESPESA
    FROM contas_contabeis_2T2024
    WHERE DESCRICAO LIKE '%EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS%'

    UNION ALL

    SELECT 
        '3T2024' AS Trimestre, 
        REG_ANS, 
        CD_CONTA_CONTABIL, 
        DESCRICAO, 
        DATA, 
        VL_SALDO_INICIAL, 
        VL_SALDO_FINAL, 
        (VL_SALDO_INICIAL - VL_SALDO_FINAL) AS DESPESA
    FROM contas_contabeis_3T2024
    WHERE DESCRICAO LIKE '%EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS%'

    UNION ALL

    SELECT 
        '4T2024' AS Trimestre, 
        REG_ANS, 
        CD_CONTA_CONTABIL, 
        DESCRICAO, 
        DATA, 
        VL_SALDO_INICIAL, 
        VL_SALDO_FINAL, 
        (VL_SALDO_INICIAL - VL_SALDO_FINAL) AS DESPESA
    FROM contas_contabeis_4T2024
    WHERE DESCRICAO LIKE '%EVENTOS/ SINISTROS CONHECIDOS OU AVISADOS%'
) AS todas_as_despesas
ORDER BY DESPESA DESC
LIMIT 10;




