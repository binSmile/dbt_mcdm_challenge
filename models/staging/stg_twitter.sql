with source as (
    select * from {{ source('ads_data', 'src_promoted_tweets_twitter_all_data') }}
)

, staged as (
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
    from source
)

select * from staged