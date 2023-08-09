load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

def pcl_repositories():
    # Latest commit as of: June 20, 2023
    maybe(
        http_archive,
        name = "com_github_nelhage_rules_boost",
        sha256 = "8d3b0100de31bfdc8cf3ac2b0ed10a0d87403707fa18cf384a103077655d6cf1",
        strip_prefix = "rules_boost-84d2e305b0bc2dce19af4ddc2a8f76f84af4d3fa",
        urls = ["https://github.com/nelhage/rules_boost/archive/84d2e305b0bc2dce19af4ddc2a8f76f84af4d3fa.tar.gz"],
    )

    maybe(
        http_archive,
        name = "com_google_googletest",
        sha256 = "8ad598c73ad796e0d8280b082cebd82a630d73e73cd3c70057938a6501bba5d7",
        strip_prefix = "googletest-1.14.0",
        urls = ["https://github.com/google/googletest/archive/refs/tags/v1.14.0.tar.gz"],
    )

    maybe(
        http_archive,
        name = "eigen",
        build_file = "@rules_pcl//third_party:eigen.BUILD",
        sha256 = "8586084f71f9bde545ee7fa6d00288b264a2b7ac3607b974e54d13e7162c1c72",
        strip_prefix = "eigen-3.4.0",
        urls = ["https://gitlab.com/libeigen/eigen/-/archive/3.4.0/eigen-3.4.0.tar.gz"],
    )

    # Latest commit as of April 6, 2019
    maybe(
        http_archive,
        name = "flann",
        build_file = "@rules_pcl//third_party:flann.BUILD",
        sha256 = "9080a91be5759a0b4ef41f62e58896a714ec85d37c2567341a0503039655b1eb",
        strip_prefix = "flann-1d04523268c388dabf1c0865d69e1b638c8c7d9d",
        urls = ["https://github.com/flann-lib/flann/archive/1d04523268c388dabf1c0865d69e1b638c8c7d9d.tar.gz"],
    )

    maybe(
        http_archive,
        name = "lz4",
        build_file = "@rules_pcl//third_party:lz4.BUILD",
        sha256 = "0b0e3aa07c8c063ddf40b082bdf7e37a1562bda40a0ff5272957f3e987e0e54b",
        strip_prefix = "lz4-1.9.4",
        urls = ["https://github.com/lz4/lz4/archive/refs/tags/v1.9.4.tar.gz"],
    )

    maybe(
        http_archive,
        name = "net_zlib_zlib",
        sha256 = "6d4d6640ca3121620995ee255945161821218752b551a1a180f4215f7d124d45",
        build_file = "@rules_pcl//third_party:zlib.BUILD",
        strip_prefix = "zlib-cacf7f1d4e3d44d871b605da3b647f07d718623f",
        urls = [
            "https://mirror.bazel.build/github.com/madler/zlib/archive/cacf7f1d4e3d44d871b605da3b647f07d718623f.tar.gz",
            "https://github.com/madler/zlib/archive/cacf7f1d4e3d44d871b605da3b647f07d718623f.tar.gz",
        ],
    )

    maybe(
        http_archive,
        name = "org_libpng_libpng",
        build_file = "@rules_pcl//third_party:libpng.BUILD",
        sha256 = "7f415186d38ca71c23058386d7cf5135c8beda821ee1beecdc2a7a26c0356615",
        strip_prefix = "libpng-1.2.57",
        urls = [
            "https://github.com/glennrp/libpng/archive/v1.2.57.tar.gz",
            "https://mirror.bazel.build/github.com/glennrp/libpng/archive/v1.2.57.tar.gz",
        ],
    )

    maybe(
        http_archive,
        name = "pcl",
        sha256 = "8ab98a9db371d822de0859084a375a74bdc7f31c96d674147710cf4101b79621",
        build_file = "@rules_pcl//third_party:pcl.BUILD",
        strip_prefix = "pcl-pcl-1.13.1",
        urls = ["https://github.com/PointCloudLibrary/pcl/archive/refs/tags/pcl-1.13.1.tar.gz"],
    )

    maybe(
        http_archive,
        name = "qhull",
        build_file = "@rules_pcl//third_party:qhull.BUILD",
        sha256 = "cf7235b76244595a86b9407b906e3259502b744528318f2178155e5899d6cf9f",
        strip_prefix = "qhull-2019.1",
        urls = ["https://github.com/qhull/qhull/archive/2019.1.tar.gz"],
    )
