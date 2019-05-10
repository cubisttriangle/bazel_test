load( "@rules_foreign_cc//tools/build_defs:cmake.bzl", "cmake_external" )

filegroup( name = "all", srcs = glob( [ "**" ] ), visibility = [ "//visibility:public" ] )

cmake_external(
    name = "ignition_msgs_cmake",
    lib_source = "all",
    cache_entries = {
        "CMAKE_PREFIX_PATH": "$EXT_BUILD_DEPS/ignition_cmake_cmake/share/cmake/ignition-cmake2",
        "ENABLE_TESTS_COMPILATION": "false",
        "BUILD_STATIC_LIBS": "ON",
        "BUILD_SHARED_LIBS": "OFF",
    },
    static_libraries = [ "libignition-msgs6.a", ],
    deps = [
        "@ignition-math//:ignition-math",
        "@ignition-tools//:ignition-tools",
        "@com_google_protobuf//:protobuf",
    ],
)

cc_library(
    name = "ignition-msgs",
    strip_include_prefix = "include",
    hdrs = glob( [ "include/**/*.hh", ] ),
    deps = [ "ignition_msgs_cmake", ],
    visibility = [ "//visibility:public" ],
)
