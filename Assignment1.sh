#!/bin/bash
# This script creates 10000 files with 2000 rows and 50 columns each in local file system and moves it to hadoop file system

# Make a directory in local file system and move to that path to store the files we are about to create
mkdir -p ~/assignment
cd "../assignment"

# Create 10000 files with 2000 rows and 50 columns separated by "," delimiter using two for loops
for i in {1..10000}; do
        touch file${i}.txt;
                for j in {1..2000}; do
                        echo {1..50} | tr " " ,  >> file${i}.txt
        	done

done
# Create a directory in hadoop file system to move the files to
hadoop fs -mkdir -p /user/cloudera/Test

# Move the all files from local file system to hadoop file system
hadoop fs -put /home/cloudera/assignment/file*.txt /user/cloudera/Test
