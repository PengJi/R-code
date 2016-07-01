library(rhdfs)
hdfs.init()
library(rmr2)

input_dir <- '/test';
output_dir <- '/output10'
wordcount = function(input1, output1, pattern = " "){

	wc.map = function(., lines) {
		keyval(unlist( strsplit( x = lines,split = pattern)),1)
	}

	wc.reduce =function(word, counts ) {
		keyval(word, sum(counts))
	}

	mapreduce(input = input1 ,output = output1, 
			  map = wc.map, reduce = wc.reduce,combine = T, 
			  input.format = make.input.format(mode = "text"),
			  output.format = "text")
}      
wordcount(input_dir,output_dir) 
