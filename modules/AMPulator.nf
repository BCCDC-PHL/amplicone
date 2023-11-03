process convertFastaToAmplicons {
    tag { sampleName }

    publishDir "${params.outdir}", mode: 'copy', pattern: "amplicon_fastas/*amplicon.fasta"
    
    cpus 1

    input:
    path(bed)
    path(fasta_dir)

    output:
    path('amplicon_fastas/*amplicon.fasta')

    script:

    """
    convert_fasta_to_amplicons.py --bed_file ${bed} --reference_directory ${fasta_dir} --output_directory amplicon_fastas
    """








}
