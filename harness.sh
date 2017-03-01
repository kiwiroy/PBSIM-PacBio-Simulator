#!/bin/bash

set -x

DIR=$(mktemp -d)
SEED=42
DEPTH=20

./src/pbsim --prefix $DIR/travis \
  --seed $SEED \
  --data-type CLR \
  --depth $DEPTH \
  --model_qc data/model_qc_clr \
  sample/sample.fasta

cd $DIR

shasum travis_*

cat - <<EOF > checksum.sha1
c4f63e19be859372c707d8c7acbed13dc4d1705b  travis_0001.fastq
c56e7b5ff1019ec26efcc844fadc55f8f2a02d03  travis_0001.maf
a53bd975f1afdfd70e14fc639e3020149ace3c8b  travis_0001.ref
EOF

shasum -c checksum.sha1
