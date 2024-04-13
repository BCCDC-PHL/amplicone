process primerSearch {
    tag { sampleName }

    publishDir "${params.outdir}/amplicon_fastas", mode: 'copy', pattern: "*amplicon.fasta"
    
    cpus 8

    input:
    tuple val(sampleName), path(fasta)

    output:

    tuple val(sampleName), path('${sampleName}.primersearch')

    script:

    """
    primersearch -seqall ${fasta} -infile ${params.primers} -mismatchpercent ${params.mismatchPercent} -outfile ${sampleName}.primersearch 
    
    """


}

process extractFastas {
    tag { sampleName }

    publishDir "${params.outdir}/amplicon_fastas", mode: 'copy', pattern: "*amplicon.fasta"
    
    cpus 8

    input:
    tuple val(sampleName), path(fasta)

    output:

    tuple val(sampleName), path('${sampleName}.primersearch')

    script:

    """
    primersearch -seqall ${fasta} -infile ${params.primers} -mismatchpercent ${params.mismatchPercent} -outfile ${sampleName}.primersearch 
    
    """


}