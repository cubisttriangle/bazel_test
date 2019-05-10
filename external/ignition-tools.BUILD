load("@rules_foreign_cc//tools/build_defs:cmake.bzl", "cmake_external")

filegroup(name = "all", srcs = glob(["**"]), visibility = ["//visibility:public"])

cmake_external(
    name = "ignition_tools_cmake",
    lib_source = "all",
    headers_only = True,
    deps = [ "@ignition-cmake//:ignition-cmake", ],
)

cc_library(
    name = "ignition-tools",
    #strip_include_prefix = "include",
    hdrs = glob( [ "include/**/*.hh", ] ),
    deps = [ "ignition_tools_cmake", ],
    visibility = [ "//visibility:public" ],
)
