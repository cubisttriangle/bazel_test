package( default_visibility = [ "//visibility:public" ] )

toolchain(
    name = "built_cmake_toolchain",
    exec_compatible_with = [
        "@bazel_tools//platforms:osx",
        "@bazel_tools//platforms:x86_64",
    ],
    toolchain = "@rules_foreign_cc//tools/build_defs/native_tools:built_cmake",
    toolchain_type = "@rules_foreign_cc//tools/build_defs:cmake_toolchain",
)

load( "@rules_foreign_cc//for_workspace:cmake_build.bzl", "cmake_tool" )

cmake_tool(
    name = "cmaketool",
    cmake_srcs = "@cmake//:all",
)

load( "@rules_foreign_cc//tools/build_defs:cmake.bzl", "cmake_external" )

cc_binary(
    name = "main",
    srcs = [ "test.cc", ],
    copts = [ "-I$(GENDIR)/external/ignition-math/ignition_math_cmake/include/ignition/math6", ],
    deps = [ "@ignition-math//:ignition-math", ],
)
