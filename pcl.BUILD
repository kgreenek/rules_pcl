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

# TODO(kgreenek): This one is going to be hard because it depends on a lot of the external
# dependencies above that aren't supported yet. For now, just exclude everything that has external
# dependencies. We'll probably need a macro to set the dependencies based on what external
# dependencies the user has enabled via the call to pcl_config. Alternatively, we may be able to
# break this out into a bunch of individual targets that can be selectively created / enabled in the
# pcl_config macro.
pcl_library(
    name = "io",
    exclude_srcs = [
        "io/src/davidsdk_grabber.cpp",
        "io/src/dinast_grabber.cpp",
        "io/src/depth_sense_grabber*.cpp",
        "io/src/depth_sense/**",
        "io/src/ensenso_grabber.cpp",
        "io/src/openni2/**",
        "io/src/png_io.cpp",
        "io/src/real_sense_grabber.cpp",
        "io/src/real_sense/**",
        "io/src/vtk_lib_io.cpp",
    ],
    exclude_hdrs = [
        "io/include/pcl/io/davidsdk_grabber.h",
        "io/include/pcl/io/dinast_grabber.h",
        "io/include/pcl/io/depth_sense/**",
        "io/include/pcl/io/ensenso_grabber.h",
        "io/include/pcl/io/openni2/**",
        "io/include/pcl/io/real_sense/**",
        "io/include/pcl/io/vtk_lib_io.h",
    ],
    deps = [
        ":common",
        ":octree",
        # TODO support OPT_DEPS
        "@boost//:algorithm",
        "@boost//:asio",
        "@boost//:bind",
        "@boost//:chrono",
        "@boost//:circular_buffer",
        "@boost//:cstdint",
        "@boost//:date_time",
        "@boost//:detail",
        "@boost//:filesystem",
        "@boost//:foreach",
        "@boost//:function",
        "@boost//:interprocess",
        "@boost//:lexical_cast",
        "@boost//:mpl",
        "@boost//:numeric_conversion",
        "@boost//:signals2",
        "@boost//:smart_ptr",
        "@boost//:thread",
        "@boost//:tokenizer",
        "@boost//:tuple",
        "@boost//:utility",
        "@boost//:version",
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
