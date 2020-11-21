version 1.0

task base_recalibrator {
    command {
        /home/cloud-di/cromwell/broadinstitute_gatk/gatk/gatk BaseRecalibratorSpark \
            --spark-master local[*] \
            -I /home/cloud-di/gatk4-ema/NA12878.hg38.aligned.duplicate_marked.sorted.bam \
            -R /home/cloud-di/gatk4-ema/Homo_sapiens_assembly38.fasta \
            --known-sites /home/cloud-di/gatk4-ema/Homo_sapiens_assembly38.dbsnp138.vcf \
            -O /tmp/recal_data.table
    }
    output {
        File out = "/tmp/recal_data.table"
    }
}

workflow recalibrator {
    call base_recalibrator
}