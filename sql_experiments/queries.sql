select P.[CodigoProjeto], [Departamento], [Area], sum(H.[NHoras]) as [HorasPrevistas]
from [stg].[EXT_TBL_PROJETOS] as P join [stg].[EXT_TBL_HORASPREVISTAS] as H
on P.[CodigoProjeto] = H.[CodigoProjeto]
group by P.[CodigoProjeto], [Departamento],[Area]
--order by P.[CodigoProjeto] ASC
/*
select TOP(100) * 
from [stg].[EXT_TBL_HORASPREVISTAS] as H join [stg].[EXT_TBL_IMPUTACAO_DETALHE] as I
on H.[ID] = I.[FK_TarefaID]*/
/*
select [CodigoProjeto],sum([NHoras])
from [stg].[EXT_TBL_HORASPREVISTAS]
group by [CodigoProjeto]*/

/*SELECT TOP (1000) [IDAvanco]
      ,[CodigoProjecto]
      ,[DataAvanco]
      ,H.[Avanco]
      ,[HorasAtual]
FROM [stg].[EXT_TBL_HISTORICO_AVANCOS] as H join [stg].[EXT_TBL_PROJETOS] AS P
on [CodigoProjecto] = [CodigoProjeto]
--GROUP BY [CodigoProjecto]
ORDER BY [DataAvanco]*/

/*select [CodigoProjeto], [Username], [Ano], [Mes], [FK_TarefaID], sum([NHoras]) as horas_realizadas
from [stg].[EXT_TBL_IMPUTACAO_DETALHE]
group by [CodigoProjeto], [Username], [Ano], [Mes], [FK_TarefaID]*/

SELECT TOP (1000) [ID]
      ,[CodigoProjeto]
      ,[Username]
      ,[Tarefa]
      ,[DataInicio]
      ,[DataFim]
      ,[NHoras]
      ,[Custo]
      ,[Perc]
      ,[Fase]
      ,[VendaHora]
      ,[OrcamentoID]
  FROM [stg].[EXT_TBL_HORASPREVISTAS]
  where [CodigoProjeto] = 'ACSS.2011.019' and [Username] = 'utilizador.417'