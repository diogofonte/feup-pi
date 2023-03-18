--test
-- join data from PROJETOS com ORÇAMENTO
select * from [dbo].[TBL_PROJETOS] as A, [dbo].[TBL_ORCAMENTO] as B where A.[CodigoProjeto] = B.[CodigoProjeto] 