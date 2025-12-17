split-wrapper:

bash script wrapper for the UNIX command split

The point of this script is to avoid a mistake such as splitting a 8.5GB tarball into 3000 byte chunks instead of 3000 MB chunks,

resulting in millions of files. This bash script prints the size of the file in bytes, the size of the chunk in bytes and approximately

how many files it will create. There is a rounding error in the number of files it reports will be creates +-1.

The point of it is to print approximately how many files it will create so you can tell if it's going to create 1000s of files before it runs split.

This script sets it so it starts creating files with '.' added to the end of the file you entered.

(EX: bash split_wrap.sh file.tgz K 1 runs the command split -b 1K file.tgz file.tgz.)

The manpages for split explain the split command better than I could (man split)

Use:

3 arguments

split_wrap.sh FILE UNIT COUNT

FILE: file thats going to be split

UNIT: K for KB and M for MB

COUNT: how many KB or MB

Enter 'Y' when it prints "continue" to continue to run the split command or 'N' (or anything else) to exit before it runs split.


This was tested in Slackware 15.0 with bash and st terminal. It should run on any UNIX like OS that has split.
