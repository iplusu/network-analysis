#!/usr/bin/python
import os
import sys
import shutil

base_path = "/home/bdb/ychae"
dot_path = base_path + "/network-analysis/dots"
skel_file = base_path + "/batch.skel.sh"

lists = ["ai", "cg", "cn", "db", "hpc", "hu", "infosec", "inter", "se", "tc"]

def usage():
	usage_str ="\nUSAGE: ./dot_jobs.py [option|job]\n\n[option]\n\tdist: distribute the dots jobs.\n\tqsub: submit all the jobs.\n\tlist: lists all the available jobs.\n"

	print usage_str
	sys.exit()

def dist():
	for list in lists:
		new_path = dot_path + "/" + list

		dot_file = dot_path + "/" + list + ".dot"
		batch_file = new_path + "/batch." + list + ".sh"
		new_file = new_path + "/"  +list + ".dot"

		if not os.path.exists(new_path):
#			print "does not exist" + new_path
			os.mkdir(new_path)
		shutil.copy(dot_file, new_file)

		skel_fi = open(skel_file, 'r')
		batch_fo = open(batch_file, 'w')

		for row in skel_fi:
			new_str = row.replace("job_name", list)
			batch_fo.write(new_str)
		

def qsub():
	for list in lists:
		comm = "qsub " + dot_path + "/" + list + "/batch." + list + ".sh"
		os.system(comm)

def individual(task_name):
	if task_name not in lists:
		usage()
	comm = "qsub " + dot_path + "/" + task_name + "/batch." + task_name + ".sh"
#	print comm
	os.system(comm)

def dispList():
	for list in lists:
		print list

if __name__ == "__main__":
	if len(sys.argv) != 2:
		usage()
	
	if sys.argv[1] == "dist":
		dist()
	elif sys.argv[1] == "qsub":
		qsub()
	elif sys.argv[1] == "list":
		dispList()
	else:
		individual(sys.argv[1])
