cmake_minimum_required(VERSION 3.28)

project(
  ModernCMakeExample
  VERSION 1.0
  LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_EXTENSIONS OFF)

find_program(IWYU_PATH NAMES include-what-you-use iwyu)

if(IWYU_PATH)
    set(CMAKE_CXX_INCLUDE_WHAT_YOU_USE 
    ${IWYU_PATH}
    -Wno-unknown-warning-option    # ignore unknown options
    -Xiwyu --max_line_length=120   # 120 chars wide
    -Xiwyu --comment_style=long    # more details 
    -Xiwyu --no_fwd_decls          # no forward declaration suggestions
    -Xiwyu --mapping_file=${PROJECT_SOURCE_DIR}/inoutmapping.imp  # mapping file
    )  
endif()

add_executable(example "src/main.cpp")

target_include_directories(example        PUBLIC "inc_inside")
target_include_directories(example SYSTEM PUBLIC "inc_outside")