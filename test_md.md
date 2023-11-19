
```r
library(readxl)
library(reticulate)
```

```python
import numpy as np 
import pandas as pd
import matplotlib.pyplot as plt 
import seaborn as sns
```

```python
# Load the Data Frame
unicorn_data = pd.read_excel('CB-Insights_Global-Unicorn-Club_2023.xlsx')
```

```python
# Cleaning the data
## Removing useless columns
unicorn_data = unicorn_data.dropna(subset="Valuation ($B)")

## Dealing with missing value in "Country"
unicorn_data.loc[537, "Country"] = "Singapour"

## Removing ",," in "Select investors" corectly count  number of investors
unicorn_data ["Select Investors"] = unicorn_data ["Select Investors"].str.replace(",,",",")

# Counting the number of Investors
unicorn_data["Number_of_Investors"] = unicorn_data["Select Investors"].str.split(",", expand=False).str.len()

investors = unicorn_data["Select Investors"].str.split(",", expand=True)

unicorn_data_cleaned = unicorn_data.join(investors)

unicorn_data_cleaned = unicorn_data_cleaned.rename(columns={0: "1st_investor", 1: "2nd_investor", 2: "3td_investor", 3: "4td_investor"})

print(unicorn_data_cleaned.info())
```

```python

sns.countplot(
  data=unicorn_data_cleaned,
  x="Industry",
  stat='count'  
  ).set(title="Distribution of the number of companies per Industry")
plt.xticks(rotation=90)
plt.show()
```