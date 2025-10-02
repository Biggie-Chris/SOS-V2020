# Distributed under the OSI-approved BSD 3-Clause License.  See accompanying
# file Copyright.txt or https://cmake.org/licensing for details.

cmake_minimum_required(VERSION 3.5)

file(MAKE_DIRECTORY
  "/home/chris/Desktop/AOS_project/SOS-V2020/build/projects/libpicotcp/picotcp_external"
  "/home/chris/Desktop/AOS_project/SOS-V2020/build/projects/libpicotcp/picotcp_external-prefix/src/picotcp_external-build"
  "/home/chris/Desktop/AOS_project/SOS-V2020/build/projects/libpicotcp/picotcp_external-prefix"
  "/home/chris/Desktop/AOS_project/SOS-V2020/build/projects/libpicotcp/picotcp_external-prefix/tmp"
  "/home/chris/Desktop/AOS_project/SOS-V2020/build/projects/libpicotcp/picotcp_external-prefix/src/picotcp_external-stamp"
  "/home/chris/Desktop/AOS_project/SOS-V2020/build/projects/libpicotcp/picotcp_external-prefix/src"
  "/home/chris/Desktop/AOS_project/SOS-V2020/build/projects/libpicotcp/picotcp_external-prefix/src/picotcp_external-stamp"
)

set(configSubDirs )
foreach(subDir IN LISTS configSubDirs)
    file(MAKE_DIRECTORY "/home/chris/Desktop/AOS_project/SOS-V2020/build/projects/libpicotcp/picotcp_external-prefix/src/picotcp_external-stamp/${subDir}")
endforeach()
if(cfgdir)
  file(MAKE_DIRECTORY "/home/chris/Desktop/AOS_project/SOS-V2020/build/projects/libpicotcp/picotcp_external-prefix/src/picotcp_external-stamp${cfgdir}") # cfgdir has leading slash
endif()
