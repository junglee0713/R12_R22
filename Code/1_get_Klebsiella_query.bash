DATA_DIR="/Users/leej39/Desktop/3_M_to_R/R12_R22/Data"
OUT_DIR="/Users/leej39/Desktop/3_M_to_R/R12_R22/Output/Klebsiella_mapped"

for RUN in RUN12 RUN22; do
    IN_DIR="${DATA_DIR}/bowtie_${RUN}"
    cd ${IN_DIR}
    for FILE in $(ls *R1.mapped.fasta); do
        FILE_PATH="${IN_DIR}/${FILE}"
        PREFIX=${FILE/_R1.mapped.fasta/}
        OUTFILE_PATH="${OUT_DIR}/${RUN}_${PREFIX}.Klebsiella_query.txt"
        grep "^>" ${FILE_PATH} > ${OUTFILE_PATH}
    done
done
