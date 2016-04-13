import pandas as pd
import time
from datetime import datetime
#import igraph


def print_time_elapsed(start_time, name):
    '''           3
    prints the time elapsed since start_time in seconds
    ands returns the current time
    '''
    print "-----   " + str(time.time() - start_time)[:8] + " seconds to run " + name + "   -----"
    return time.time()

def get_grouped_dic(df, col):
    '''
    Takes in dataframe and column name and outputs a dictionary where the key
    is every unique entry from the specified column and the values are all the rows
    associated with that unique column value.
    EX: col = 'review_userid'  ->  dictionary will have userid as key and its value is
    all review information for that user as a pandas DataFrame.
    '''
    if col == 'asin':
        grouped = df.groupby(level = 0)
    else:
        grouped = df.groupby([col])
    return grouped
def get_summary_statistics(grouped, top_n):
    df_list = []
    for rID in top_n:
        print rID
        gr = grouped.get_group(rID)
        print gr
        df_list.append(gr)
    big_df = pd.concat(df_list)
    big_df.to_pickle('/home/max/Documents/project4/data/top_stats.pkl')
    return big_df

def get_summary_stats(grouped):
    df_list = []
    for name, group in grouped:
        grpt = group.groupby(['category'])
        df_list.append(grpt.describe())
    big_df = pd.concat(df_list)
    big_df.to_pickle('/home/max/Documents/project4/data/stats.pkl')
    return big_df

t = time.time()
data = pd.read_pickle('/home/max/Documents/project4/data/all_merged_must_title.pkl')
t = print_time_elapsed(t, 'read all')
'''
data = get_grouped_dic(data, 'category')
t = print_time_elapsed(t, 'group cat')
mov = data.get_group('Movies_and_TV')
t = print_time_elapsed(t, 'get mov')
mov = get_grouped_dic(mov, 'reviewerID')
r = mov.size()
r.sort()
top_10000 = r[-10000:]
top_10000 = top_10000.index
pd.Series(top_10000).to_pickle('/home/max/Documents/project4/data/top_10000.pkl')

'''
#top_10000 = pd.read_pickle('/home/max/Documents/project4/data/top_10000.pkl')
data = get_grouped_dic(data, 'reviewerID')
data = get_summary_stats(data)
