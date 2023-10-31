load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("@bazel_tools//tools/build_defs/repo:utils.bzl", "maybe")

def pcl_repositories_non_module():
    """Depencies that haven't been converted to bzlmodules."""

    http_archive(
        name = "pcl",
        sha256 = "8ab98a9db371d822de0859084a375a74bdc7f31c96d674147710cf4101b79621",
        build_file = "@rules_pcl//third_party:pcl.bzlmod.BUILD",
        strip_prefix = "pcl-pcl-1.13.1",
        urls = ["https://github.com/PointCloudLibrary/pcl/archive/refs/tags/pcl-1.13.1.tar.gz"],
    )

    http_archive(
        name = "flann",
        build_file = "@rules_pcl//third_party:flann.BUILD",
        sha256 = "e26829bb0017f317d9cc45ab83ddcb8b16d75ada1ae07157006c1e7d601c8824",
        strip_prefix = "flann-1.9.2",
        urls = ["https://github.com/flann-lib/flann/archive/refs/tags/1.9.2.tar.gz"],
    )

    http_archive(
        name = "qhull",
        build_file = "@rules_pcl//third_party:qhull.BUILD",
        sha256 = "cf7235b76244595a86b9407b906e3259502b744528318f2178155e5899d6cf9f",
        strip_prefix = "qhull-2019.1",
        urls = ["https://github.com/qhull/qhull/archive/2019.1.tar.gz"],
    )

def pcl_repositories():
    # Latest commit as of: Dec 23, 2023
    # NOTE: We cannot update beyond this commit without breaking aarch64 support due to lzma.
    # See: https://github.com/nelhage/rules_boost/issues/374
    maybe(
        http_archive,
        name = "com_github_nelhage_rules_boost",
        sha256 = "490d11425393eed068966a4990ead1ff07c658f823fd982fddac67006ccc44ab",
        strip_prefix = "rules_boost-57c99395e15720e287471d79178d36a85b64d6f6",
        urls = ["https://github.com/nelhage/rules_boost/archive/57c99395e15720e287471d79178d36a85b64d6f6.tar.gz"],
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

    maybe(
        http_archive,
        name = "flann",
        build_file = "@rules_pcl//third_party:flann.BUILD",
        sha256 = "e26829bb0017f317d9cc45ab83ddcb8b16d75ada1ae07157006c1e7d601c8824",
        strip_prefix = "flann-1.9.2",
        urls = ["https://github.com/flann-lib/flann/archive/refs/tags/1.9.2.tar.gz"],
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
