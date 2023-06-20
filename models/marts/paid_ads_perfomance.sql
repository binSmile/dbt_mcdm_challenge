
with tiktok as (
    select * from {{ ref ('stg_tiktok') }}
),

facebook as (
    select * from {{ ref ('stg_facebook') }}
),

twitter as (
    select * from {{ ref ('stg_twitter') }}
),

bing as (
    select * from {{ ref ('stg_bing') }}
)

, final as (
    select * from tiktok
    union all
    select * from facebook
    union all
    select * from twitter
    union all
    select * from bing
)


select *
   
 from final

