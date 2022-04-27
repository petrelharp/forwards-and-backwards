#!/bin/bash

if [ ! -e lineage_plotting ]
    echo "Need lineage_plotting repository as a subdirectory."
    exit 1
fi

# smooth and patchy figures
for DIR in ex1a ex1b
do
    pushd $DIR
    if [ ! -e fkpp_123.trees ]
    then
        slim -s 123 ../fkpp.slim
    fi
    ../lineage_plotting/plot_density.py fkpp_123.trees 3
    popd
done
