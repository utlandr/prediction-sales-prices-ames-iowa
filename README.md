# ENGSCI 762 Kaggle Assignment: Prediction Sales Prices
## Reed Bell | rbel068 | rbel068@aucklanduni.ac.nz

### I. Frame the problem and look a the big picture

#### Kaggle Overview Summary (from [here][1])
This is a data science project that aims to apply the conventional 'Data Science Process' to a dataset. I this case, the dataset consists of 79 explanatory variables detailing resendential homes. Through the data science process, we hope to implement a machine learning algorithm to this dataset to predict the final price of the home.

**Objective**

Accurately predict the final house price of residential properties located in Ames, Iowa. This includes observing and making use (where applicable) of the 79 explanatory variables that is available to us.

**How will the solution be used?**

The solution model can provide a fast and useful method of predicitng sales price from a variety of explanatory variables. The solution model will be used on a test dataset to determine performance. 



**What the current solutions/workarounds?**

There exist many current methods of prediction house sale price. Traditionally, evaluations are done through real estate agencies. A realtor will use their prior knowledge and experience of the local housing market to determine the sale price. Similar to a machine learning model, a realtor will consider several important variables, but will also [account for less quantifiable factors][3] (such as how the buyers feel/taking advantage of reasons they want to buy a house). Within the Kaggle competition, there are some results already submitted. See the [submitted kernals.][2]

**How should this problem be framed?**

Because labels are supplied to us in testing. We will apply a *supervised learning model*. Alternatively, we can use batch learning to update and improve our prediction the more info we gather (which can extend to future prediction on other datasets). We can also possibly use traditional regression models to find simple relationships between the sale price and some of the explanatory variables.


**How should performance be measured?**

Accuracy comes in the form of Root Mean Square Error (RSME) between the logarithm of the predicted value and the logarithm of the observed sales price:

$$RSME = \sqrt{\frac{\sum_{i=0}^N{(z_{f_{i}} - z_{o_{i}})^2}}{N}}$$


Where:

$z_{f_{i}}$ - Forcasted (predicted) sale price of house $i$ 

$z_{o_{i}}$ - Observed (actual) sale price of house $i$

$N$ - Total number of houses evaluated

**Is the performance measure aligned with the business objective?**

The RSME performance measure allows us to observe how well the model predicts on the entire dataset. This is in line with the objective of accurately prediction sales prices in Ames, Iowa as we can observe (on average) how much the solution model 'misses' the actual sales price. RSME is also an effective performance measure during training (as it is something we want to minimise).


**What would the minimum performance neede to reach the business objective?**

In this event 'accurate prediction' is subject to personal opinion. I consider an accurate solution model to be one that can outperform Kaggle's Sample Submission Benchmark which has an error of 0.40890. 

**What are comparable problem? Can you reuse experience or tools?**

The Boston Housing dataset is also a popular dataset that has been used in the past to predict housing prices. Consisting of 503 observations of 13 feature variables, a similar approach could be used for both datasets. [This blog][4] performs data analysis on the Boston Dataset and recommends some important Python modules to use for data analysis/exploration 
(`seaborn`, `pandas` and `scikit-learn`). The white paper for the dataset is also [available][7] to attain key information about housing in the Ames, Iowa region.

**Is human expertise available?**

For data analytics specific to this problem, many topics and problems are discussed in the [Kaggle Forums][5]. Weekly labs were also run with Dr Andreas Kempa-Liehr discussing the Data Science approace to problems. In regards to professional advice around housing markets, there are several blogs available discussing how realtors go about setting selling prices. These are blogs are especially interesting for highlighting factors that are not easy to quantify such as the buyer/seller mood and urgency:

- [How to determine a listings sales price by Henry Cambell][3]
- [Listing Your House: What List Price Should You Set? by Ilona Bray][6]


**How would the problem be solved manually?**

Realtors (in the US at least) have their own database that they use to check on the local housing market. The Multiple Listing Service (MLS) is kept by all real-estate agencies and tracks homes that have been sold, bought or are listed. Real estate agents can observe the activity happening within the neighborhood/suburb/city to get an idea of macro-economic trends. It is also the job of the realtor to consider the house itself and valuate amenities, architecture or build quality. 

**List of assumptions**

- We are assuming that the dataset is representative of properties located in Ames, Iowa.
- The entrance of N/A for catagorical variables can be treated as the lack of subject described by attribute.


**Verifying assumptions** 

With regard to representation, the dataset tracks all residential house sales in the Ames, Iowa region from 2006 to 2010. The use of residential property is important due to how general the residential properties can be. While this dataset does exclude more modern buildings (built 2010 onwards), it will still capture regional trends as well as trends inherent to houses (like no of rooms, bathrooms, size etc). 

While remove observations with 'NA' values is a standard statistical approach (especially for machine learning models which don't handle missing data well), there are some excpetions to this. For example, the use of the 'NA' for several catagorical variables describes the lack of the feature, rather than it not being recorded. Thus, for variables describing the existance of pools, fence, garages etc, will not be omitted as they can be significant to the sale price. This is covered further in part 3.
