with source as (
    select * from {{ source('ads_data', 'src_ads_creative_facebook_all_data') }}
)

, staged as (
    select
        date
      , add_to_cart
      , clicks
      , comments
      , (COALESCE(clicks, 0) + COALESCE(likes, 0) + COALESCE(comments, 0) + COALESCE(shares, 0) + COALESCE(views, 0)) AS engagements
      , impressions
      , mobile_app_install
      , likes
      , NULL AS link_clicks
      , purchase_value as purchase_value
      , complete_registration as registrations
      , NULL AS revenue
      , shares
      , spend
      , COALESCE(purchase, 0) AS total_conversions
      , views as video_views
      , ad_id
      , adset_id
      , campaign_id
      , channel
      , creative_id
    from source 
)

select * from staged