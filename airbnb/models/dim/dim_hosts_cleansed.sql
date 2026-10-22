{{
    config(
        materialized='table',
    )
}}

WITH src_hosts as(
    SELECT 
        * 
    FROM {{ref('src_hosts')}}
)

SELECT 
    host_id,
    NVL(host_name,'Anonymous') AS host_name,
    -- IFF(is_superhost = 't', TRUE, FALSE) AS is_superhost,
    is_superhost,
    created_at,
    updated_at
FROM
    src_hosts