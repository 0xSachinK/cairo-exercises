#! bash
filename=$1

mkdir -p outputs

cairo-compile src/$filename.cairo --output outputs/$filename.json

cairo-run --program=outputs/$filename.json --print_output --layout=small