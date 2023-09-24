{{ config(
    materialized='incremental',
    unique_key='date'
) }}

with incremental_data as (
    select
        raw.date as date,
        max(raw.high) as daily_high,
        min(raw.low) as daily_low,
        sum(raw.volume) as total_volume
    from
        {{ ref('raw_stock_data') }} as raw
    left join
        {{ ref('daily_aggregations') }} as existing
    on
        raw.date = existing.date
    where
        existing.date is null  -- Only select rows that do not exist in the target table
    group by
        raw.date
)

select * from incremental_data
