### Number of nodes 1 nodes using 2 Processor Per Node
#$ -pe mpi 4
### Output files. If not specified PBS uses the job name and ID.
#PBS -o /home/bigdata/username/ychae/network-analysis/output-se.log
#PBS -e /home/bigdata/username/ychae/network-analysis/output-se.err
### Merge stderr with stdout
#PBS -j oe
### Mail to user
#PBS -m aeb
#PBS -M iplusu@gmail.com
### Queue name
#PBS -q default
### Job name
#PBS -N se
### Declare job-non-rerunable
#PBS -r n
#cd $PBS_O_WORKDIR
cd /home/bigdata/username/ychae/network-analysis/dots/se
/usr/bin/dot -Tps se.dot -o se.ps
#set | grep PBS | sort

#sleep 60

