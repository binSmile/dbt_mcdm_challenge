with source as (
    select * from {{ source('ads_data', 'src_ads_tiktok_ads_all_data') }}
)

, staged as (
    select 
        date
      , add_to_cart
      , clicks
      , NULL AS comments
      , NULL AS engagements
      , impressions
      , rt_installs as installs
      , NULL AS likes
      , NULL AS link_clicks
      , purchase
      , registrations
      , NULL AS revenue
      , NULL AS shares
      , spend
      , conversions as total_conversions
      , video_views
      , NULL AS ad_id
      , NULL AS adset_id
      , campaign_id
      , channel
      , NULL AS creative_id
    from source
)

select * from staged