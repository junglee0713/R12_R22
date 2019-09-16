DATA_DIR="/Users/leej39/Desktop/3_M_to_R/R12_R22/Data"
Kleb_DIR="/Users/leej39/Desktop/3_M_to_R/R12_R22/Output/Klebsiella_mapped"

for RUN in RUN12 RUN22; do
    IN_DIR="${DATA_DIR}/USDA_${RUN}"
    OUT_DIR="${DATA_DIR}/Kleb_${RUN}"
    cd ${IN_DIR}
    for FILE in $(ls *_gene_pathway_KO_species.tsv); do
        IN_FILE="${IN_DIR}/${FILE}"
        PREFIX=${FILE/_gene_pathway_KO_species.tsv/}
        QUERY_FILE="${Kleb_DIR}/${RUN}_${PREFIX}.Klebsiella_query.txt"
        OUT_FILE="${DATA_DIR}/Kleb_${RUN}/${RUN}_${PREFIX}.txt"
        grep -Ff ${QUERY_FILE} ${IN_FILE} > ${OUT_FILE}
    done
done

## TOO SLOW, use R's inner join instead!
