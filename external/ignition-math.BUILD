load("@rules_foreign_cc//tools/build_defs:cmake.bzl", "cmake_external")

filegroup(name = "all", srcs = glob(["**"]), visibility = ["//visibility:public"])

cmake_external(
    name = "ignition_math_cmake",
    lib_source = "all",
    cache_entries = { "CMAKE_PREFIX_PATH": "$EXT_BUILD_DEPS/ignition_cmake_cmake/share/cmake/ignition-cmake2" },
    shared_libraries = [ "libignition-math6.so", ],
    make_commands = [
        "cmake",
        "make",
        "make install",
    ],
    deps = [ "@ignition-cmake//:ignition_cmake_cmake", ],
)

cc_library(
    name = "ignition-math",
    strip_include_prefix = "include",
    copts = [ "-Iexternal/ignition-math/copy_ignition_math_cmake/ignition_math_cmake/include/ignition/math6", ],
    hdrs = glob( [ "include/**/*.hh", ] ),
    deps = [ "ignition_math_cmake", ],
    visibility = [ "//visibility:public" ],
)
