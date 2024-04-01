Create database funçoesAgregadas
use funçoesAgregadas

drop database funçoesAgregadas
use master

create table peça(
CodPeca varchar(20) primary key,
NomePeca varchar(25),
CorPeca varchar(25),
PesoPeca int ,
CidadePeca varchar(25)
)

create table Fornec(
CodFornec varchar(2) primary key,
NomeFornec varchar(25),
StatusFornec int,
CidadeFornec varchar(25)

)

create table Embarq (
CodPeca varchar(3),
CodFornecedor varchar(2),
QtdeEmbarc int ,
Foreign key(CodPeca) references peça (CodPeca),
Foreign key(CodFornecedor) references Fornec (CodFornec)
)


-- Selects---
Insert into peça(CodPeca, NomePeca, CorPeca,PesoPeca,CidadePeca) 
values ('P1','Eixo','Cinza',10,'Poa');

Insert into peça(CodPeca, NomePeca, CorPeca,PesoPeca,CidadePeca) 
values ('P2','Rolamento','Preto',16,'Rio');

Insert into peça(CodPeca, NomePeca, CorPeca,PesoPeca,CidadePeca) 
values ('P3','Mancal','Verde',30,'São Paulo');


Insert into Fornec (CodFornec, NomeFornec,StatusFornec,CidadeFornec) 
values ('F1','Silva',5,'São Paulo');

Insert into Fornec (CodFornec, NomeFornec,StatusFornec,CidadeFornec) 
values ('F2','Souza',10,'Rio');

Insert into Fornec (CodFornec, NomeFornec,StatusFornec,CidadeFornec) 
values ('F3','Alvarez',5,'São Paulo');

Insert into Fornec (CodFornec, NomeFornec,StatusFornec,CidadeFornec) 
values ('F4','Tavarez',8,'Rio');


insert into Embarq(CodPeca, CodFornecedor,QtdeEmbarc)
values('P1', 'F1',300);


insert into Embarq(CodPeca, CodFornecedor,QtdeEmbarc)
values('P1', 'F2',400);


insert into Embarq(CodPeca, CodFornecedor,QtdeEmbarc)
values('P1', 'F3',200);


insert into Embarq(CodPeca, CodFornecedor,QtdeEmbarc)
values('P2', 'F1',300);

insert into Embarq(CodPeca, CodFornecedor,QtdeEmbarc)
values('P2', 'F4',350);


select*from peça;
select*from Embarq;
select*from Fornec;
delimiter //
Create Procedure sp_produto(
IN sp_CodPeca varchar(20),
IN sp_NomePeca varchar(25),
IN sp_CorPeca varchar(25),
IN sp_PesoPeca int ,
IN sp_CidadePeca varchar(25)
)
begin
Insert into peça (CodPeca, NomePeca, CorPeca,PesoPeca,CidadePeca)
Values (sp_CodPeca, sp_NomePeca, sp_CorPeca,sp_PesoPeca,sp_CidadePeca);
end//
delimiter ;
call sp_produto  ('P4','Eixo','preto',12,'Poa');
select CodPeca, NomePeca, CorPeca, PesoPeca, CidadePeca  from peça


DROP PROCEDURE IF EXISTS Inserir_5000_pecas;

DELIMITER //

CREATE PROCEDURE Inserir_5000_pecas()
BEGIN
    DECLARE i INT DEFAULT 5; -- Ajuste o valor inicial conforme necessário
    WHILE i <= 5000 DO
        INSERT INTO peça (CodPeca, NomePeca, CorPeca, PesoPeca, CidadePeca) 
        VALUES (CONCAT('P', i), CONCAT('Eixo', i), CONCAT('Azul', i), RAND() * 100, 'São Paulo');
        SET i = i + 1;
    END WHILE;
END//

DELIMITER ;

CALL Inserir_5000_pecas();
 
select*from peça




