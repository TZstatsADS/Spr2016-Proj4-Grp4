import csv


def trycast(x):
    try:
        return float(x)
    except:
        try:
            return int(x)
        except:
            return x

def write_csv():
	cols = ['product_productid', 'review_userid', 'review_helpfulness', 'review_score', 'review_summary', 'review_text']

	f = open('moviescsv.csv', 'wb')
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
				doc[key] = trycast(value)
		f.close()

write_csv()
