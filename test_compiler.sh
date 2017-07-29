ROOT_DIR=$PWD
SOURCE=$1
EXECUTABLE=$2
COMPILER_OUTPUT=$2.compiler_out
COMPILER_ERROR=$2.compiler_err
echo "" > $EXECUTABLE && \
echo "" > $COMPILER_OUTPUT && \
echo "" > $COMPILER_ERROR && \
docker run -it --rm \
   -v $ROOT_DIR/$SOURCE:/home/compiler/source.cpp:ro \
   -v $ROOT_DIR/$EXECUTABLE:/home/compiler/executable \
   -v $ROOT_DIR/$COMPILER_OUTPUT:/home/compiler/output \
   -v $ROOT_DIR/$COMPILER_ERROR:/home/compiler/error \
   tqlong/gcc:compiler