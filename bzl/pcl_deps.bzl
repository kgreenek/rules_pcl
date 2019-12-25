load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")
load("//bzl:maybe.bzl", "pcl_maybe")


def pcl_deps():
    pcl_maybe(
        http_archive,
        name = "eigen",
        build_file = "@rules_pcl//:eigen.BUILD",
        sha256 = "d56fbad95abf993f8af608484729e3d87ef611dd85b3380a8bad1d5cbc373a57",
        url = "https://gitlab.com/libeigen/eigen/-/archive/3.3.7/eigen-3.3.7.tar.gz",
        strip_prefix = "eigen-3.3.7",
    )

    pcl_maybe(
        http_archive,
        name = "com_github_nelhage_rules_boost",
        sha256 = "b64e6f7e96c5b0d7ebcb74c5ee29ab879b8ef8c37581ed0be5ff6c23168da985",
        url = "https://github.com/nelhage/rules_boost/archive/ed844db5990d21b75dc3553c057069f324b3916b.tar.gz",
        strip_prefix = "rules_boost-ed844db5990d21b75dc3553c057069f324b3916b",
    )

    # NOTE: We don't include the pcl repository here because it requires the boost_deps macro to
    # have already been run. In order to run the boost_deps macro, we have to load it. However, you
    # cannot load a macro from within another macro. So it has to be in a separate bzl file that
    # is loaded after the call to pcl_deps().
    # See: //bzl/pcl_repositories.bzl
