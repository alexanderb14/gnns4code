cmake_minimum_required(VERSION 3.4)
project(ConvertToExactRepresentation)

set(CMAKE_CXX_STANDARD 14)

#add_executable(ConvertToExactRepresentation main.cpp)

cmake_minimum_required(VERSION 3.4)

find_package(LLVM 6.0 REQUIRED CONFIG)
add_definitions(${LLVM_DEFINITIONS})
include_directories(${LLVM_INCLUDE_DIRS})
link_directories(${LLVM_LIBRARY_DIRS})

set(CMAKE_ARCHIVE_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_LIBRARY_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/lib)
set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)

# list source files here
#set(miner_src miner.cc funcinfo.cc)
set(ConvertToExactRepresentation_src main.cpp)
add_library(ConvertToExactRepresentation_pass MODULE
        ${ConvertToExactRepresentation_src}
        )

# Use C++11 to compile your pass (i.e., supply -std=c++11).
target_compile_features(ConvertToExactRepresentation_pass PRIVATE
        cxx_range_for cxx_auto_type
        )

# LLVM is (typically) built with no C++ RTTI. We need to match that;
# otherwise, we'll get linker errors about missing RTTI data.
set_target_properties(ConvertToExactRepresentation_pass PROPERTIES
        COMPILE_FLAGS "-fno-rtti -Wall -Wextra"
        )

# Get proper shared-library behavior (where symbols are not necessarily
# resolved when the shared library is linked) on OS X.
if(APPLE)
    set_target_properties(ConvertToExactRepresentation_pass PROPERTIES
            LINK_FLAGS "-undefined dynamic_lookup"
            )
endif(APPLE)


add_executable(ConvertToExactRepresentation
        main.cpp ${ConvertToExactRepresentation_src}
        )

llvm_map_components_to_libnames(REQ_LLVM_LIBRARIES ${LLVM_TARGETS_TO_BUILD}
        asmparser core linker bitreader irreader ipo scalaropts
        analysis support
        )

target_link_libraries(ConvertToExactRepresentation ${REQ_LLVM_LIBRARIES})

set_target_properties(ConvertToExactRepresentation PROPERTIES
        LINKER_LANGUAGE CXX
        PREFIX ""
        COMPILE_FLAGS "-fno-rtti -Wall -Wextra"
        )

target_compile_features(ConvertToExactRepresentation PRIVATE
        cxx_range_for cxx_auto_type
        )

