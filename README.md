# Amazon Vine Analysis
Module 16 - AWS

## Overview of Analysis

I analyzed the pet product reviews from Amazon to determine if the paid reviews by Vine clients were biased towards 5-star reviews. I set up a database an RDS database on Amazon Web Services. I imported the pet products dataset into a DataFrame in Colab. In Colab I performed transformations on the DataFrame to create four new DataFrames. These four DataFrames were then exported to pgAdmin. In SQL I filtered out reviews with less than 20 total votes and then again filtered to only see reviews with half of their total votes were helpful votes. I created new tables to separate out paid and unpaid reviews. I then summarized the paid and unpaid and created a summary table to bring the summaries together.

Used dataset: 
https://s3.amazonaws.com/amazon-reviews-pds/tsv/amazon_reviews_us_Pet_Products_v1_00.tsv.gz

## Results
The summary results do not show any biased toward 5-star reviews from paid Vine reviews.

![PdVsUnPaid](https://user-images.githubusercontent.com/95837693/163699373-cfc6a50e-ac9e-423c-8418-01cbb078d554.PNG)

* Looking at reviews with at least 20 total votes & 50% of their votes classified as "helpful", the number of reviews in our analysis was:
	** 170 paid reviews
	** 37,840 unpaid reviews

* Looking at the same set of reviews, the number of 5-star reviews was:
	** 65 paid 5-star reviews
	** 20,612 unpaid 5-star reviews

* The unpaid reviews showed a higher percentage of 5-star reviews:
	** 38.24% of paid reviews were 5-star reviews
	** 54.47% of unpaid reviews were 5-star reviews

## Summary

Based on the considerably higher percentage of 5-star reviews in the unpaid review set, I conclude that there is no positivity bias in the reviews in the Vine program. To further this analysis, I would look at the other side of the reviews to see if there is any negative bias from the Vine program reviews.
