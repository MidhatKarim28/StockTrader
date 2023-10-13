{% snapshot servicenow_actual_sys_user_group_stg %}

config {
  target_schema: 'staging',
  strategy: 'check',
  unique_key: 'sys_id_value',
  check_cols: [],
  post_hook: [],
  tags: ['servicenow']
}

SELECT *
FROM {{ source('dbt_midhatkarim28', 'servicenow_actual_sys_user_group_lnd') }}

{% endsnapshot %}
