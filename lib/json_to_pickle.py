# 4 Total functions to convert Dr. Jason McAuley's data to pickle
import pandas as pd
import numpy as np
import time
from datetime import datetime
import glob

def parse(f):
    '''           1
    Function to parse json data as written on Dr. McAuley's website referenced
    in json_to_csv
    '''
    for line in f:
        yield eval(line) # returns a dictionary of the current json review


def convert_date_to_datetime(date_str):
    '''           2
    given string input of format found in jmcauley data, outputs datetime
    '''
    return datetime.strptime(date_str, '%m %d, %Y')


def print_time_elapsed(start_time, name):
    '''           3
    prints the time elapsed since start_time in seconds
    ands returns the current time
    '''
    print "-----   " + str(time.time() - start_time)[:8] + " seconds to run " + name + "   -----"
    return time.time()


def json_to_pickle(fn, datatype):
    '''           4
    reads json using code found on Jason McAuley's website,
    he wanted to be credited by citing the following papers:
    Image-based recommendations on styles and substitutes
    J. McAuley, C. Targett, J. Shi, A. van den Hengel
    SIGIR, 2015Inferring networks of substitutable and complementary products
    J. McAuley, R. Pandey, J. LeskovecKnowledge Discovery and Data Mining, 2015
    '''
    df_index = 0 # index ID for the dataframe
    errs = 1 # errors caused/resulting from reading
    count = 1.0 # number of lines read

    df = {} # data loading dictionary

    #num_lines = sum(1 for line in open(fn, 'r')) # get the number of data pts in file
    #print num_lines

    if datatype=='meta':
        key_list = ['asin', 'title', 'related', 'price', 'salesRank', 'brand']
        with open(fn, 'r') as f:

            for d in parse(f):
                good_d = {} # to avoid error + get only desired columns,
                keys_w_data = set(d.keys()) & set(key_list) # find overlap of desired cols and cols in current datapt
                try:
                    for key in key_list:
                        if key in keys_w_data: # if data point has desired column
                            good_d[key] = d[key] # add column value to dic
                        else: # if not
                            good_d[key] = '' # set column value as ''

                except ValueError: # dont stop if (infrequent) error
                    errs += 1
                    continue

                df[df_index] = good_d # insert datapt into dic

                print str(count/4500000)[:6] # print proportion read into dic

                count += 1.0
                df_index += 1
                if count > 4500000.0:
                    print 'count at 4500000, converting to df'
                    data_frame = pd.DataFrame.from_dict(df, orient='index') # convert data dic to df
                    print 'converted to df, writing pickle file'
                    data_frame.to_pickle(fn[:-5] + str(df_index) + '.pkl') # write df to pickle
                    df = {}
                    count = 1.0
                    #num_lines -= 4500000
                    #df_index = 0
            if count != 1.0:
                print 'finished last line, writing last file'
                data_frame = pd.DataFrame.from_dict(df, orient='index') # convert data dic to df
                data_frame = data_frame.set
                print 'converted to df, writing pickle file'
                data_frame.to_pickle(fn[:-5] + str(df_index) + '.pkl') # write df to pickle
    else:
        key_list = ['asin', 'reviewerID', 'helpful', 'reviewText', 'overall', 'reviewTime']
        with open(fn, 'r') as f:

            for d in parse(f):
                good_d = {} # to avoid error + get only desired columns,
                keys_w_data = set(d.keys()) & set(key_list) # find overlap of desired cols and cols in current datapt
                try:
                    for key in key_list:
                        if key in keys_w_data: # if data point has desired column

                            if key == 'reviewTime': # if this is the time column
                                adj_date = convert_date_to_datetime(d[key]) # convert the string format to datetime
                                if adj_date < datetime(2006,1,1): # if before 2006
                                    adj_date = datetime.strptime('lololol', '%m %d, %Y') # throw an error (best way to break out of all loops)
                                good_d[key] = adj_date # if after 2006, add to df
                            else:
                                good_d[key] = d[key] # if not time column, add to df w/o adjustment

                        else:
                            good_d[key] = '' # if not in desired column

                except ValueError: # if infrequent error or intentionally thrown error
                    errs += 1
                    #num_lines -= 1 # ignore this datapt from overall count
                    continue # keep going, skip this datapt

                df[df_index] = good_d # insert datapt into dic

                print str(count/4500000.0)[:6] # print proportion read into dic

                count += 1.0
                df_index += 1
                if count > 4500000.0:
                    print 'count at 4500000, converting to df'
                    data_frame = pd.DataFrame.from_dict(df, orient='index') # convert data dic to df
                    print 'converted to df, writing pickle file'
                    data_frame.to_pickle(fn[:-5] + str(df_index) + '.pkl') # write df to pickle
                    df = {}
                    count = 1.0
                    #num_lines -= 4500000
                    #df_index = 0
            if count != 1.0:
                print 'finished last line, writing last file'
                data_frame = pd.DataFrame.from_dict(df, orient='index') # convert data dic to df
                print 'converted to df, writing pickle file'
                data_frame.to_pickle(fn[:-5] + str(df_index) + '.pkl') # write df to pickle


def read_jar_of_pickles(path_to_folder):
    filenames = glob.glob(path_to_folder + "/*.pkl")
    first_in_loop = True
    for fn in filenames:
        print 'starting ' + fn
        d = pd.read_pickle(fn)
        if first_in_loop:
            big_frame = d
            first_in_loop = False
        big_frame = big_frame.append(d)
    return big_frame


def convert_data_folder_to_pickle():
    path = '/home/max/Documents/project4/data/*'
    filenames = glob.glob(path)
    for fn in filenames:
        print 'starting ' + fn
        join_pickle_on_reviewerID(fn)
        print 'done with ' + fn
    print 'done'


def write_unique_reviewerIDs(df):
    reviewerIDs = pd.Series(np.unique(df['reviewerID']))
    reviewerIDs.to_csv('/home/max/Documents/project4/data/movie_reviewerIDs.csv', index = False)


def write_unique_asins(df):
    reviewerIDs = pd.Series(np.unique(df['asin']))
    reviewerIDs.to_csv('/home/max/Documents/project4/data/reviewers_asins.csv', index = False)


def join_pickle_on_reviewerID(fn):
    reviewerIDs = pd.read_csv('/home/max/Documents/project4/movie_reviewerIDs.csv',names=['reviewerID'], header=None)
    print reviewerIDs
    cut_df = pd.DataFrame()
    if fn[-3:] == 'pkl':
        df = pd.read_pickle(fn)
    else:
        df = read_jar_of_pickles(fn)
    print 'read ' + fn
    print df
    cut_df = pd.merge(reviewerIDs, df, on='reviewerID', how='inner')
    print 'sliced'
    print cut_df
    if fn[-3:] == 'pkl':
        cut_df.to_pickle(fn[:-4] + '_joined_mov_r_id.pkl')
    else:
        cut_df.to_pickle(fn[:-1] + '_joined_mov_r_id.pkl')
    return cut_df


def join_pickle_on_asin(fn):

    asins = pd.read_csv('/home/max/Documents/project4/data/reviewers_asins.csv',names=['asin'], header=None)
    cut_df = pd.DataFrame()
    if fn[-3:] == 'pkl':
        df = pd.read_pickle(fn)
    else:
        df = read_jar_of_pickles(fn)
    print df
    print 'read df'
    df = df.reset_index()
    cut_df = pd.merge(asins, df, on='asin', how='inner')
    print 'sliced df'
    if fn[-3:] == 'pkl':
        cut_df.to_pickle(fn[:-4] + '_joined.pkl')
    else:
        cut_df.to_pickle(fn + '_refined.pkl')
    return cut_df


def merge_review_meta():
    r_df = pd.read_pickle('/home/max/Documents/project4/data/reviews_joined_mov_asin.pkl')
    r_df = r_df.reset_index()
    print r_df
    print 'REV'
    m_df = pd.read_pickle('/home/max/Documents/project4/data/metadata_refined.pkl')
    print m_df
    print 'META'
    r_df = pd.merge(r_df, m_df, on='asin', how='inner')
    r_df = r_df.drop_duplicates('reviewText')
    r_df = r_df.set_index('asin')
    r_df = r_df.sort_index()
    print r_df
    print 'MERGE'
    r_df.to_pickle('/home/max/Documents/project4/data/all_merged.pkl')
    return r_df


def get_specific_meta():
    t = time.time()
    meta_df = pd.read_pickle('/home/max/Documents/project4/data/metadata_drop.pkl')
    t = print_time_elapsed(t, ' read meta')
    categories = ['Baby', 'Beauty', 'Books', 'Cell_Phones_and_Accessories', 'Clothing_Shoes_and_Jewelry', 'Home_and_Kitchen', 'Movies_and_TV', 'Automotive', 'CDs_and_Vinyl', 'Toys_and_Games', 'Video_Games']
    df_list = []
    for category in categories:
        print 'starting ' + category
        cut_df = pd.DataFrame()
        df = pd.read_pickle('/home/max/Documents/project4/data/' + category + '.pkl')
        category_asins = pd.DataFrame(pd.Series(np.unique(df['asin'])), columns = ['asin'])
        t = print_time_elapsed(t, ' read ' + category)
        print category_asins
        print df
        cut_df = pd.merge(category_asins, meta_df, on='asin', how='inner')
        print cut_df
        t = print_time_elapsed(t, ' merge meta ' + category)
        cut_df = pd.merge(df, cut_df, on='asin', how='inner')
        print cut_df
        t = print_time_elapsed(t, ' merge ' + category)
        cut_df['category'] = category
        cut_df = cut_df.drop_duplicates('reviewText')
        df_list.append(cut_df)
    print '   STRTING CONCAT  '
    big_df = pd.concat(df_list, ignore_index=True)
    t = print_time_elapsed(t, ' concat ')
    big_df = big_df.set_index('asin')
    big_df = big_df.sort_index()
    print 'starting write'
    big_df.to_pickle('/home/max/Documents/project4/data/all_merged.pkl')
    t = print_time_elapsed(t, ' write')
    return big_df


b_df = get_specific_meta()
