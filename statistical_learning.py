# https://nbviewer.jupyter.org/github/a-martyn/ISL-python/blob/master/Notebooks/ch2_statistical_learning_applied.ipynb

# set working directory
import os
os.getcwd()
os.chdir('/Users/poromendro/Downloads')

# 1. read the data
import pandas as pd
college = pd.read_csv('College.csv')

# 2. rename the first column
college = college.set_index(['Unnamed: 0'], append=True, verify_integrity=True)    # set the dataframe structure
college.rename_axis([None, 'College'], inplace=True)     # rename the first column

# 3. produce numerical summary of the variables in the data set
college.describe()

# 4. produce a scatterplot matrix of first 10 columns
import seaborn as sns
import matplotlib.pyplot as plt
sns.pairplot(college.iloc[:, 1:11])

# 5. produce side-by-side boxplots of 'Outstate' vs 'Private'
import seaborn as sns
import matplotlib.pyplot as plt
sns.boxplot(x=college['Private'], y=college['Outstate'])

# 6. create a qualitative variable with student in top 10% > 50
college['Elite'] = college['Top10perc'] > 50
college['Elite'].sum()

# 7. use summary() function to see how many elite universities there are
college.describe()
#=======================================================================================================================
# 1. read the data
auto = pd.read_csv('Auto.csv')
print(auto)




















