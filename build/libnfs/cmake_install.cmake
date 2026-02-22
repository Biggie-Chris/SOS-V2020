# Install script for directory: /home/dev/projects/SOS-V2020/libnfs

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/dev/projects/SOS-V2020/build/staging")
endif()
string(REGEX REPLACE "/$" "" CMAKE_INSTALL_PREFIX "${CMAKE_INSTALL_PREFIX}")

# Set the install configuration name.
if(NOT DEFINED CMAKE_INSTALL_CONFIG_NAME)
  if(BUILD_TYPE)
    string(REGEX REPLACE "^[^A-Za-z0-9_]+" ""
           CMAKE_INSTALL_CONFIG_NAME "${BUILD_TYPE}")
  else()
    set(CMAKE_INSTALL_CONFIG_NAME "Debug")
  endif()
  message(STATUS "Install configuration: \"${CMAKE_INSTALL_CONFIG_NAME}\"")
endif()

# Set the component getting installed.
if(NOT CMAKE_INSTALL_COMPONENT)
  if(COMPONENT)
    message(STATUS "Install component: \"${COMPONENT}\"")
    set(CMAKE_INSTALL_COMPONENT "${COMPONENT}")
  else()
    set(CMAKE_INSTALL_COMPONENT)
  endif()
endif()

# Is this installation the result of a crosscompile?
if(NOT DEFINED CMAKE_CROSSCOMPILING)
  set(CMAKE_CROSSCOMPILING "TRUE")
endif()

# Set default install directory permissions.
if(NOT DEFINED CMAKE_OBJDUMP)
  set(CMAKE_OBJDUMP "/usr/bin/aarch64-linux-gnu-objdump")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/include/nfsc")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/include" TYPE DIRECTORY FILES "/home/dev/projects/SOS-V2020/libnfs/include/nfsc")
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/include/nfsc/libnfs-raw-mount.h;/usr/local/include/nfsc/libnfs-raw-nfs.h;/usr/local/include/nfsc/libnfs-raw-nlm.h;/usr/local/include/nfsc/libnfs-raw-nsm.h;/usr/local/include/nfsc/libnfs-raw-portmap.h;/usr/local/include/nfsc/libnfs-raw-rquota.h")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/include/nfsc" TYPE FILE FILES
    "/home/dev/projects/SOS-V2020/libnfs/mount/libnfs-raw-mount.h"
    "/home/dev/projects/SOS-V2020/libnfs/nfs/libnfs-raw-nfs.h"
    "/home/dev/projects/SOS-V2020/libnfs/nlm/libnfs-raw-nlm.h"
    "/home/dev/projects/SOS-V2020/libnfs/nsm/libnfs-raw-nsm.h"
    "/home/dev/projects/SOS-V2020/libnfs/portmap/libnfs-raw-portmap.h"
    "/home/dev/projects/SOS-V2020/libnfs/rquota/libnfs-raw-rquota.h"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/lib/cmake/libnfs/FindNFS.cmake;/usr/local/lib/cmake/libnfs/libnfs-config-version.cmake")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/lib/cmake/libnfs" TYPE FILE FILES
    "/home/dev/projects/SOS-V2020/libnfs/cmake/FindNFS.cmake"
    "/home/dev/projects/SOS-V2020/build/libnfs/libnfs-config-version.cmake"
    )
endif()

if(CMAKE_INSTALL_COMPONENT STREQUAL "Unspecified" OR NOT CMAKE_INSTALL_COMPONENT)
  list(APPEND CMAKE_ABSOLUTE_DESTINATION_FILES
   "/usr/local/lib/pkgconfig/libnfs.pc")
  if(CMAKE_WARN_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(WARNING "ABSOLUTE path INSTALL DESTINATION : ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  if(CMAKE_ERROR_ON_ABSOLUTE_INSTALL_DESTINATION)
    message(FATAL_ERROR "ABSOLUTE path INSTALL DESTINATION forbidden (by caller): ${CMAKE_ABSOLUTE_DESTINATION_FILES}")
  endif()
  file(INSTALL DESTINATION "/usr/local/lib/pkgconfig" TYPE FILE FILES "/home/dev/projects/SOS-V2020/build/libnfs/libnfs.pc")
endif()

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/dev/projects/SOS-V2020/build/libnfs/mount/cmake_install.cmake")
  include("/home/dev/projects/SOS-V2020/build/libnfs/nfs/cmake_install.cmake")
  include("/home/dev/projects/SOS-V2020/build/libnfs/nfs4/cmake_install.cmake")
  include("/home/dev/projects/SOS-V2020/build/libnfs/nlm/cmake_install.cmake")
  include("/home/dev/projects/SOS-V2020/build/libnfs/nsm/cmake_install.cmake")
  include("/home/dev/projects/SOS-V2020/build/libnfs/portmap/cmake_install.cmake")
  include("/home/dev/projects/SOS-V2020/build/libnfs/rquota/cmake_install.cmake")
  include("/home/dev/projects/SOS-V2020/build/libnfs/lib/cmake_install.cmake")

endif()

