-- Creates the tables needed to copy the data as is from the schema dbo to the schema stg

-- DROP'S

DROP TABLE IF EXISTS [stg].[EXT_TBL_HISTORICO_AVANCOS];
DROP TABLE IF EXISTS [stg].[EXT_TBL_PROJETOS];
DROP TABLE IF EXISTS [stg].[EXT_TBL_ORCAMENTO];
DROP TABLE IF EXISTS [stg].[EXT_TBL_IMPUTACAO_DETALHE];
DROP TABLE IF EXISTS [stg].[EXT_TBL_HORASPREVISTAS];

-- CREATE'S

CREATE TABLE [stg].[EXT_TBL_PROJETOS](
	[CodigoProjeto] [nvarchar](50) NOT NULL,
	[Descricao] [nvarchar](200) NOT NULL,
	[Gestor] [nvarchar](50) NULL,
	[KM] [nvarchar](1) NULL,
	[ID_SP] [int] NULL,
	[Estado] [nvarchar](50) NULL,
	[Departamento] [nvarchar](200) NULL,
	[Area] [nvarchar](200) NULL,
	[DataAdjudicacao] [datetime] NULL,
	[DataInicio] [datetime] NULL,
	[DataFim] [datetime] NULL,
	[InicioGarantia] [datetime] NULL,
	[DataFecho] [datetime] NULL,
	[Valor] [numeric](18, 2) NULL,
	[MargemPrevista] [numeric](18, 2) NULL,
	[Avanco] [numeric](18, 2) NULL,
	[TipoProjeto] [nvarchar](200) NULL,
	[ID_Cliente] [int] NULL,
	[ID_Empresa] [int] NULL,
	[PaisFaturacao] [nvarchar](50) NULL,
	[CentroCusto] [nvarchar](50) NULL,
	[TipoFaturacao] [nvarchar](60) NULL,
	[OrcamentoBloqueado] [bit] NULL,
	[OrcamentoBloqueadoUser] [varchar](50) NULL,
	[OrcamentoBloqueadoDate] [datetime] NULL,
	[Ambito] [varchar](255) NULL
);

CREATE TABLE [stg].[EXT_TBL_HISTORICO_AVANCOS](
	[IDAvanco] [bigint] IDENTITY(1,1) NOT NULL,
	[CodigoProjecto] [nvarchar](50) NOT NULL,
	[DataAvanco] [datetime] NOT NULL,
	[Avanco] [numeric](18, 2) NOT NULL,
	[HorasAtual] [numeric](18, 2) NOT NULL,
	[CustoRHAtual] [numeric](18, 2) NOT NULL,
	[TotalDespesasAtual] [numeric](18, 2) NOT NULL,
	[MargemAtual] [numeric](18, 2) NOT NULL,
	[CustoEstimado] [numeric](18, 2) NOT NULL,
	[MargemPrevista] [numeric](18, 2) NOT NULL,
	[MargemPrevistaPercentagem] [numeric](18, 2) NOT NULL,
	[Observacoes] [text] NULL
);

CREATE TABLE [stg].[EXT_TBL_ORCAMENTO](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CodigoProjeto] [nvarchar](50) NOT NULL,
	[Tarefa] [nvarchar](500) NULL,
	[DataInicio] [datetime] NULL,
	[DataFim] [datetime] NULL,
	[NHoras] [numeric](18, 2) NULL,
	[Custo] [numeric](18, 2) NULL,
	[Perc] [numeric](18, 2) NULL,
	[Fase] [nvarchar](50) NULL,
	[VendaHora] [numeric](18, 2) NULL,
	[Perfil] [varchar](150) NULL,
	[CustoObservacoes] [nvarchar](500) NULL,
	[Observacoes] [nvarchar](200) NULL,
	[UpdatedBy] [nvarchar](50) NULL
);

CREATE TABLE [stg].[EXT_TBL_IMPUTACAO_DETALHE](
	[ID_Imputacao] [int] IDENTITY(1,1) NOT NULL,
	[ID_SP] [int] NULL,
	[CodigoProjeto] [nvarchar](50) NOT NULL,
	[Username] [nvarchar](50) NOT NULL,
	[Ano] [int] NOT NULL,
	[Mes] [int] NOT NULL,
	[DataInicio] [datetime] NOT NULL,
	[DataFim] [datetime] NOT NULL,
	[NHoras] [numeric](18, 2) NULL,
	[CustoTotalHoras] [numeric](18, 2) NULL,
	[CustoUnitarioHoras] [numeric](18, 2) NULL,
	[FK_TarefaID] [int] NULL,
	[ApprovalStatus] [bit] NULL,
	[Approved] [bit] NULL,
	[Aprovador] [nvarchar](50) NULL,
	[Despachos] [text] NULL,
	[Observacoes] [text] NULL,
	[fAllDayEvent] [bit] NULL,
	[TipoAusencia] [nvarchar](50) NULL,
	[TipoAusenciaOutros] [nvarchar](50) NULL,
	[NHorasVenda] [numeric](18, 2) NULL,
	[CustoUnitarioHorasVenda] [numeric](18, 2) NULL,
	[CustoTotalHorasVenda] [numeric](18, 2) NULL,
	[NotasHorasVenda] [text] NULL,
	[PeopleHubID] [int] NULL
);

CREATE TABLE [stg].[EXT_TBL_HORASPREVISTAS](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CodigoProjeto] [nvarchar](50) NOT NULL,
	[Username] [nvarchar](50) NULL,
	[Tarefa] [nvarchar](500) NULL,
	[DataInicio] [datetime] NULL,
	[DataFim] [datetime] NULL,
	[NHoras] [numeric](18, 2) NULL,
	[Custo] [numeric](18, 2) NULL,
	[Perc] [numeric](18, 2) NULL,
	[Fase] [nvarchar](50) NULL,
	[VendaHora] [numeric](18, 2) NULL,
	[OrcamentoID] [int] NULL
);
