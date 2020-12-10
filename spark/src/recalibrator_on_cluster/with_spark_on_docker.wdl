version 1.0

task base_recalibrator {
    command {
        /gatk/gatk BaseRecalibratorSpark \
            --spark-master local[*] \
            -I /home/cloud-di/gatk4-ema/NA12878.hg38.aligned.duplicate_marked.sorted.bam \
            -R /home/cloud-di/gatk4-ema/Homo_sapiens_assembly38.fasta \
            --known-sites /home/cloud-di/gatk4-ema/Homo_sapiens_assembly38.dbsnp138.vcf \
            -O /tmp/recal_data.table
    }
    runtime {
        docker: "broadinstitute/gatk:4.1.8.1"
    }
    output {
        File out = "/tmp/recal_data.table"
    }
}

workflow recalibrator {
    call base_recalibrator
}