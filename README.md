# Marketing common data modelling challenge
	Welcome to Marketing common data modelling challenge!

# Brief Instructions for Adding Data from New Ad Platforms into this MCDM

1. Set up a new source
	- You can either add a table to an existing database or establish a new connection to dbt.
2. Create a new staging file similar to the ones in /models/staging/*.sql
	- Your staged CTE (Common Table Expression) must include the following fields in the same order and with the same names. If you don't have any of them, assign NULL to those fields.
	- The list of fields:
    ``` date, add_to_cart, clicks, comments, engagements, impressions, installs, likes, link_clicks, purchase, registrations, revenue, shares, spend, total_conversions, video_views, ad_id, adset_id, campaign_id, channel, creative_id ```

3. Union the new platform to the model file (models/marts/paid_ads_performance.sql) by using a UNION statement.

4. Please make sure to carefully follow these steps to ensure that the data is integrated correctly into the common data model.