# Create dependency folder
# mkdir dependencies
cd dependencies

# LLVM
# ########################
# Pull project
# git clone https://github.com/llvm/llvm-project.git
cd llvm-project
# git checkout release/7.x

# Build
# mkdir build
cd build
cmake ../llvm -DLLVM_ENABLE_PROJECTS=clang
make -j 8 libclang libllvm
make -j 8 opt
make -j 8 clang
make -j 8 clang-format
cd ..

# Leave LLVM project
cd ..

# Leave dependency folder
cd ..
