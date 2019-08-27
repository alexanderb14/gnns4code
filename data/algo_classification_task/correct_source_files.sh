#!/usr/bin/env zsh

for FILE (c/*/*.txt) { 
    echo $FILE
    cat header.cpp $FILE > $FILE.cpp
    
    gsed -i '/\(int main\|void main\)/!s/main/int main/g; s/void main/int main/g' $FILE.cpp
}

