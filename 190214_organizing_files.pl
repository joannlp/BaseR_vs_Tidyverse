#making folder for each sample name with folders inside for DNA or ATAC seq data
for f in {4,5,6,7}; do
mkdir -p A$f/{DNA,ATAC}
done

###test to see what file names will be output (make sure you are in the folder where your files are located)
##$2 is the Genotype, $4 is the biological replicate, $3 is the Tissue
for i in $(ls *R1.fq.gz); do 
grep -a $(echo ${i} | cut -f5 -d"_") README.ATACseq.txt | awk '{print $2"_"$4"_"$3"_R1.fq.gz"}'; 
done

###change the names of the files in your folder (for R1)
for i in $(ls *R1.fq.gz); do 
mv $i $(grep -a $(echo ${i} | cut -f5 -d"_") README.ATACseq.txt | awk '{print $2"_"$4"_"$3"_R1.fq.gz"}'); 
done

###for R2
for i in $(ls *R2.fq.gz); do 
mv $i $(grep -a $(echo ${i} | cut -f5 -d"_") README.ATACseq.txt | awk '{print $2"_"$4"_"$3"_R2.fq.gz"}'); 
done

###move to the correct folder
for i in {4,5,6,7}; do
mv A"$i"*.fq.gz /pub/joannlp/EcoEvo283/Bioinformatics_Course/A"$i"/ATAC
done

###moving DNAset to correct folder
mv ADL06* /pub/joannlp/EcoEvo283/Bioinformatics_Course/A4/DNA
mv ADL09*  /pub/joannlp/EcoEvo283/Bioinformatics_Course/A5/DNA
mv ADL10* /pub/joannlp/EcoEvo283/Bioinformatics_Course/A6/DNA
mv ADL14* /pub/joannlp/EcoEvo283/Bioinformatics_Course/A7/DNA




