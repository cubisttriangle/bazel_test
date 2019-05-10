# Name this repo.
workspace( name = "bazel_cmake_test" )

# Enable skylark http_archives.
load( "@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive" )

# Enable skylark git_repositories.
load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository", "new_git_repository")

# Group the sources of the library so that CMake rules have access to it.
all_content = """filegroup(name = "all", srcs = glob(["**"]), visibility = ["//visibility:public"])"""

# bazel-skylb 0.8.0 released 2019.03.20 (https://github.com/bazelbuild/bazel-skylib/releases/tag/0.8.0)
# Need this for rules_foreign_cc.
skylib_version = "0.8.0"
http_archive(
    name = "bazel_skylib",
    type = "tar.gz",
    url = "https://github.com/bazelbuild/bazel-skylib/releases/download/{}/bazel-skylib.{}.tar.gz".format (skylib_version, skylib_version),
    sha256 = "2ef429f5d7ce7111263289644d233707dba35e39696377ebab8b0bc701f7818e",
)

# Rule repository. So we can build CMake projects.
http_archive(
   name = "rules_foreign_cc",
   strip_prefix = "rules_foreign_cc-master",
   url = "https://github.com/bazelbuild/rules_foreign_cc/archive/master.zip",
)
load("@rules_foreign_cc//:workspace_definitions.bzl", "rules_foreign_cc_dependencies")
rules_foreign_cc_dependencies( [
        "//:linux_aarch64",
        "//:linux_x86",
        "//:mac_x86",
    ],
    True )

# CMake
cmake_version = "3.14.3"
http_archive(
    name = "cmake",
    type = "tar.gz",
    urls = [ "https://github.com/Kitware/CMake/releases/download/v{0}/cmake-{0}.tar.gz".format( cmake_version ), ],
    build_file_content = all_content,
)

# Ignition transport.
http_archive(
    name = "ignition-transport",
    urls = [ "https://bitbucket.org/ignitionrobotics/ign-transport/get/ignition-transport6_6.0.0.zip", ],
    strip_prefix = "ignitionrobotics-ign-transport-527a03c930b3",
    build_file = "@//:external/ignition-transport.BUILD",
)

# Ignition msgs.
http_archive(
    name = "ignition-msgs",
    urls = [ "https://bitbucket.org/ignitionrobotics/ign-msgs/get/ignition-msgs3_3.2.0.zip", ],
    strip_prefix = "ignitionrobotics-ign-msgs-1640841acd7e",
    build_file = "@//:external/ignition-msgs.BUILD",
)

# Ignition math.
http_archive(
    name = "ignition-math",
    urls = [ "https://bitbucket.org/ignitionrobotics/ign-math/get/ignition-math6_6.2.0.zip", ],
    strip_prefix = "ignitionrobotics-ign-math-0417bf650df9",
    build_file = "@//:external/ignition-math.BUILD",
)

# Ignition cmake.
http_archive(
    name = "ignition-cmake",
    urls = [ "https://bitbucket.org/ignitionrobotics/ign-cmake/get/ignition-cmake2_2.0.0.zip", ],
    strip_prefix = "ignitionrobotics-ign-cmake-1ff49389e33c",
    build_file = "@//:external/ignition-cmake.BUILD",
)

# Ignition tools.
http_archive(
    name = "ignition-tools",
    urls = [ "https://bitbucket.org/ignitionrobotics/ign-tools/get/ignition-tools_0.1.0.zip", ],
    strip_prefix = "ignitionrobotics-ign-tools-e775d6356667",
    build_file = "@//:external/ignition-tools.BUILD",
)

# Google protobuf.
# https://github.com/protocolbuffers/protobuf/issues/5472
# https://github.com/protocolbuffers/protobuf/pull/5784
# TODO: Update to 3.8 when it comes out.
protobuf_ver = "3.8.0-rc1"
http_archive(
    name = "com_google_protobuf",
    urls = [ "https://github.com/protocolbuffers/protobuf/archive/v{}.zip".format( protobuf_ver ), ],
    strip_prefix = "protobuf-{}".format( protobuf_ver ),
)
load( "@com_google_protobuf//:protobuf_deps.bzl", "protobuf_deps" )
protobuf_deps()


# Google Test.
gtest_ver = "1.8.1"
http_archive(
    name = "gtest",
    urls = [ "https://github.com/google/googletest/archive/release-{}.zip".format( gtest_ver ), ],
    strip_prefix = "googletest-release-{}".format( gtest_ver ),
    build_file = "@//:external/gtest.BUILD",
)
