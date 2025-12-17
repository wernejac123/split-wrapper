# $1 file
# $2 unit
# $3 count
#chunk = unit * count

#define kb and mb
K=1024
M=$((1024*$K))

clear

#check file exists
if [ ! -f "$1" ]; then
   echo "file not found"
   exit
fi

#file size
FILESZ=$(cat $1|wc -c) 
echo "file size: $FILESZ bytes"

#get size of chunk
case $2 in
   'M')
      CHUNK=$(($M*$3))
      ;;
   'K')
      CHUNK=$(($K*$3))
      ;;
   *)
      echo "invalid"
      exit
      ;;
esac

echo "chunk=$CHUNK bytes"

#exit if $CHUNK greater then $FILESZ
if [ $CHUNK -gt $FILESZ ]; then
   echo "chunk is larger than the file size"
   exit
fi

#print number of files expected
echo -e "\n$(($FILESZ/$CHUNK)) files"

echo "continue:"
read IN
if [ $IN != 'y' ]; then 
   exit
fi

#run split
split -b "$3$2" "$1" "$1."
