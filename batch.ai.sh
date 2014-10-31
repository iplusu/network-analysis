### Number of nodes 1 nodes using 2 Processor Per Node
###$ -pe mpi 4
### Output files. If not specified PBS uses the job name and ID.
#PBS -o /home/bigdata/username/ychae/network-analysis/output-ai.log
#PBS -e /home/bigdata/username/ychae/network-analysis/output-ai.err
### Merge stderr with stdout
#PBS -j oe
### Mail to user
#PBS -m iplusu@gmail.com
### Queue name
#PBS -q default
### Job name
#PBS -N young_Env
### Declare job-non-rerunable
#PBS -r n
#cd $PBS_O_WORKDIR
###cd /home/bigdata/username/ychae/sims1/
###/opt/openmpi_intel_12.0/bin/mpirun -np 4 /home/bigdata/username/ychae/sims1/towhee
cd /home/bigdata/username/ychae/network-analysis
/usr/bin/dot -Tps ai.dot -o ai.ps
#set | grep PBS | sort

#sleep 60

