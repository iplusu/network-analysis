### Number of nodes 1 nodes using 2 Processor Per Node
###$ -pe mpi 4
### Output files. If not specified PBS uses the job name and ID.
#PBS -o /home/bdb/ychae/network-analysis/output-dot.log
#PBS -e /home/bdb/ychae/network-analysis/output-dot.err
### Merge stderr with stdout
#PBS -j oe
### Mail to user
#PBS -m abe
#PBS -M iplusu@gmail.com
### Queue name
#PBS -q default
### Job name
#PBS -N young_dot
### Declare job-non-rerunable
#PBS -r n
#cd $PBS_O_WORKDIR
###cd /home/bdb/ychae/sims1/
###/opt/openmpi_intel_12.0/bin/mpirun -np 4 /home/bigdata/username/ychae/sims1/towhee
cd /home/bdb/ychae/network-analysis
### ~/bin/matlab -nodesktop -nodisplay -nosplash -r "run('~/ychae/network-analysis/saveForEachDot.m')"
###~/bin/matlab -c "~/bin/license.dat" -nodesktop -nodisplay -nosplash -r "run('~/ychae/network-analysis/saveForEachDot.m')"
~/ychae/network-analysis/run_saveForEachDot.sh /opt/matlab/2011a
#set | grep PBS | sort

#sleep 60

