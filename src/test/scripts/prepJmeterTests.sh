#!/bin/sh
source /etc/profile

die () {
    echo >&2 "$@"
    exit 1
}

[ "$#" -eq 3 ] || die "3 arguments required <test.dir> <template.dir> <hostname>, $# provided;  Example: prepJmeterTests.sh ./src/test/release ./src/test/templates srwd62.com"

echo "prepJmeterTests called with: $@"

TEST_DIR=$1
TEMPLATE_DIR=$2
MY_HOST=$3

##  For each file in template directory, change the MY_HOSTNAME token to the supplied hostname and then copy/replace that into the test directory
for file in `find $TEMPLATE_DIR -name *.jmx`
do
	FILENAME=`basename $file`
	cp -f $file $TEST_DIR/temp_$FILENAME
	sed s/MY_HOSTNAME/"$MY_HOST"/g $TEST_DIR/temp_$FILENAME > $TEST_DIR/$FILENAME
	rm $TEST_DIR/temp_$FILENAME
done

