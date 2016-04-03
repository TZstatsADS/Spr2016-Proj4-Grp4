import csv
import pandas as pd


# possible column values
cols = ['product_productid', 'review_userid', 'review_helpfulness', 'review_score', 'review_time', 'review_summary', 'review_text']

def read_csv(fn):
	'''
	reads csv from write_csv.oy
	'''
	df = pd.DataFrame.from_csv(fn)
	return df

def get_grouped_dic(df, col):
	'''
	Takes in dataframe and column name and outputs a dictionary where the key
	is every unique entry from the specified column and the values are all the rows
	associated with that unique column value.

	EX: col = 'review_userid'  ->  dictionary will have userid as key and its value is 
	all review information for that user as a pandas DataFrame.
	'''
	if col == 'product_productid':
		grouped = df.groupby(level = 0)
	else:
		grouped = df.groupby([col])

	data = {}
	for name, group in grouped:
		data[name] = group

	return data

df = read_csv('movies.csv')
grouped_dic = get_grouped_dic(df, 'review_userid')

# prints the value of the first element in the dictionary,
# which is in this case all of the review information for 1 user
print grouped_dic.values()[0]

# prints summary statistics for this user
print grouped_dic.values()[0].describe()