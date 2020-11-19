version 1.0

task base_recalibrator {
    command {
        gatk BaseRecalibratorSpark \
            --spark-master local[*] \
            -I /app/input.bam \
            -R /app/reference.fasta \
            --known-sites /app/variations.vcf \
            -O /tmp/recal_data.table
    }
    output {
        File out = "/tmp/recal_data.table"
    }
}

workflow recalibrator {
    call base_recalibrator
}