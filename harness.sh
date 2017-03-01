#!/bin/bash

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

cat - <<EOF > checksum.sha1
6d0440856a2cbb6709a385b4db088a57c11a62a8  travis_0001.fastq
e590f0655464a7790a4998c7583ee915dc7ee2e4  travis_0001.maf
a53bd975f1afdfd70e14fc639e3020149ace3c8b  travis_0001.ref
EOF

shasum -c checksum.sha1
