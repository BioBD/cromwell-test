version 1.0

task print_reads {
    command {
        gatk PrintReads -I /app/input.bam -O /tmp/output.bam
    }
    output {
        File out = "/tmp/output.bam"
    }
}

workflow print {
    call print_reads
}