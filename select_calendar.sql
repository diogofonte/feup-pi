with
    Dates
    as
    (
        SELECT
            distinct
            format( DATEADD(dd, num, 'Dec 31, 2014') , 'yyyyMM') MonthYear
        FROM dbo.sequence
    )
select
    left(d.MonthYear,4) as [year]
  , right(d.MonthYear,2) as [month]
  , (o.Custo * o.NHoras) / count(*) over (partition by o.ID) as vltotal
  , count(*) over (partition by o.ID) as numMeses
  , o.*
from TBL_ORCAMENTO o
left join dates d on d.MonthYear between format(o.DataInicio,'yyyyMM') and format(o.DataFim,'yyyyMM');