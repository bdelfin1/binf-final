#!/usr/bin/python

from Bio import Entrez
Entrez.email = "bdelfin1@ramapo.edu"

f1=open('/Users/Hubble_Space_Telescope/Desktop/LargeData/BioPython/BC_search_test_doc.csv', 'w+') 
#file to write to
f1.write("year,count\n") #Not sure if this is needed, commenting out for now
for year in range (2003, 2018): #loops 2003-2017
	handle = Entrez.esearch(db="pubmed", term="Machine Learning", mindate=year, maxdate=year, datetype="pdat")	
	#searches pubmed for Machine Learning Articles from year (2003-2017)
	record = Entrez.read(handle) 		# shows info stored in pubmed field	
	print(year )
	count = str(record["Count"]) #stores the article count as a string
	print count #printing count for testing purposes

	yearStr = str(year) #because pymol can't write ints to files?
	f1.write(yearStr+","+count)	
	f1.write("\n")
	#writes the year and count to that file.
f1.close
