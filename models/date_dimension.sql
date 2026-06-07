WITH CTE AS (
    SELECT STARTED_AT FROM {{source('demo','bike')}}
)

select * from CTE;