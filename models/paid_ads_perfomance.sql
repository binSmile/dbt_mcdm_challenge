with tiktok_t as (

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
    from dbt_vshkoldin.src_ads_tiktok_ads_all_data
)

, facebook_t as (
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
      , (
        -- COALESCE(add_to_cart, 0)
    -- + COALESCE(mobile_app_install, 0)
    -- + COALESCE(inline_link_clicks, 0)
    + COALESCE(purchase, 0)
    -- + COALESCE(complete_registration, 0)
    -- + COALESCE(clicks, 0)
    -- + COALESCE(comments, 0)
    -- + COALESCE(likes, 0)
    -- + COALESCE(shares, 0)
    ) AS total_conversions
    
      , views as video_views
      , ad_id
      , adset_id
      , campaign_id
      , channel
      , creative_id
    from dbt_vshkoldin.src_ads_creative_facebook_all_data 
)

, twitter_t as (
    select
        date
      , NULL AS add_to_cart
      , clicks
      , comments
      , engagements
      , impressions
      , NULL AS installs
      , likes
      , url_clicks as link_clicks
      , NULL AS purchase
      , NULL AS registrations
      , NULL AS revenue
      , retweets as shares
      , spend
      , NULL AS total_conversions
      , video_total_views as video_views
      , NULL AS ad_id
      , NULL AS adset_id
      , campaign_id
      , channel
      , NULL AS creative_id
    from dbt_vshkoldin.src_promoted_tweets_twitter_all_data
)

, bing_t as (
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


    from dbt_vshkoldin.src_ads_bing_all_data
)


, final as (
    select * from tiktok_t
    union all
    select * from facebook_t
    union all
    select * from twitter_t
    union all
    select * from bing_t
)


select *
   
 from final

