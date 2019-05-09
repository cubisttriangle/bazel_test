load("@rules_foreign_cc//tools/build_defs:cmake.bzl", "cmake_external")

filegroup(name = "all", srcs = glob(["**"]), visibility = ["//visibility:public"])

cmake_external(
    name = "ignition_math_cmake",
    lib_source = "all",
    cache_entries = {
        "CMAKE_PREFIX_PATH": "$EXT_BUILD_DEPS/ignition_cmake_cmake/share/cmake/ignition-cmake2",
        "BUILD_STATIC_LIBS": "ON",
        "BUILD_SHARED_LIBS": "OFF",
    },
    static_libraries = [ "libignition-math6.a", ],
    deps = [ "@ignition-cmake//:ignition_cmake_cmake", ],
)

cc_library(
    name = "ignition-math",
    strip_include_prefix = "include",
    hdrs = glob( [ "include/**/*.hh", ] ),
    deps = [ "ignition_math_cmake", ],
    visibility = [ "//visibility:public" ],
)
