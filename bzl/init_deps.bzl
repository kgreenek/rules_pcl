# The pcl_repositories() macro from //bzl/repositories.bzl must be invoked before loading this bzl
# file. This is why we have to split this init macro into a separate bzl file.
load("@com_github_nelhage_rules_boost//:boost/boost.bzl", "boost_deps")

def pcl_init_deps():
    boost_deps()
