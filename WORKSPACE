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
rules_foreign_cc_dependencies( [ "//:built_cmake_toolchain" ], True )

# CMake
cmake_version = "3.14.3"
http_archive(
    name = "cmake",
    type = "tar.gz",
    urls = [ "https://github.com/Kitware/CMake/releases/download/v{0}/cmake-{0}.tar.gz".format( cmake_version ), ],
    build_file_content = all_content,
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
