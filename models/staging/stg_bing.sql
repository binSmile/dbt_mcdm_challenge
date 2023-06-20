with source as (
    select * from {{ source('ads_data', 'src_ads_bing_all_data') }}
)

, staged as (
    select
        date
      , NULL AS add_to_cart
      , clicks
      , NULL AS comments
      , NULL AS engagements
      , imps as impressions
      , NULL AS installs
      , NULL AS likes
      , NULL AS link_clicks
      , NULL AS purchase
      , NULL AS registrations
      , revenue
      , NULL AS shares
      , spend
      , conv as total_conversions
      , NULL AS video_views
      , ad_id
      , adset_id
      , campaign_id
      , channel
      , NULL AS creative_id


    from source
)

select * from staged