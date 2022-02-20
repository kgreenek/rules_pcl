# Description:
#   Point Cloud Library (PCL) pointclouds.org

licenses(["notice"])  # BSD 3-Clause

load("@rules_pcl//bzl:pcl.bzl", "pcl_library")

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
        "@boost//:cstdint",
        "@boost//:current_function",
        "@boost//:date_time",
        "@boost//:foreach",
        "@boost//:fusion",
        "@boost//:mpl",
        "@boost//:optional",
        "@boost//:predef",
        "@boost//:preprocessor",
        "@boost//:signals2",
        "@boost//:smart_ptr",
        "@eigen",
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
        "@boost//:graph",
        "@boost//:property_map",
        "@boost//:smart_ptr",
        "@eigen",
    ],
)

pcl_library(
    name = "filters",
    deps = [
        ":common",
        ":kdtree",
        ":octree",
        ":sample_consensus",
        ":search",
        "@//:pcl_config",
        "@boost//:dynamic_bitset",
        "@boost//:fusion",
        "@boost//:mpl",
        "@boost//:optional",
        "@boost//:random",
        "@boost//:smart_ptr",
        "@eigen",
    ],
)

pcl_library(
    name = "geometry",
    deps = [
        ":common",
        "@boost//:concept_check",
        "@boost//:operators",
        "@boost//:smart_ptr",
        "@boost//:version",
        "@eigen",
    ],
)

pcl_library(
    name = "ml",
    deps = [
        ":common",
        "@boost//:intrusive",
        "@boost//:smart_ptr",
        "@eigen",
    ],
)

# TODO(kgreenek): This one is going to be hard because it depends on a lot of the external
# dependencies above that aren't supported yet. For now, just exclude everything that has external
# dependencies. We'll probably need a macro to set the dependencies based on what external
# dependencies the user has enabled via the call to pcl_config. Alternatively, we may be able to
# break this out into a bunch of individual targets that can be selectively created / enabled in the
# pcl_config macro.

# Depends on David SDK and VTK.
IO_DAVIDSDK_SRCS = ["io/src/davidsdk_grabber.cpp"]

IO_DAVIDSDK_HDRS = ["io/include/pcl/io/davidsdk_grabber.h"]

IO_DEPTH_SENSE_SRCS = [
    "io/src/depth_sense/**",
    "io/src/depth_sense_grabber.cpp",
]

IO_DEPTH_SENSE_HDRS = [
    "io/include/pcl/io/depth_sense/**",
    "io/include/pcl/io/depth_sense_grabber.h",
]

# NOTE: These only depend on libusb-1.0.
IO_DINAST_SRCS = ["io/src/dinast_grabber.cpp"]

IO_DINAST_HDRS = ["io/include/pcl/io/dinast_grabber.h"]

IO_ENSENSO_SRCS = ["io/src/ensenso_grabber.cpp"]

IO_ENSENSO_HDRS = ["io/include/pcl/io/ensenso_grabber.h"]

IO_OPENNI_SRCS = [
    "io/src/oni_grabber.cpp",
    "io/src/openni_camera/**",
    "io/src/openni_grabber.cpp",
]

IO_OPENNI_HDRS = [
    "io/include/pcl/io/oni_grabber.h",
    "io/include/pcl/io/openni_camera/**",
    "io/include/pcl/io/openni_grabber.h",
]

IO_OPENNI2_SRCS = [
    "io/src/openni2/**",
    "io/src/openni2_grabber.cpp",
]

IO_OPENNI2_HDRS = [
    "io/include/pcl/io/openni2/**",
    "io/include/pcl/io/openni2_grabber.h",
]

IO_REAL_SENSE_SRCS = [
    "io/src/real_sense/**",
    "io/src/real_sense_grabber.cpp",
]

IO_REAL_SENSE_HDRS = [
    "io/include/pcl/io/real_sense/**",
    "io/include/pcl/io/real_sense_grabber.h",
]

IO_REAL_SENSE_2_SRCS = ["io/src/real_sense_2_grabber.cpp"]

IO_REAL_SENSE_2_HDRS = ["io/include/pcl/io/real_sense_2_grabber.h"]

IO_VTK_SRCS = [
    "io/src/png_io.cpp",
    "io/src/vtk_lib_io.cpp",
]

IO_VTK_HDRS = [
    "io/include/pcl/io/impl/vtk_lib_io.hpp",
    "io/include/pcl/io/png_io.h",
    "io/include/pcl/io/vtk_lib_io.h",
]

pcl_library(
    name = "io",
    exclude_hdrs =
        IO_DAVIDSDK_HDRS +
        IO_DEPTH_SENSE_HDRS +
        IO_DINAST_HDRS +
        IO_ENSENSO_HDRS +
        IO_OPENNI_HDRS +
        IO_OPENNI2_HDRS +
        IO_REAL_SENSE_HDRS +
        IO_REAL_SENSE_2_HDRS +
        IO_VTK_HDRS,
    exclude_srcs =
        IO_DAVIDSDK_SRCS +
        IO_DEPTH_SENSE_SRCS +
        IO_DINAST_SRCS +
        IO_ENSENSO_SRCS +
        IO_OPENNI_SRCS +
        IO_OPENNI2_SRCS +
        IO_REAL_SENSE_SRCS +
        IO_REAL_SENSE_2_SRCS +
        IO_VTK_SRCS,
    deps = [
        ":common",
        ":octree",
        "@//:pcl_config",
        "@boost//:algorithm",
        "@boost//:array",
        "@boost//:asio",
        "@boost//:circular_buffer",
        "@boost//:core",
        "@boost//:date_time",
        "@boost//:exception",
        "@boost//:filesystem",
        "@boost//:foreach",
        "@boost//:format",
        "@boost//:interprocess",
        "@boost//:iostreams",
        "@boost//:lexical_cast",
        "@boost//:math",
        "@boost//:mpl",
        "@boost//:multiprecision",  # See: https://github.com/kgreenek/rules_pcl/issues/4
        "@boost//:numeric_conversion",
        "@boost//:property_tree",
        "@boost//:signals2",
        "@boost//:smart_ptr",
        "@boost//:system",
        "@boost//:tokenizer",
        "@boost//:version",
        "@org_libpng_libpng//:libpng",
    ],
)

pcl_library(
    name = "kdtree",
    deps = [
        ":common",
        "@boost//:smart_ptr",
        "@flann",
    ],
)

pcl_library(
    name = "keypoints",
    deps = [
        ":common",
        ":features",
        ":octree",
        "@//:pcl_config",
        "@boost//:smart_ptr",
        "@eigen",
    ],
)

pcl_library(
    name = "octree",
    deps = [
        ":common",
        "@boost//:graph",
        "@boost//:smart_ptr",
        "@boost//:tuple",
        "@eigen",
    ],
)

# TODO(kgreenek): Finish this once the visualization lib is done.
#pcl_library(
#    name = "outofcore",
#    exclude_srcs = ["outofcore/src/visualization/**"],
#    exclude_hdrs = ["outofcore/include/pcl/outofcore/visualization/**"],
#    deps = [
#        ":common",
#        ":io",
#        ":filters",
#        ":octree",
#        "@boost//:core",
#        "@boost//:filesystem",
#        "@boost//:foreach",
#        "@boost//:random",
#        "@boost//:smart_ptr",
#        "@boost//:uuid",
#        "@eigen//:eigen",
#    ],
#)
#
#cc_binary(
#    name = "outofcore_print",
#    srcs = ["outofcore/tools/outofcore_print.cpp"],
#    deps = [
#        ":outofcore",
#        "@boost//:accumulators",
#        "@boost//:algorithm",
#        "@boost//:filesystem",
#        "@boost//:foreach",
#        "@eigen//:eigen",
#    ],
#)
#
#cc_binary(
#    name = "outofcore_process",
#    srcs = ["outofcore/tools/outofcore_process.cpp"],
#    deps = [
#        ":outofcore",
#        "@boost//:filesystem",
#        "@boost//:foreach",
#        "@eigen//:eigen",
#    ],
#)
#
#cc_binary(
#    name = "outofcore_viewer",
#    srcs = ["outofcore/tools/outofcore_viewer.cpp"],
#    deps = [
#        ":outofcore",
#        ":visualization",
#        "@boost//:date_time",
#        "@boost//:filesystem",
#        "@eigen//:eigen",
#        "vtk",
#    ],
#)

pcl_library(
    name = "people",
    deps = [
        ":common",
        ":features",
        ":filters",
        ":geometry",
        ":io",
        ":kdtree",
        ":octree",
        ":sample_consensus",
        ":search",
        ":segmentation",
        "@eigen",
    ],
)

pcl_library(
    name = "recognition",
    deps = [
        ":common",
        ":features",
        ":io",
        ":ml",
        ":registration",
        ":search",
        "@boost//:algorithm",
        "@boost//:filesystem",
        "@boost//:graph",
        "@boost//:random",
        "@boost//:smart_ptr",
        "@boost//:unordered",
        "@eigen",
    ],
)

pcl_library(
    name = "registration",
    exclude_srcs = ["registration/src/pairwise_graph_registration.cpp"],
    deps = [
        ":common",
        ":features",
        ":filters",
        ":kdtree",
        ":octree",
        ":sample_consensus",
        ":search",
        "@boost//:core",
        "@boost//:graph",
        "@boost//:property_map",
        "@boost//:smart_ptr",
        "@eigen",
    ],
)

pcl_library(
    name = "sample_consensus",
    deps = [
        ":common",
        ":search",
        "@//:pcl_config",
        "@boost//:math",
        "@boost//:multiprecision",  # See: https://github.com/kgreenek/rules_pcl/issues/4
        "@boost//:random",
        "@boost//:smart_ptr",
        "@eigen",
    ],
)

pcl_library(
    name = "segmentation",
    deps = [
        ":common",
        ":features",
        ":filters",
        ":geometry",
        ":kdtree",
        ":ml",
        ":octree",
        ":sample_consensus",
        ":search",
        "@boost//:bimap",
        "@boost//:concept",
        "@boost//:current_function",
        "@boost//:graph",
        "@boost//:multi_array",
        "@boost//:property_map",
        "@boost//:ptr_container",
        "@boost//:smart_ptr",
        "@boost//:tuple",
        "@boost//:version",
        "@eigen",
        "@flann",
    ],
)

pcl_library(
    name = "stereo",
    deps = [
        ":common",
        ":io",
        "@boost//:signals2",
        "@eigen",
    ],
)

SURFACE_ON_NURBS_SRCS = [
    "surface/src/3rdparty/opennurbs/**",
    "surface/src/on_nurbs/**",
]

SURFACE_ON_NURBS_HDRS = [
    "surface/include/pcl/surface/3rdparty/opennurbs",
    "surface/include/pcl/surface/on_nurbs",
]

SURFACE_QHULL_SRCS = [
    "surface/include/pcl/surface/impl/concave_hull.hpp",
    "surface/include/pcl/surface/impl/convex_hull.hpp",
    "surface/src/concave_hull.cpp",
    "surface/src/convex_hull.cpp",
]

SURFACE_QHULL_HDRS = [
    "surface/include/pcl/surface/concave_hull.h",
    "surface/include/pcl/surface/convex_hull.h",
    "surface/include/pcl/surface/qhull.h",
]

SURFACE_VTK_SRCS = ["surface/src/vtk_smoothing/**"]

SURFACE_VTK_HDRS = ["surface/include/pcl/surface/vtk_smoothing/**"]

pcl_library(
    name = "surface",
    exclude_hdrs =
        SURFACE_ON_NURBS_HDRS +
        #SURFACE_QHULL_HDRS +
        SURFACE_VTK_HDRS,
    exclude_srcs =
        SURFACE_ON_NURBS_SRCS +
        #SURFACE_QHULL_SRCS +
        SURFACE_VTK_SRCS,
    deps = [
        ":common",
        ":kdtree",
        ":octree",
        ":search",
        "@//:pcl_config",
        "@boost//:current_function",
        "@boost//:dynamic_bitset",
        "@boost//:smart_ptr",
        "@eigen",
        "@qhull//:libqhull",
    ],
)

pcl_library(
    name = "search",
    deps = [
        ":common",
        ":kdtree",
        ":octree",
        "@boost//:smart_ptr",
        "@eigen",
        "@flann",
    ],
)

pcl_library(
    name = "tracking",
    deps = [
        ":common",
        ":filters",
        ":kdtree",
        ":octree",
        ":search",
        "@boost//:random",
        "@boost//:smart_ptr",
        "@eigen",
    ],
)

# NOTE: This depends on VTK.
# TODO(kgreenek): Figure out how to handle VTK and enable.
#pcl_library(
#    name = "visualization",
#    deps = [
#        ":common",
#        ":geometry",
#        ":io",
#        ":kdtree",
#        ":octree",
#        ":search",
#        "@//:pcl_config",
#        "@boost//:algorithm",
#        "@boost//:date_time",
#        "@boost//:filesystem",
#        "@boost//:foreach",
#        "@boost//:signals2",
#        "@boost//:smart_ptr",
#        "@boost//:uuid",
#        "@eigen//:eigen",
#    ],
#)

# --------------------------------------------------------------------------------------------------
# Examples
# --------------------------------------------------------------------------------------------------
cc_binary(
    name = "common_example_copy_point_cloud",
    srcs = ["examples/common/example_copy_point_cloud.cpp"],
    deps = [":common"],
)

cc_binary(
    name = "common_example_scope_time",
    srcs = ["examples/common/example_scope_time.cpp"],
    deps = [":common"],
)

cc_binary(
    name = "common_example_organized_point_cloud",
    srcs = ["examples/common/example_organized_point_cloud.cpp"],
    deps = [":common"],
)

cc_binary(
    name = "common_example_check_if_point_is_valid",
    srcs = ["examples/common/example_check_if_point_is_valid.cpp"],
    deps = [":common"],
)

cc_binary(
    name = "common_example_get_max_min_coordinates",
    srcs = ["examples/common/example_get_max_min_coordinates.cpp"],
    deps = [":io"],
)

cc_binary(
    name = "features_example_fast_point_feature_histograms",
    srcs = ["examples/features/example_fast_point_feature_histograms.cpp"],
    deps = [
        ":common",
        ":features",
        ":io",
        ":kdtree",
        ":search",
    ],
)

cc_binary(
    name = "features_example_normal_estimation",
    srcs = ["examples/features/example_normal_estimation.cpp"],
    deps = [
        ":common",
        ":features",
        ":io",
        ":kdtree",
        ":search",
    ],
)

cc_binary(
    name = "features_example_point_feature_histograms",
    srcs = ["examples/features/example_point_feature_histograms.cpp"],
    deps = [
        ":common",
        ":features",
        ":io",
        ":kdtree",
        ":search",
    ],
)

cc_binary(
    name = "features_example_shape_contexts",
    srcs = ["examples/features/example_shape_contexts.cpp"],
    deps = [
        ":common",
        ":features",
        ":io",
        ":kdtree",
        ":search",
    ],
)

cc_binary(
    name = "features_example_spin_images",
    srcs = ["examples/features/example_spin_images.cpp"],
    deps = [
        ":common",
        ":features",
        ":io",
        ":kdtree",
        ":search",
    ],
)

cc_binary(
    name = "features_example_rift_estimation",
    srcs = ["examples/features/example_rift_estimation.cpp"],
    deps = [
        ":common",
        ":features",
        ":io",
        ":kdtree",
        ":search",
    ],
)

cc_binary(
    name = "features_example_difference_of_normals",
    srcs = ["examples/features/example_difference_of_normals.cpp"],
    deps = [
        ":common",
        ":features",
        ":io",
        ":kdtree",
        ":sample_consensus",
        ":search",
        ":segmentation",
    ],
)

cc_binary(
    name = "filters_example_remove_nan_from_point_cloud",
    srcs = ["examples/filters/example_remove_nan_from_point_cloud.cpp"],
    deps = [
        ":common",
        ":filters",
    ],
)

cc_binary(
    name = "filters_example_extract_indices",
    srcs = ["examples/filters/example_extract_indices.cpp"],
    deps = [
        ":common",
        ":filters",
    ],
)

cc_binary(
    name = "geometry_example_half_edge_mesh",
    srcs = ["examples/geometry/example_half_edge_mesh.cpp"],
    deps = [
        ":common",
        ":geometry",
    ],
)

# TODO(kgreenek): Finish this once the visualization lib is done.
#cc_binary(
#    name = "keypoints_example_sift_keypoint_estimation",
#    srcs = ["examples/keypoints/example_sift_keypoint_estimation.cpp"],
#    deps = [
#        ":common",
#        ":io",
#        ":keypoints",
#        ":visualization",
#    ],
#)

# TODO(kgreenek): Finish this once the visualization lib is done.
#cc_binary(
#    name = "keypoints_example_sift_normal_keypoint_estimation",
#    srcs = ["examples/keypoints/example_sift_normal_keypoint_estimation.cpp"],
#    deps = [
#        ":common",
#        ":io",
#        ":keypoints",
#        ":visualization",
#    ],
#)

# TODO(kgreenek): Finish this once the visualization lib is done.
#cc_binary(
#    name = "keypoints_example_sift_z_keypoint_estimation",
#    srcs = ["examples/keypoints/example_sift_z_keypoint_estimation.cpp"],
#    deps = [
#        ":common",
#        ":io",
#        ":keypoints",
#        ":visualization",
#    ],
#)

cc_binary(
    name = "keypoints_example_get_keypoints_indices",
    srcs = ["examples/keypoints/example_get_keypoints_indices.cpp"],
    deps = [
        ":common",
        ":io",
        ":keypoints",
    ],
)

# TODO(kgreenek): Finish this once the visualization lib is done.
#cc_binary(
#    name = "outofcore_example_outofcore_with_lod",
#    srcs = ["examples/outofcore/example_outofcore_with_lod.cpp"],
#    deps = [
#        ":common",
#        ":filters",
#        ":io",
#        ":octree",
#        ":outofcore",
#    ],
#)

# TODO(kgreenek): Finish this once the visualization lib is done.
#cc_binary(
#    name = "outofcore_example_outofcore",
#    srcs = ["examples/outofcore/example_outofcore.cpp"],
#    deps = [
#        ":common",
#        ":filters",
#        ":io",
#        ":octree",
#        ":outofcore",
#    ],
#)

cc_binary(
    name = "segmentation_example_extract_clusters_normals",
    srcs = ["examples/segmentation/example_extract_clusters_normals.cpp"],
    deps = [
        ":common",
        ":io",
        ":keypoints",
        ":segmentation",
    ],
)

cc_binary(
    name = "segmentation_example_region_growing",
    srcs = ["examples/segmentation/example_region_growing.cpp"],
    deps = [
        ":common",
        ":io",
        ":keypoints",
        ":segmentation",
    ],
)

# TODO(kgreenek): Finish this once the visualization lib is done.
#cc_binary(
#    name = "segmentation_example_supervoxels",
#    srcs = ["examples/segmentation/example_supervoxels.cpp"],
#    deps = [
#        ":common",
#        ":features",
#        ":kdtree",
#        ":octree",
#        ":segmentation",
#        ":visualization",
#    ],
#)

# TODO(kgreenek): Finish this once the visualization lib is done.
#cc_binary(
#    name = "segmentation_example_lccp_segmentation",
#    srcs = ["examples/segmentation/example_lccp_segmentation.cpp"],
#    deps = [
#        ":common",
#        ":io",
#        ":segmentation",
#        ":visualization",
#    ],
#)

# TODO(kgreenek): Finish this once the visualization lib is done.
#cc_binary(
#    name = "segmentation_example_cpc_segmentation",
#    srcs = ["examples/segmentation/example_cpc_segmentation.cpp"],
#    deps = [
#        ":common",
#        ":io",
#        ":sample_consensur",
#        ":segmentation",
#        ":visualization",
#    ],
#)

# TODO(kgreenek): Finish this once the visualization lib is done.
#cc_binary(
#    name = "stereo_example_stereo_baseline",
#    srcs = ["examples/stereo/example_stereo_baseline.cpp"],
#    deps = [
#        ":common",
#        ":io",
#        ":stereo",
#        ":visualization",
#    ],
#)

# TODO(kgreenek): Finish this once the visualization lib is done.
#cc_binary(
#    name = "surface_test_nurbs_fitting_surface",
#    srcs = ["examples/surface/test_nurbs_fitting_surface.cpp"],
#    deps = [
#        ":common",
#        ":io",
#        ":surface",
#        ":visualization",
#    ],
#)

# TODO(kgreenek): Finish this once the visualization lib is done.
#cc_binary(
#    name = "surface_example_nurbs_fitting_surface",
#    srcs = ["examples/surface/example_nurbs_fitting_surface.cpp"],
#    deps = [
#        ":common",
#        ":io",
#        ":surface",
#        ":visualization",
#    ],
#)

# TODO(kgreenek): Finish this once the visualization lib is done.
#cc_binary(
#    name = "surface_example_nurbs_viewer_surface",
#    srcs = ["examples/surface/example_nurbs_viewer_surface.cpp"],
#    deps = [
#        ":common",
#        ":io",
#        ":surface",
#        ":visualization",
#    ],
#)

# TODO(kgreenek): Finish this once the visualization lib is done.
#cc_binary(
#    name = "surface_example_nurbs_fitting_closed_curve",
#    srcs = ["examples/surface/example_nurbs_fitting_closed_curve.cpp"],
#    deps = [
#        ":common",
#        ":io",
#        ":surface",
#        ":visualization",
#    ],
#)

# TODO(kgreenek): Finish this once the visualization lib is done.
#cc_binary(
#    name = "surface_example_nurbs_fitting_curve2d",
#    srcs = ["examples/surface/example_nurbs_fitting_curve2d.cpp"],
#    deps = [
#        ":common",
#        ":io",
#        ":surface",
#        ":visualization",
#    ],
#)

# TODO(kgreenek): Finish this once the visualization lib is done.
#cc_binary(
#    name = "surface_example_nurbs_fitting_closed_curve3d",
#    srcs = ["examples/surface/example_nurbs_fitting_closed_curve3d.cpp"],
#    deps = [
#        ":common",
#        ":io",
#        ":surface",
#        ":visualization",
#    ],
#)
