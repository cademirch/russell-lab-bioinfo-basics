# russell-lab-bioinfo-basics

## What this is?
This repo is for details and stuff related to Russell Lab Bioinfo Basics Activity.
The purpose of this activity is to provide an introduction to genomics using a cluster and various other skills/concepts.

## The activity
We have sequenced some _Drosophila simulans_ flies we believe are infected with the wRi strain of _Wolbachia_. The goal of the activity is to determine if any, how many reads in each sample map to the _Drosophila simulans_ reference genome, and how many mapped to the wRi genome.

## Data availability
Reference genomes are available from NCBI RefSeq.

Sequencing reads can be found on the Hummingbird and Phoenix clusters. These files should be fully accessible by anyone, so no need to copy them to your working directory.

There are 5 samples:
1. Dsimulans_wRi-Riv84
2. WT-DsimwRi-line5A
3. WT-DsimwRi-line5B
4. WT-DsimwRi-line6A
5. WT-DsimwRi-line6B
6. WT-DsimwRi-line7A
7. WT-DsimwRi-line7B
8. WT-DsimwRi-line8A
9. WT-DsimwRi-line8B 


Hummingbird path: `/hb/home/cmirchan/fly-data/`
Phoenix path: `/private/groups/russelllab/cade/bioinfo-basics/fly-data`

## Logistical Things
What SLURM partition should I use?

Hummingbird: `128x24`
Phoenix: `short` or `medium`

I'm stuck or not sure where to start?
- Narrow down what you are stuck or don't know
- Try googling or asking ChatGPT
- Ask someone in person, describe to them what you have tried
- Look at the solutions
