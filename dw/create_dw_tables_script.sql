-- Creates the tables needed in the DW schema

-- DROP'S

-- DIMENSIONS
DROP TABLE IF EXISTS [dwProdutividade].[DIM_PROJETO];
DROP TABLE IF EXISTS [dwProdutividade].[DIM_ESTADO];
DROP TABLE IF EXISTS [dwProdutividade].[DIM_CALENDARIO];
DROP TABLE IF EXISTS [dwProdutividade].[DIM_TAREFA];
DROP TABLE IF EXISTS [dwProdutividade].[DIM_FUNCIONARIO];
DROP TABLE IF EXISTS [dwProdutividade].[DIM_PERFIL];
DROP TABLE IF EXISTS [dwProdutividade].[DIM_CLASSIFICACAO_PRODUTIVIDADE];

-- FACTS
DROP TABLE IF EXISTS [dwProdutividade].[FACTO_PROJETO];
DROP TABLE IF EXISTS [dwProdutividade].[FACTO_TAREFA];

-- CREATE'S

-- DIMENSIONS
CREATE TABLE [dwProdutividade].[DIM_PROJETO](
	[ID_Projeto] [int] NOT NULL PRIMARY KEY,
	[Codigo_Projeto] [nvarchar](50) NOT NULL,
	[Nome_Projeto] [nvarchar](70) NOT NULL,
	[Departamento] [nvarchar](200) NOT NULL,
	[Area] [nvarchar](200) NOT NULL,
	[Horas_Previstas_Projeto] [int] NOT NULL
);

CREATE TABLE [dwProdutividade].[DIM_ESTADO](
	[ID_Estado] [int] NOT NULL PRIMARY KEY,
	[Estado] [nvarchar](200) NOT NULL
);

CREATE TABLE [dwProdutividade].[DIM_CALENDARIO](
	[ID_Calendario] [int] NOT NULL PRIMARY KEY, 	-- ID in this format: 202001
	[Mes] [int] NOT NULL, 							-- 1
	[Mes_Abrev] [nvarchar](5) NOT NULL, 			-- Jan
	[Mes_Extenso] [nvarchar](15) NOT NULL, 			-- Janeiro
    [Ano] [int] NOT NULL, 							-- 2020
	[Ano_Mes_Num] [nvarchar](10) NOT NULL, 			-- 2020-01
	[Mes_Abrev_E_Ano] [nvarchar](15) NOT NULL, 		-- Jan 2020
	[Mes_Extenso_E_Ano] [nvarchar](20) NOT NULL, 	-- Janeiro 2020
	[Trimestre_Num] [int] NOT NULL, 				-- 1
	[Trimestre] [nvarchar](30) NOT NULL 			-- 2020 Trimestre 1
);

CREATE TABLE [dwProdutividade].[DIM_TAREFA](
	[ID_Tarefa] [int] NOT NULL PRIMARY KEY,
	[Nome_Tarefa] [nvarchar](50) NOT NULL,
	[Projeto_Funcionario_Horas] [nvarchar](100) NOT NULL,
	[Horas_Previstas_Tarefa] [int] NOT NULL
);

CREATE TABLE [dwProdutividade].[DIM_PERFIL](
	[ID_Perfil] [int] NOT NULL PRIMARY KEY,
	[Nome_Perfil] [nvarchar](50) NOT NULL, 		-- 1 - Administrador
	[Num_Perfil] [int] NOT NULL,            	-- 1
	[Posicao_Perfil] [nvarchar](30) NOT NULL	-- Administrador
);

CREATE TABLE [dwProdutividade].[DIM_FUNCIONARIO](
	[ID_Funcionario] [int] NOT NULL PRIMARY KEY,
	[Nome_Funcionario] [nvarchar](50) NOT NULL  --USERNAME
);



CREATE TABLE [dwProdutividade].[DIM_CLASSIFICACAO_PRODUTIVIDADE](
	[ID_Classificacao_Produtividade] [int] NOT NULL PRIMARY KEY,
	[Intervalo] [nvarchar](20) NOT NULL,
	[Descricao] [nvarchar](50) NOT NULL,
	[Nota] [int] NOT NULL
);
/*
[0%, 100%[ - 5
100% - 4
]100%, 125%] - 3
]125%, 150%] - 2
]150%, 175%] - 1
]175%, +∞] - 0
*/


-- FACTS

CREATE TABLE [dwProdutividade].[FACTO_PROJETO](
	[ID] [int] NOT NULL PRIMARY KEY,
	[Avanco_Projeto] [numeric](18, 2) NOT NULL,
	[Horas_Realizadas_Projeto] [int] NOT NULL,
	[Horas_Previstas_Mes_Por_Avanco] [numeric](18, 2) NOT NULL,
	[ID_Estado] [int] NOT NULL,
	[ID_Projeto] [int] NOT NULL,
	[ID_Calendario] [int] NOT NULL,
	[ID_Classificacao_Produtividade_Projeto] [int] NOT NULL
);

CREATE TABLE [dwProdutividade].[FACTO_TAREFA](
	[ID] [int] NOT NULL PRIMARY KEY,
	[Horas_Realizadas_Tarefa] [int] NOT NULL,
	[ID_Projeto] [int] NOT NULL,
	[ID_Calendario] [int] NOT NULL,
	[ID_Tarefa] [int] NOT NULL,
	[ID_Funcionario] [int] NOT NULL,
	[ID_Perfil] [int] NOT NULL,
	[ID_Classificacao_Produtividade_Tarefa] [int] NOT NULL
);

/* Foreign keys are not needed, because it is a controlled environment and the definition of foreign keys would affect performance
In Star Schema, dimensions are seen as filters
Anyway, I decided to leave it in a comment in case it is necessary for error detection

-- PROJECT FOREIGN KEYS
-- Estado
GO
ALTER TABLE [dwProdutividade].[FACTO_PROJETO] 
ADD CONSTRAINT [FK_FACTO_PROJETO_DIM_ESTADO] FOREIGN KEY ([FK_ESTADO_PROJETO])
REFERENCES [dwProdutividade].[DIM_ESTADO]([ID_Estado])

-- Projeto
GO
ALTER TABLE [dwProdutividade].[FACTO_PROJETO]
ADD CONSTRAINT [FK_FACTO_PROJETO_DIM_PROJETO] FOREIGN KEY ([FK_PROJETO_PROJETO])
REFERENCES [dwProdutividade].[DIM_PROJETO]([ID_Projeto])

-- Calendario
GO
ALTER TABLE [dwProdutividade].[FACTO_PROJETO]
ADD CONSTRAINT [FK_FACTO_PROJETO_DIM_CALENDARIO] FOREIGN KEY ([FK_CALENDARIO_PROJETO])
REFERENCES [dwProdutividade].[DIM_CALENDARIO]([ID_Calendario])

-- Classificação Produtividade
GO
ALTER TABLE [dwProdutividade].[FACTO_PROJETO]
ADD CONSTRAINT [FK_FACTO_PROJETO_DIM_CLASSIFICACAO_PRODUTIVIDADE FOREIGN KEY ([FK_CLASSIFICACAO_PRODUTIVIDADE_PROJETO])
REFERENCES [dwProdutividade].[DIM_CLASSIFICACAO_PRODUTIVIDADE]([ID_Classificacao_Produtividade])


-- TASK FOREIGN KEYS
-- Projeto
GO
ALTER TABLE [dwProdutividade].[FACTO_TAREFA]
ADD CONSTRAINT [FK_FACTO_TAREFA_DIM_PROJETO] FOREIGN KEY ([FK_PROJETO_TAREFA])
REFERENCES [dwProdutividade].[DIM_PROJETO]([ID_Projeto])

-- Calendario
GO
ALTER TABLE [dwProdutividade].[FACTO_TAREFA]
ADD CONSTRAINT [FK_FACTO_TAREFA_DIM_CALENDARIO] FOREIGN KEY ([FK_CALENDARIO_TAREFA])
REFERENCES [dwProdutividade].[DIM_CALENDARIO]([ID_Calendario])

-- Tarefa
GO
ALTER TABLE [dwProdutividade].[FACTO_TAREFA]
ADD CONSTRAINT [FK_FACTO_TAREFA_DIM_TAREFA] FOREIGN KEY ([FK_TAREFA_TAREFA])
REFERENCES [dwProdutividade].[DIM_TAREFA] ([ID_Tarefa])

-- Perfil
GO
ALTER TABLE [dwProdutividade].[FACTO_PERFIL]
ADD CONSTRAINT [FK_FACTO_TAREFA_DIM_PERFIL] FOREIGN KEY ([FK_TAREFA_PERFIL])
REFERENCES [dwProdutividade].[DIM_Perfil] ([ID_Perfil])

-- Funcionario
GO
ALTER TABLE [dwProdutividade].[FACTO_TAREFA]
ADD CONSTRAINT [FK_FACTO_TAREFA_DIM_FUNCIONARIO] FOREIGN KEY ([FK_FUNCIONARIO_TAREFA])
REFERENCES [dwProdutividade].[DIM_FUNCIONARIO]([ID_Funcionario])

-- Classificação Produtividade
GO
ALTER TABLE [dwProdutividade].[FACTO_TAREFA]
ADD CONSTRAINT [FK_FACTO_TAREFA_DIM_CLASSIFICACAO_PRODUTIVIDADE] FOREIGN KEY ([FK_CLASSIFICACAO_PRODUTIVIDADE_TAREFA])
REFERENCES [dwProdutividade].[DIM_CLASSIFICACAO_PRODUTIVIDADE]([ID_Classificacao_Produtividade])

*/