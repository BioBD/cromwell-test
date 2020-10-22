version 1.0

workflow VEPWorkflow {
    input {
        File ref_fasta
        String assembly_name
        Int? num_forks
        String? dir_cache
        String input_suffix

        Boolean offline_execution = false
        File vcf
        File? gff
        File? gtf
        String? extra_args
    }
    String vcf_basename = basename(vcf, input_suffix)
    call vep
    {
        input:
            ref_fasta  = ref_fasta,
            num_forks = num_forks,
            base_name = vcf_basename,
            input_vcf = vcf,
            dir_cache = dir_cache,
            assembly_name = assembly_name,
            gff = gff,
            gtf = gtf,
            offline_execution = offline_execution,
            extra_args = extra_args
    }
}

task vep{
    input {
        File ref_fasta
        String base_name
        String assembly_name
        String? extra_args
        File input_vcf
        Int? num_forks 
        String? dir_cache
        File? gff
        File? gtf
        Boolean offline_execution
    }

    String offline_execution_arg = if offline_execution then " --offline " else "--database --genomes"
    String cache_arg = if defined(dir_cache) then " --cache  " else ""

    command {
        vep -v -i ~{input_vcf} -o ~{base_name}.vep_variant_effect_output.txt ~{cache_arg} ~{"--dir_cache " + dir_cache} ~{"--assembly " + assembly_name} --fasta ~{ref_fasta} --force_overwrite ~{"--fork " + num_forks} --stats_file ~{base_name}.vep_variant_effect_output_summary.html --total_length ~{offline_execution_arg} ~{"--gff " + gff} ~{"--gtf " + gtf} --pick ~{extra_args} --vcf 
        }
    output {
        File output_annotated_vcf = "~{input_vcf}"
        File output_vep_variant_effect_output= "~{base_name}.vep_variant_effect_output.txt"
        File output_vep_variant_effect_output_summary = "~{base_name}.vep_variant_effect_output_summary.html"
    }
}
