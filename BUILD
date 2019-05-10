package( default_visibility = [ "//visibility:public" ] )

toolchain(
    name = "mac_x86",
    exec_compatible_with = [
        "@bazel_tools//platforms:osx",
        "@bazel_tools//platforms:x86_64",
    ],
    toolchain = "@rules_foreign_cc//tools/build_defs/native_tools:built_cmake",
    toolchain_type = "@rules_foreign_cc//tools/build_defs:cmake_toolchain",
)

toolchain(
    name = "linux_x86",
    exec_compatible_with = [
        "@bazel_tools//platforms:linux",
        "@bazel_tools//platforms:x86_64",
    ],
    toolchain = "@rules_foreign_cc//tools/build_defs/native_tools:built_cmake",
    toolchain_type = "@rules_foreign_cc//tools/build_defs:cmake_toolchain",
)

toolchain(
    name = "linux_aarch64",
    exec_compatible_with = [
        "@bazel_tools//platforms:linux",
        "@bazel_tools//platforms:aarch64",
    ],
    toolchain = "@rules_foreign_cc//tools/build_defs/native_tools:built_cmake",
    toolchain_type = "@rules_foreign_cc//tools/build_defs:cmake_toolchain",
)

config_setting(
    name = "on_mac",
    constraint_values = [ "@bazel_tools//platforms:mac_x86", ],
)

config_setting(
    name = "on_linux",
    constraint_values = [ "@bazel_tools//platforms:linux_x86", ],
)

config_setting(
    name = "on_arm",
    constraint_values = [ "@bazel_tools//platforms:aarch64", ],
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
    copts = [
       "-I$(GENDIR)/external/ignition-math/ignition_math_cmake/include/ignition/math6",
#       "-I$(GENDIR)/external/ignition-msgs/ignition_msgs_cmake/include",
    ],
    deps = [
        "@ignition-math//:ignition-math",
#        "@ignition-msgs//:ignition-msgs",
    ],
)
