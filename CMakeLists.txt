cmake_minimum_required(VERSION 2.6)
project(GUDHIExCudaPersCohom)

# problem with Visual Studio link on Boost program_options
#add_definitions( -DBOOST_ALL_NO_LIB )
#add_definitions( -DBOOST_ALL_DYN_LINK )

add_executable(rips_persistence_cuda rips_persistence.cu)
# target_link_libraries(rips_persistence ${Boost_SYSTEM_LIBRARY} ${Boost_PROGRAM_OPTIONS_LIBRARY})
add_test(rips_persistence_3 ${CMAKE_CURRENT_BINARY_DIR}/rips_persistence_cuda ${CMAKE_SOURCE_DIR}/data/points/Kl.txt -r 0.2 -d 3 -p 3 -m 100)
