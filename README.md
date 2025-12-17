split-wrapper:

bash script wrapper for split

The point of this script is to avoid a mistake such as splitting a 8.5GB tarball into 3000 byte chunks instead of 3000 MB cchunks,

resulting in millions of files. This bash script prints the size of the file in bytes, the size of the chunk in bytes and approximately

how many files it will create. There is a rounding error in the number of files it creates +-1.

The point of it is to print approximately how many files it will create so you can tell if it's going to create 1000s of files.

This script sets it so it starts creating files with '.' added to the end of the file you entered.

(EX: bash split_wrap.sh file.tgz K 1 runs the command split -b 1K file.tgz file.tgz.)

the manpages for split explain the split command better than i could (man split)

Use:

3 arguments

split_wrap.sh FILE UNIT COUNT

FILE: file thats going to be split

UNIT: K for KB and M for MB

COUNT: how many KB or MB

Enter 'Y' when it prints "continue" to continue to run the split command or 'N' (or anything else) to exit before it runs split.
