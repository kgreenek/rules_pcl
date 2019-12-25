load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")


def pcl_repositories():
    _maybe_repo(
        http_archive,
        name = "com_github_nelhage_rules_boost",
        sha256 = "b64e6f7e96c5b0d7ebcb74c5ee29ab879b8ef8c37581ed0be5ff6c23168da985",
        strip_prefix = "rules_boost-ed844db5990d21b75dc3553c057069f324b3916b",
        url = "https://github.com/nelhage/rules_boost/archive/ed844db5990d21b75dc3553c057069f324b3916b.tar.gz",
    )

    _maybe_repo(
        http_archive,
        name = "eigen",
        build_file = "@rules_pcl//third_party:eigen.BUILD",
        sha256 = "d56fbad95abf993f8af608484729e3d87ef611dd85b3380a8bad1d5cbc373a57",
        strip_prefix = "eigen-3.3.7",
        url = "https://gitlab.com/libeigen/eigen/-/archive/3.3.7/eigen-3.3.7.tar.gz",
    )

    _maybe_repo(
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

    _maybe_repo(
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

    _maybe_repo(
        http_archive,
        name = "pcl",
        build_file = "@rules_pcl//third_party:pcl.BUILD",
        sha256 = "0add34d53cd27f8c468a59b8e931a636ad3174b60581c0387abb98a9fc9cddb6",
        url = "https://github.com/PointCloudLibrary/pcl/archive/pcl-1.9.1.tar.gz",
        strip_prefix = "pcl-pcl-1.9.1",
    )


def _maybe_repo(repo_rule, name, **kwargs):
    """A wrapper around repo rules to prevent adding a rule if it already exists, e.g. if it was
        already added to a user's WORKSPACE file by other dependencies.
    """
    if name not in native.existing_rules():
        repo_rule(name = name, **kwargs)
