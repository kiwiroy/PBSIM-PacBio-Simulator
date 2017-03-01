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

#shasum travis_*

cat - <<EOF > checksum.sha1
e09341fe1834ab6c2627c4d70dd9f717e5db0f45  travis_0001.fastq
e1dbb88b507c3884d28c1d1efa97e3417d695bb8  travis_0001.maf
a53bd975f1afdfd70e14fc639e3020149ace3c8b  travis_0001.ref
EOF

shasum -c checksum.sha1
