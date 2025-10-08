#
# Copyright 2019, Data61
# Commonwealth Scientific and Industrial Research Organisation (CSIRO)
# ABN 41 687 119 230.
#
# This software may be distributed and modified according to the terms of
# the GNU General Public License version 2. Note that NO WARRANTY is provided.
# See "LICENSE_GPLv2.txt" for details.
#
# @TAG(DATA61_GPL)
#
cmake_minimum_required(VERSION 3.7.2)

project(clock_test C)

add_compile_options(-Wall -g3 -O0)

add_executable(clock_test EXCLUDE_FROM_ALL src/clock_test.c)
target_link_libraries(clock_test sel4runtime muslc sel4 sosapi)

add_app(clock_test)
