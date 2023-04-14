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
    ../lineage_plotting/plot_density.py fkpp_123.trees 3 pdf 3 0.0
    popd
done

# smooth and patchy expanding wave lineages
for DIR in ex2a ex2b
do
    pushd $DIR
    if [ ! -e pme_123.trees ]
    then
        slim -s 123 ../pme.slim
    fi
    ../lineage_plotting/plot_1d_lineages.py pme_123.trees 3 1 3 3
    ../lineage_plotting/pme/plot_pme_density.py pme_123.trees 45 55 6
    popd
done

# comparison of three wave models
for MODEL in fkpp pme allen-cahn
do
    DIR="ex3_${MODEL}"
    pushd $DIR
    if [ ! -e ${MODEL}_123.trees ]
    then
        slim -s 123 ../${MODEL}.slim
    fi
    ../lineage_plotting/plot_1d_lineages.py ${MODEL}_123.trees 3 1 3 3
    popd
done

# clumpiness
DIR="clumpy_2d"
MODEL="clumpy"
pushd $DIR
if [ ! -e ${MODEL}_123.trees ]
then
    slim -s 123 ../${MODEL}.slim
    ../lineage_plotting/plot_density.py ${MODEL}_123.trees 3 pdf 3 0.0
fi
popd
DIR="clumpy_1d"
MODEL="clumpy"
pushd $DIR
if [ ! -e ${MODEL}_123.trees ]
then
    slim -s 123 ../${MODEL}.slim
    ../lineage_plotting/plot_density.py ${MODEL}_123.trees 3 pdf 3 0.0
    ../plot_wave.py ${MODEL}_123.trees
fi
popd
