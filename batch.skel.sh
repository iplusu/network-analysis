### Number of nodes 1 nodes using 2 Processor Per Node
###$ -pe mpi 4
### Output files. If not specified PBS uses the job name and ID.
#PBS -o /home/bigdata/username/ychae/network-analysis/output-job_name.log
#PBS -e /home/bigdata/username/ychae/network-analysis/output-job_name.err
### Merge stderr with stdout
#PBS -j oe
### Mail to user
#PBS -m aeb
#PBS -M iplusu@gmail.com
### Queue name
#PBS -q default
### Job name
#PBS -N job_name
### Declare job-non-rerunable
#PBS -r n
#cd $PBS_O_WORKDIR
cd /home/bdb/ychae/network-analysis/dots/job_name
/usr/bin/dot -Tps job_name.dot -o job_name.ps
#set | grep PBS | sort

#sleep 60

