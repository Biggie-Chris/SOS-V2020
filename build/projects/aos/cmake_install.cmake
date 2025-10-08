# Install script for directory: /home/chris/Desktop/SOS-V2020/projects/aos

# Set the install prefix
if(NOT DEFINED CMAKE_INSTALL_PREFIX)
  set(CMAKE_INSTALL_PREFIX "/home/chris/Desktop/SOS-V2020/build/staging")
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

if(NOT CMAKE_INSTALL_LOCAL_ONLY)
  # Include the install script for each subdirectory.
  include("/home/chris/Desktop/SOS-V2020/build/projects/aos/apps/tty_test/cmake_install.cmake")
  include("/home/chris/Desktop/SOS-V2020/build/projects/aos/apps/sosh/cmake_install.cmake")
  include("/home/chris/Desktop/SOS-V2020/build/projects/aos/apps/hello/cmake_install.cmake")
  include("/home/chris/Desktop/SOS-V2020/build/projects/aos/apps/cuckoo/cmake_install.cmake")
  include("/home/chris/Desktop/SOS-V2020/build/projects/aos/apps/clock_test/cmake_install.cmake")
  include("/home/chris/Desktop/SOS-V2020/build/projects/aos/sos/cmake_install.cmake")
  include("/home/chris/Desktop/SOS-V2020/build/projects/aos/libaos/cmake_install.cmake")
  include("/home/chris/Desktop/SOS-V2020/build/projects/aos/libclock/cmake_install.cmake")
  include("/home/chris/Desktop/SOS-V2020/build/projects/aos/libethernet/cmake_install.cmake")
  include("/home/chris/Desktop/SOS-V2020/build/projects/aos/libsel4cspace/cmake_install.cmake")
  include("/home/chris/Desktop/SOS-V2020/build/projects/aos/libserial/cmake_install.cmake")
  include("/home/chris/Desktop/SOS-V2020/build/projects/aos/libsosapi/cmake_install.cmake")

endif()

