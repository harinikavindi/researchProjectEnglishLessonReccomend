import pandas as pd 
import numpy as np
import sklearn
import matplotlib.pyplot as plt
import seaborn as sns
from sklearn.decomposition import TruncatedSVD
import warnings
warnings.filterwarnings('ignore')

#pickle file create
import pickle

#### Test that the app works
import requests
import json

students = pd.read_csv('D:\data.csv', sep=',' )
students.head()
print(students)

#students.groupby('lesson_title')['rating'].mean().head()
students.groupby('lesson_title')['rating'].mean().sort_values(ascending=False).head()

ratings_mean_count = pd.DataFrame(students.groupby('lesson_title')['rating'].mean())
print(ratings_mean_count)

# ratings_mean_count['rating_counts'] = pd.DataFrame(students.groupby('lesson_title')['rating'].count())
# print(ratings_mean_count)

ratings_mean_count.head()

#sns.set_style('dark')
#%matplotlib inline

# plt.figure(figsize=(8,6))
# plt.rcParams['patch.force_edgecolor'] = True
# ratings_mean_count['rating_counts'].hist(bins=50)

plt.figure(figsize=(8,6))
plt.rcParams['patch.force_edgecolor'] = True
ratings_mean_count['rating'].hist(bins=50)

# plt.figure(figsize=(8,6))
# plt.rcParams['patch.force_edgecolor'] = True
# sns.jointplot(x='rating', y='rating_counts', data=ratings_mean_count, alpha=0.4)

student_rating = students.pivot_table(index='student_id', columns='lesson_title', values='rating')

student_rating.head()
print(student_rating)

####################
#data = {  "lesson_title": "C"}


lesson_ratings = student_rating['B']
lesson_ratings.head()
print(lesson_ratings)

simillar_lessons = student_rating.corrwith(lesson_ratings)

corr_lesson = pd.DataFrame(simillar_lessons, columns=['Correlation'])
corr_lesson.dropna(inplace=True)
corr_lesson.head()
print(corr_lesson)

corr_lesson.sort_values('Correlation', ascending=False).head(10)


##### pickle file can be found inside the same directory as Jupyter notebook.
#pickle.dump(corr_lesson, open('model.pkl', 'wb'))


# variable with local url
#url = 'http://127.0.0.1:5000'

# test data  -- Create sample data and convert to JSON
#data = {  'model': 'D'}


#data = json.dumps(data)
#data

#Post sample data and check response code using 
#r_survey = requests.post(url, data)
#print(r_survey)









