-- stock_prices/models/daily_aggregations.sql
{{ config(
    materialized='table',
    unique_key='date'
) }}

with daily_data as (
    select
        date,
        max(high) as daily_high,
        min(low) as daily_low,
        sum(volume) as total_volume
    from
        {{ ref('raw_stock_data') }}
    group by
        date
)

select * from daily_data
