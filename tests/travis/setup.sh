#!/bin/bash

if [ ${TASK} == "lint" ]; then
    if [ ${TRAVIS_OS_NAME} == "osx" ]; then
        wget -O conda.sh https://repo.continuum.io/miniconda/Miniconda3-latest-MacOSX-x86_64.sh
    else
        wget -O conda.sh https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
    fi
    bash conda.sh -b -p $HOME/miniconda
    export PATH="$HOME/miniconda/bin:$PATH"
    hash -r
    conda config --set always_yes yes --set changeps1 no
    conda update -q conda
    # Useful for debugging any issues with conda
    conda info -a
    conda create -n python3 python=3.7
fi


if [ ${TASK} == "python_test" ] || [ ${TASK} == "python_lightweight_test" ] || [ ${TASK} ==  "distributed_test" ]; then
    if [ ${TRAVIS_OS_NAME} == "osx" ]; then
        wget -O conda.sh https://repo.continuum.io/miniconda/Miniconda3-latest-MacOSX-x86_64.sh
    else
        wget -O conda.sh https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh
    fi
    bash conda.sh -b -p $HOME/miniconda
    export PATH="$HOME/miniconda/bin:$PATH"
    hash -r
    conda config --set always_yes yes --set changeps1 no
    conda update -q conda
    # Useful for debugging any issues with conda
    conda info -a
    conda create -n python3 python=3.7
    conda create -n python2 python=2.7
fi
