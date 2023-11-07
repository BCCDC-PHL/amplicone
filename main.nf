#!/usr/bin/env nextflow

nextflow.enable.dsl = 2



def header() {

return """
TEST
=========================================================================
output directory: ${params.outdir}


"""
}



/**
---------------------------------------------------------------------------------
program introduction
---------------------------------------------------------------------------------
*/

// this prints program header with mandatory input and output locations
log.info header()

// include modules
include {printHelp} from './modules/help.nf'

// import subworkflows
include {convertFastaToAmplicons} from './modules/AMPulator.nf'
include {runART} from './modules/AMPulator.nf'
include {AMPulator} from './modules/AMPulator.nf'


if (params.help){
    printHelp()
    exit 0
}

if (params.profile){
    println("Profile should have a single dash: -profile")
    System.exit(1)
}


ch_bedFile = Channel.fromPath(params.bed)
ch_refDir = Channel.fromPath(params.ref_dir_string).map{ tuple( it.baseName.split("\\.")[0], it) }
ch_AMPulator = Channel.fromPath("${baseDir}/bin/AMPulator.txt")






// main workflow
workflow {



  main:
    AMPulator(ch_AMPulator)
    convertFastaToAmplicons(ch_refDir) | runART
 


}

   
    
