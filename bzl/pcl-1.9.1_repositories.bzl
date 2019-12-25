load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@com_github_nelhage_rules_boost//:boost/boost.bzl", "boost_deps")

def pcl_repositories():
    boost_deps()
    if "pcl" not in native.existing_rules():
        http_archive(
            name = "pcl",
            build_file = "@rules_pcl//:pcl.BUILD",
            sha256 = "0add34d53cd27f8c468a59b8e931a636ad3174b60581c0387abb98a9fc9cddb6",
            url = "https://github.com/PointCloudLibrary/pcl/archive/pcl-1.9.1.tar.gz",
            strip_prefix = "pcl-pcl-1.9.1",
        )

