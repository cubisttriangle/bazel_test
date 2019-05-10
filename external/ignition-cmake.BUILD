load( "@rules_foreign_cc//tools/build_defs:cmake.bzl", "cmake_external" )

filegroup( name = "all", srcs = glob( [ "**" ] ), visibility = [ "//visibility:public" ] )

cmake_external(
    name = "ignition_cmake_cmake",
    lib_source = "all",
    deps = [],
    headers_only = True,
)

cc_library(
    name = "ignition-cmake",
    strip_include_prefix = "include",
    hdrs = glob( [ "include/**/*.hh", ] ),
    deps = [ "ignition_cmake_cmake", ],
    visibility = [ "//visibility:public" ],
)
