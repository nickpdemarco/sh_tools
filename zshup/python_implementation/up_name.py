import argparse
import os

def full_destination_path(cwd, dest) :
	cwd_arr = cwd.split('/')
	while(cwd_arr[-1] != dest) :
		cwd_arr.pop()
	if cwd_arr :
		return "/".join(cwd_arr)
	else : 
		raise ValueError("The requested destination path is not a parent of the current working directory")

if __name__ == "__main__" :
	parser = argparse.ArgumentParser(description='Given a directory name that is a parent folder of the current working directory, return the full path to that parent folder.')
	parser.add_argument("parentDirName")
	args = parser.parse_args()
	print(full_destination_path(os.getcwd(), args.parentDirName))


