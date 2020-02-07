#!/bin/bash

check_for_root(){
        if [ "$EUID" -ne 0 ]
                then echo "Execute this script as root"
                exit 1
        fi
}
check_for_correct_dir(){
        if [ ! -d "../c/miner_llvm_pass/src" ]; then
                echo "Execute this script in the \"/setupScripts\" subdirectory of the ML-CodeGraph repository"
                exit 1
        fi
}
check_for_spaces_in_path(){
if [[ "$BASEDIR" == *" "* ]]; then
        echo "Execute this script in a directory without spaces in its path";
        exit 1
fi
}


check_converter(){
        if [ -f "../c/ConvertToExactRepresentation/build/bin/ConvertToExactRepresentation" ]; then
                CONVERTER_STATUS=0
        else
                CONVERTER_STATUS=1
        fi
}
install_miner(){
        cd ../c/miner_llvm_pass
        mkdir build
        cd build
        cmake ..
        make
        cd $BASEDIR
        chmod 777 -R ../c/miner_llvm_pass/build
}


install_converter(){
        cd ../c/ConvertToExactRepresentation
        mkdir build
        cd build
        cmake ..
        make
        cd $BASEDIR
        chmod 777 -R ../c/ConvertToExactRepresentation/build
}
check_miner(){
        if [ -f "../c/miner_llvm_pass/build/bin/miner" ]; then
                MINER_STATUS=0          
        else
                MINER_STATUS=1
        fi
}


miner_install_procedure(){
        check_miner
        if [ 1 == $MINER_STATUS ]; then
                echo "Checking for miner: not built"
                echo "Building miner (this may take up to one minute)"
                install_miner &> $OUTPUT_DIR
                check_miner
                if [ 1 == $MINER_STATUS ]; then
                        echo "Unable to build miner. See \"$OUTPUT_DIR\" for more information"
                        exit 1
                else
                        rm $OUTPUT_DIR &> /dev/null
                        echo "Successfully built miner"
                fi

        else
                echo "Checking for miner: already built"
        fi

}


converter_install_procedure(){
        check_converter
        if [ 1 == $CONVERTER_STATUS ]; then
                echo "Checking for converter: not built"
                echo "Building converter (this may take up to one minute)"
                install_converter &> $OUTPUT_DIR
                check_converter
                if [ 1 == $CONVERTER_STATUS ]; then
                        echo "Unable to build converter. See \"$OUTPUT_DIR\" for more information"
                        exit 1
                else
                        rm $OUTPUT_DIR &> /dev/null
                        echo "Successfully built converter"
                fi

        else
                echo "Checking for converter: already built"
        fi

}
check_for_root
BASEDIR=$(realpath .)
OUTPUT_DIR=$(realpath ./installationOutput.txt)

check_for_spaces_in_path
check_for_correct_dir

miner_install_procedure
converter_install_procedure

echo "Miner and converter have been built/installed"
