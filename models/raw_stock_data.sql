-- stock_prices/models/raw_stock_data.sql
{{ config(
    materialized='table',
    unique_key='date, symbol'
) }}

with raw_data as (
    select
        "date",
        symbol,
        "open",
        high,
        low,
        "close",
        volume
    from
        {{ ref('stock_data') }}
)

select * from raw_data
