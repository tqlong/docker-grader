ROOT_DIR=$PWD
EXECUTABLE=$1
INPUT=$2
OUTPUT=$3
RUNTIME_ERROR=$3.err
EXPECTED=$4
echo "" > $OUTPUT && \
echo "" > $RUNTIME_ERROR && \
docker run -it --rm \
   -v $ROOT_DIR/$EXECUTABLE:/home/grader/executable \
   -v $ROOT_DIR/$INPUT:/home/grader/input \
   -v $ROOT_DIR/$OUTPUT:/home/grader/output \
   -v $ROOT_DIR/$RUNTIME_ERROR:/home/grader/error \
   tqlong/gcc:grader

DIFF=$(diff -b $ROOT_DIR/$EXPECTED $ROOT_DIR/$OUTPUT)
if [ "$DIFF" != "" ]
then
    echo Wrong: $DIFF
else
    echo "Accepted"
fi