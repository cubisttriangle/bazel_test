load("@rules_foreign_cc//tools/build_defs:cmake.bzl", "cmake_external")

filegroup(name = "all", srcs = glob(["**"]), visibility = ["//visibility:public"])

cmake_external(
    name = "ignition_math_cmake",
    lib_source = "all",
    cache_entries = { "CMAKE_PREFIX_PATH": "$BUILD_TMPDIR" },
    deps = [ "@ignition-cmake//:ignition-cmake", ],
)

cc_library(
    name = "ignition-math",
    strip_include_prefix = "include",
    hdrs = glob( [ "include/**/*.hh", ] ),
    deps = [
        "ignition_math_cmake",
        "@ignition-cmake//:ignition-cmake",
     ],
    linkstatic = True,
    visibility = [ "//visibility:public" ],
)
