load("@rules_pcl//:bzl/pcl.bzl", "pcl_library")

exports_files(["pcl_config.h.in"])

pcl_library(
    name = "2d",
    exclude_srcs = ["2d/src/examples.cpp"],
    deps = [
        ":common",
        ":filters",
        "@boost//:smart_ptr",
    ],
)

pcl_library(
    name = "common",
    deps = [
        "@//:pcl_config",
        "@boost//:algorithm",
        "@boost//:date_time",
        "@boost//:filesystem",
        "@boost//:fusion",
        "@boost//:mpl",
        "@boost//:preprocessor",
        "@boost//:signals2",
        "@boost//:smart_ptr",
        "@eigen//:eigen",
    ],
)

pcl_library(
    name = "features",
    deps = [
        ":2d",
        ":common",
        ":filters",
        ":kdtree",
        ":octree",
        ":search",
        "@boost//:bind",
        "@boost//:function",
        "@boost//:graph",
        "@boost//:property_map",
        "@boost//:random",
        "@boost//:smart_ptr",
        "@boost//:unordered",
        "@eigen//:eigen",
    ],
)

pcl_library(
    name = "filters",
    deps = [
        ":common",
        ":sample_consensus",
        ":kdtree",
        ":octree",
        ":search",
        "@boost//:bind",
        "@boost//:dynamic_bitset",
        "@boost//:function",
        "@boost//:fusion",
        "@boost//:mpl",
        "@boost//:optional",
        "@boost//:random",
        "@boost//:smart_ptr",
        "@boost//:unordered",
        "@eigen//:eigen",
    ],
)

pcl_library(
    name = "kdtree",
    deps = [
        ":common",
        # TODO flann. Seems to work anyway?
        "@boost//:smart_ptr",
    ],
)

pcl_library(
    name = "keypoints",
    deps = [
        ":common",
        ":features",
        ":octree",
        "@//:pcl_config",
        "@boost//:bind",
        "@boost//:function",
        "@boost//:smart_ptr",
        "@eigen//:eigen",
    ],
)

pcl_library(
    name = "octree",
    deps = [
        ":common",
        "@boost//:bind",
        "@boost//:smart_ptr",
        "@eigen//:eigen",
    ],
)

pcl_library(
    name = "sample_consensus",
    deps = [
        ":common",
        ":search",
        "@//:pcl_config",
        "@boost//:math",
        "@boost//:random",
        "@boost//:smart_ptr",
        "@eigen//:eigen",
    ],
)

pcl_library(
    name = "search",
    deps = [
        ":common",
        ":kdtree",
        ":octree",
        # TODO flann. Seems to work anyway?
        "@boost//:smart_ptr",
    ],
)
