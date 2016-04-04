import csv
import time

def print_time_elapsed(start_time, name):
	print "-----   " + str(time.time() - start_time)[:5] + " seconds to run " + name + "   -----"


def trycast(x):
    try:
        return int(x)
    except:
        try:
            return float(x)
        except:
            return x

def write_csv():
	cols = ['product_productid', 'review_userid', 'review_helpfulness', 'review_score', 'review_time', 'review_summary', 'review_text']

	f = open('movies.csv', 'wb')
	w = csv.writer(f)
	w.writerow(cols)

	doc =  {}

	with open('movies.txt') as infile:
		for line in infile:
			line = line.strip()
			if line=="":
				w.writerow([doc.get(col) for col in cols])
				doc = {}
			else:
				idx = line.find(':')
				key, value = tuple([line[:idx], line[idx+1:]])
				key = key.strip().replace("/", "_").lower()
				value = value.strip()
				value = trycast(value)
				if key == 'review_time':
					value = time.strftime('%m/%d/%Y', time.gmtime(value))
				doc[key] = value
		f.close()

start_time = time.time()
write_csv()
print_time_elapsed(start_time, 'load')