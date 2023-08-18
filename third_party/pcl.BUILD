# Description:
#   Point Cloud Library (PCL) pointclouds.org

load("@rules_pcl//bzl:pcl.bzl", "pcl_library")

licenses(["notice"])  # BSD 3-Clause

exports_files(["pcl_config.h.in"])

pcl_library(
    name = "2d",
    exclude_srcs = ["2d/src/examples.cpp"],
    deps = [
        ":common",
        ":filters",
    ],
)

pcl_library(
    name = "common",
    deps = [
        "@//:pcl_config",
        "@boost//:algorithm",
        "@boost//:current_function",
        "@boost//:filesystem",
        "@boost//:fusion",
        "@boost//:mpl",
        "@boost//:predef",
        "@boost//:preprocessor",
        "@boost//:signals2",
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
        "@boost//:sort",
        "@eigen",
    ],
)

pcl_library(
    name = "geometry",
    deps = [
        ":common",
        "@boost//:operators",
        "@boost//:version",
        "@eigen",
    ],
)

pcl_library(
    name = "ml",
    deps = [":common"],
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
        "@boost//:predef",
        "@boost//:property_tree",
        "@boost//:signals2",
        "@boost//:smart_ptr",
        "@boost//:tokenizer",
        "@boost//:utility",
        "@boost//:version",
        "@org_libpng_libpng//:libpng",
    ],
)

pcl_library(
    name = "kdtree",
    deps = [
        ":common",
        "@flann",
    ],
)

pcl_library(
    name = "keypoints",
    deps = [
        ":common",
        ":features",
        ":filters",
        ":octree",
        ":search",
        "@//:pcl_config",
        "@eigen",
    ],
)

pcl_library(
    name = "octree",
    deps = [
        ":common",
        "@boost//:graph",
    ],
)

# TODO(kgreenek): Finish this once the visualization lib is done.
#pcl_library(
#    name = "outofcore",
#    exclude_srcs = ["outofcore/src/visualization/**"],
#    exclude_hdrs = ["outofcore/include/pcl/outofcore/visualization/**"],
#    deps = [
#        ":common",
#        ":filters",
#        ":io",
#        ":octree",
#        ":visualization",
#        "@boost//:filesystem",
#        "@boost//:foreach",
#        "@boost//:random",
#        "@boost//:uuid",
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
#        "@boost//:foreach",
#    ],
#)
#
#cc_binary(
#    name = "outofcore_process",
#    srcs = ["outofcore/tools/outofcore_process.cpp"],
#    deps = [
#        ":common",
#        ":io",
#        ":outofcore",
#        "@boost//:foreach",
#    ],
#)
#
#cc_binary(
#    name = "outofcore_viewer",
#    srcs = ["outofcore/tools/outofcore_viewer.cpp"],
#    deps = [
#        ":common",
#        ":io",
#        ":outofcore",
#        ":visualization",
#        "@boost//:filesystem",
#    ],
#)

pcl_library(
    name = "people",
    # This file depends on ":visualization".
    exclude_hdrs = ["include/pcl/people/person_cluster.h"],
    deps = [
        ":common",
        ":filters",
        ":kdtree",
        ":sample_consensus",
        ":segmentation",
        #":visualization",
    ],
)

pcl_library(
    name = "recognition",
    deps = [
        ":common",
        ":features",
        ":filters",
        ":io",
        ":kdtree",
        ":ml",
        ":registration",
        ":search",
        "@boost//:algorithm",
        "@boost//:filesystem",
        "@boost//:graph",
        "@boost//:random",
        "@eigen",
    ],
)

pcl_library(
    name = "registration",
    exclude_hdrs = ["registration/include/pcl/registration/transformation_estimation_dq.h"],
    exclude_srcs = [
        "registration/include/pcl/registration/impl/transformation_estimation_dq.hpp",
        "registration/src/pairwise_graph_registration.cpp",
        "registration/src/transformation_estimation_dq.cpp",
    ],
    deps = [
        ":common",
        ":features",
        ":filters",
        ":kdtree",
        ":sample_consensus",
        ":search",
        "@boost//:core",
        "@boost//:graph",
        "@boost//:noncopyable",
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
        ":ml",
        ":octree",
        ":sample_consensus",
        ":search",
        "@boost//:bimap",
        "@boost//:concept",
        "@boost//:graph",
        "@boost//:multi_array",
        "@boost//:ptr_container",
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

SURFACE_VTK_SRCS = ["surface/src/vtk_smoothing/**"]

SURFACE_VTK_HDRS = ["surface/include/pcl/surface/vtk_smoothing/**"]

pcl_library(
    name = "surface",
    exclude_hdrs =
        SURFACE_ON_NURBS_HDRS +
        SURFACE_VTK_HDRS,
    exclude_srcs =
        SURFACE_ON_NURBS_SRCS +
        SURFACE_VTK_SRCS,
    deps = [
        ":common",
        ":kdtree",
        ":octree",
        ":search",
        "@//:pcl_config",
        "@boost//:current_function",
        "@boost//:dynamic_bitset",
        "@eigen",
        "@qhull//:libqhull_r",
    ],
)

pcl_library(
    name = "search",
    deps = [
        ":common",
        ":kdtree",
        ":octree",
        "@eigen",
        "@flann",
    ],
)

pcl_library(
    name = "test",
    deps = [
        ":common",
        "@com_google_googletest//:gtest",
    ],
)

pcl_library(
    name = "tracking",
    deps = [
        ":common",
        ":filters",
        ":octree",
        ":search",
    ],
)

# NOTE: This depends on VTK.
# TODO(kgreenek): Figure out how to handle VTK and enable.
#pcl_library(
#    name = "visualization",
#    deps = [
#        ":common",
#        ":filters",
#        ":features",
#        ":geometry",
#        ":io",
#        ":kdtree",
#        ":registration",
#        ":search",
#        "@//:pcl_config",
#        "@boost//:algorithm",
#        "@boost//:foreach",
#        "@boost//:filesystem",
#        "@boost//:signals2",
#        "@boost//:smart_ptr",
#        "@boost//:version",
#        "@boost//:uuid",
#        "@eigen",
#    ],
#)

####################################################################################################
# Examples
####################################################################################################
cc_binary(
    name = "common_example_check_if_point_is_valid",
    srcs = ["examples/common/example_check_if_point_is_valid.cpp"],
    deps = [":common"],
)

cc_binary(
    name = "common_example_copy_point_cloud",
    srcs = ["examples/common/example_copy_point_cloud.cpp"],
    deps = [":common"],
)

cc_binary(
    name = "common_example_get_max_min_coordinates",
    srcs = ["examples/common/example_get_max_min_coordinates.cpp"],
    deps = [":io"],
)

cc_binary(
    name = "common_example_organized_point_cloud",
    srcs = ["examples/common/example_organized_point_cloud.cpp"],
    deps = [":common"],
)

cc_binary(
    name = "common_example_scope_time",
    srcs = ["examples/common/example_scope_time.cpp"],
    deps = [":common"],
)

cc_binary(
    name = "features_example_difference_of_normals",
    srcs = ["examples/features/example_difference_of_normals.cpp"],
    deps = [
        ":common",
        ":features",
        ":filters",
        ":io",
        ":segmentation",
    ],
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
    name = "features_example_principal_curvatures_estimation",
    srcs = ["examples/features/example_principal_curvatures_estimation.cpp"],
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
    name = "filters_example_extract_indices",
    srcs = ["examples/filters/example_extract_indices.cpp"],
    deps = [
        ":common",
        ":filters",
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
    name = "geometry_example_half_edge_mesh",
    srcs = ["examples/geometry/example_half_edge_mesh.cpp"],
    deps = [
        ":common",
        ":geometry",
    ],
)

cc_binary(
    name = "keypoints_example_get_keypoints_indices",
    srcs = ["examples/keypoints/example_get_keypoints_indices.cpp"],
    deps = [
        ":common",
        ":io",
        ":keypoints",
    ],
)

cc_binary(
    name = "keypoints_example_sift_keypoint_estimation",
    srcs = ["examples/keypoints/example_sift_keypoint_estimation.cpp"],
    deps = [
        ":common",
        ":io",
        ":keypoints",
    ],
)

cc_binary(
    name = "keypoints_example_sift_normal_keypoint_estimation",
    srcs = ["examples/keypoints/example_sift_normal_keypoint_estimation.cpp"],
    deps = [
        ":common",
        ":io",
        ":keypoints",
    ],
)

cc_binary(
    name = "keypoints_example_sift_z_keypoint_estimation",
    srcs = ["examples/keypoints/example_sift_z_keypoint_estimation.cpp"],
    deps = [
        ":common",
        ":io",
        ":keypoints",
    ],
)

# TODO(kgreenek): Finish this once the visualization lib is done.
#cc_binary(
#    name = "outofcore_example_outofcore",
#    srcs = ["examples/outofcore/example_outofcore.cpp"],
#    deps = [
#        ":common",
#        ":io",
#        ":outofcore",
#    ],
#)

# TODO(kgreenek): Finish this once the visualization lib is done.
#cc_binary(
#    name = "outofcore_example_outofcore_with_lod",
#    srcs = ["examples/outofcore/example_outofcore_with_lod.cpp"],
#    deps = [
#        ":common",
#        ":io",
#        ":outofcore",
#    ],
#)

# TODO(kgreenek): Finish this once the visualization lib is done.
#cc_binary(
#    name = "segmentation_example_cpc_segmentation",
#    srcs = ["examples/segmentation/example_cpc_segmentation.cpp"],
#    deps = [
#        ":common",
#        ":io",
#        ":segmentation",
#        ":visualization",
#        "@boost//:format",
#    ],
#)

cc_binary(
    name = "segmentation_example_extract_clusters_normals",
    srcs = ["examples/segmentation/example_extract_clusters_normals.cpp"],
    deps = [
        ":common",
        ":features",
        ":io",
        ":segmentation",
    ],
)

# TODO(kgreenek): Finish this once the visualization lib is done.
#cc_binary(
#    name = "segmentation_example_lccp_segmentation",
#    srcs = ["examples/segmentation/example_lccp_segmentation.cpp"],
#    deps = [
#        ":common",
#        ":io",
#        ":segmentation",
#        ":visualization",
#        "@boost//:format",
#    ],
#)

cc_binary(
    name = "segmentation_example_region_growing",
    srcs = ["examples/segmentation/example_region_growing.cpp"],
    deps = [
        ":common",
        ":features",
        ":filters",
        ":io",
        ":segmentation",
    ],
)

# TODO(kgreenek): Finish this once the visualization lib is done.
#cc_binary(
#    name = "segmentation_example_supervoxels",
#    srcs = ["examples/segmentation/example_supervoxels.cpp"],
#    deps = [
#        ":common",
#        ":io",
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
#    name = "surface_example_nurbs_fitting_closed_curve3d",
#    srcs = ["examples/surface/example_nurbs_fitting_closed_curve3d.cpp"],
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
#    name = "surface_example_nurbs_viewer_surface",
#    srcs = ["examples/surface/example_nurbs_viewer_surface.cpp"],
#    deps = [
#        ":common",
#        ":surface",
#        ":visualization",
#    ],
#)

# TODO(kgreenek): Finish this once the visualization lib is done.
#cc_binary(
#    name = "surface_test_nurbs_fitting_surface",
#    srcs = ["examples/surface/test_nurbs_fitting_surface.cpp"],
#    deps = [
#        ":common",
#        ":surface",
#        ":visualization",
#    ],
#)

####################################################################################################
# TESTS - All the fules below are generated using the gen_test_targests.py script.
# NOTE: Any tests that require passing an argument to the command are excluded. So these shouldn't
# be considered thorough tests, only a sanity check.
####################################################################################################

####################################################################################################
# 2d tests
####################################################################################################
cc_test(
    name = "2d_test_2d_keypoint_instantiation_with_precompile",
    size = "small",
    srcs = ["test/2d/keypoint_instantiation.cpp"],
    deps = [
        ":2d",
        ":common",
        ":test",
    ],
)

cc_test(
    name = "2d_test_2d_keypoint_instantiation_without_precompile",
    size = "small",
    srcs = ["test/2d/keypoint_instantiation.cpp"],
    deps = [
        ":2d",
        ":common",
        ":test",
    ],
)

####################################################################################################
# common tests
####################################################################################################
cc_test(
    name = "common_test_wrappers",
    size = "small",
    srcs = ["test/common/test_wrappers.cpp"],
    deps = [
        ":common",
        ":test",
    ],
)

cc_test(
    name = "common_test_macros",
    size = "small",
    srcs = ["test/common/test_macros.cpp"],
    deps = [
        ":common",
        ":test",
    ],
)

cc_test(
    name = "common_test_vector_average",
    size = "small",
    srcs = ["test/common/test_vector_average.cpp"],
    deps = [
        ":common",
        ":test",
    ],
)

cc_test(
    name = "common_test_common",
    size = "small",
    srcs = ["test/common/test_common.cpp"],
    deps = [
        ":common",
        ":test",
    ],
)

cc_test(
    name = "common_test_pointcloud",
    size = "small",
    srcs = ["test/common/test_pointcloud.cpp"],
    deps = [
        ":common",
        ":test",
    ],
)

cc_test(
    name = "common_test_parse",
    size = "small",
    srcs = ["test/common/test_parse.cpp"],
    deps = [
        ":common",
        ":test",
    ],
)

cc_test(
    name = "common_test_geometry",
    size = "small",
    srcs = ["test/common/test_geometry.cpp"],
    deps = [
        ":common",
        ":test",
    ],
)

cc_test(
    name = "common_test_copy_point",
    size = "small",
    srcs = ["test/common/test_copy_point.cpp"],
    deps = [
        ":common",
        ":test",
    ],
)

cc_test(
    name = "common_test_transforms",
    size = "small",
    srcs = ["test/common/test_transforms.cpp"],
    deps = [
        ":common",
        ":test",
    ],
)

cc_test(
    name = "common_test_plane_intersection",
    size = "small",
    srcs = ["test/common/test_plane_intersection.cpp"],
    deps = [
        ":common",
        ":test",
    ],
)

cc_test(
    name = "common_test_pca",
    size = "small",
    srcs = ["test/common/test_pca.cpp"],
    deps = [
        ":common",
        ":test",
    ],
)

cc_test(
    name = "common_test_spring",
    size = "small",
    srcs = ["test/common/test_spring.cpp"],
    deps = [
        ":common",
        ":test",
    ],
)

cc_test(
    name = "common_test_gaussian",
    size = "small",
    srcs = ["test/common/test_gaussian.cpp"],
    deps = [
        ":common",
        ":test",
    ],
)

cc_test(
    name = "common_test_operators",
    size = "small",
    srcs = ["test/common/test_operators.cpp"],
    deps = [
        ":common",
        ":test",
    ],
)

cc_test(
    name = "common_test_eigen",
    size = "large",
    srcs = ["test/common/test_eigen.cpp"],
    deps = [
        ":common",
        ":test",
    ],
)

cc_test(
    name = "common_test_intensity",
    size = "small",
    srcs = ["test/common/test_intensity.cpp"],
    deps = [
        ":common",
        ":test",
    ],
)

cc_test(
    name = "common_test_generator",
    size = "small",
    srcs = ["test/common/test_generator.cpp"],
    deps = [
        ":common",
        ":test",
    ],
)

cc_test(
    name = "common_test_common_io",
    size = "small",
    srcs = ["test/common/test_io.cpp"],
    deps = [
        ":common",
        ":test",
    ],
)

cc_test(
    name = "common_test_copy_make_borders",
    size = "small",
    srcs = ["test/common/test_copy_make_borders.cpp"],
    deps = [
        ":common",
        ":test",
    ],
)

cc_test(
    name = "common_test_bearing_angle_image",
    size = "small",
    srcs = ["test/common/test_bearing_angle_image.cpp"],
    deps = [
        ":common",
        ":test",
    ],
)

cc_test(
    name = "common_test_polygon_mesh_concatenate",
    size = "small",
    srcs = ["test/common/test_polygon_mesh.cpp"],
    deps = [
        ":common",
        ":test",
    ],
)

cc_test(
    name = "common_test_common_point_type_conversion",
    size = "small",
    srcs = ["test/common/test_point_type_conversion.cpp"],
    deps = [
        ":common",
        ":test",
    ],
)

cc_test(
    name = "common_test_common_point_type_static_member_functions",
    size = "small",
    srcs = ["test/common/test_point_type_static_member_functions.cpp"],
    deps = [
        ":common",
        ":test",
    ],
)

cc_test(
    name = "common_test_colors",
    size = "small",
    srcs = ["test/common/test_colors.cpp"],
    deps = [
        ":common",
        ":test",
    ],
)

cc_test(
    name = "common_test_type_traits",
    size = "small",
    srcs = ["test/common/test_type_traits.cpp"],
    deps = [
        ":common",
        ":test",
    ],
)

####################################################################################################
# features tests
####################################################################################################
cc_test(
    name = "features_test_features_ptr",
    size = "small",
    srcs = ["test/features/test_ptr.cpp"],
    deps = [
        ":features",
        ":test",
    ],
)

cc_test(
    name = "features_test_gradient_estimation",
    size = "small",
    srcs = ["test/features/test_gradient_estimation.cpp"],
    deps = [
        ":features",
        ":test",
    ],
)

cc_test(
    name = "features_test_rift_estimation",
    size = "small",
    srcs = ["test/features/test_rift_estimation.cpp"],
    deps = [
        ":features",
        ":test",
    ],
)

cc_test(
    name = "features_test_narf",
    size = "small",
    srcs = ["test/features/test_narf.cpp"],
    deps = [
        ":features",
        ":test",
        "@flann",
    ],
)

cc_test(
    name = "features_test_organized_edge_detection",
    size = "small",
    srcs = ["test/features/test_organized_edge_detection.cpp"],
    deps = [
        ":features",
        ":io",
        ":test",
    ],
)

####################################################################################################
# filters tests
####################################################################################################
cc_test(
    name = "filters_test_filters_grid_minimum",
    size = "small",
    srcs = ["test/filters/test_grid_minimum.cpp"],
    deps = [
        ":common",
        ":filters",
        ":test",
    ],
)

cc_test(
    name = "filters_test_morphological",
    size = "small",
    srcs = ["test/filters/test_morphological.cpp"],
    deps = [
        ":common",
        ":filters",
        ":test",
    ],
)

cc_test(
    name = "filters_test_filters_functor",
    size = "small",
    srcs = ["test/filters/test_functor_filter.cpp"],
    deps = [
        ":common",
        ":filters",
        ":test",
    ],
)

cc_test(
    name = "filters_test_filters_local_maximum",
    size = "small",
    srcs = ["test/filters/test_local_maximum.cpp"],
    deps = [
        ":common",
        ":filters",
        ":octree",
        ":search",
        ":test",
    ],
)

cc_test(
    name = "filters_test_uniform_sampling",
    size = "small",
    srcs = ["test/filters/test_uniform_sampling.cpp"],
    deps = [
        ":common",
        ":filters",
        ":test",
    ],
)

cc_test(
    name = "filters_test_convolution",
    size = "small",
    srcs = ["test/filters/test_convolution.cpp"],
    deps = [
        ":filters",
        ":test",
    ],
)

cc_test(
    name = "filters_test_crop_hull",
    size = "large",
    srcs = ["test/filters/test_crop_hull.cpp"],
    deps = [
        ":filters",
        ":test",
    ],
)

cc_test(
    name = "filters_test_clipper",
    size = "small",
    srcs = ["test/filters/test_clipper.cpp"],
    deps = [
        ":filters",
        ":test",
    ],
)

####################################################################################################
# geometry tests
####################################################################################################
cc_test(
    name = "geometry_test_iterator",
    size = "small",
    srcs = [
        "test/geometry/test_iterator.cpp",
        "test/geometry/test_mesh_common_functions.h",
    ],
    deps = [
        ":geometry",
        ":test",
    ],
)

cc_test(
    name = "geometry_test_mesh_circulators",
    size = "small",
    srcs = [
        "test/geometry/test_mesh_circulators.cpp",
        "test/geometry/test_mesh_common_functions.h",
    ],
    deps = [
        ":geometry",
        ":test",
    ],
)

cc_test(
    name = "geometry_test_mesh_conversion",
    size = "small",
    srcs = [
        "test/geometry/test_mesh_common_functions.h",
        "test/geometry/test_mesh_conversion.cpp",
    ],
    deps = [
        ":geometry",
        ":test",
    ],
)

cc_test(
    name = "geometry_test_mesh_data",
    size = "small",
    srcs = [
        "test/geometry/test_mesh_common_functions.h",
        "test/geometry/test_mesh_data.cpp",
    ],
    deps = [
        ":geometry",
        ":test",
    ],
)

cc_test(
    name = "geometry_test_mesh_get_boundary",
    size = "small",
    srcs = [
        "test/geometry/test_mesh_common_functions.h",
        "test/geometry/test_mesh_get_boundary.cpp",
    ],
    deps = [
        ":geometry",
        ":test",
    ],
)

cc_test(
    name = "geometry_test_mesh_indices",
    size = "small",
    srcs = [
        "test/geometry/test_mesh_common_functions.h",
        "test/geometry/test_mesh_indices.cpp",
    ],
    deps = [
        ":geometry",
        ":test",
    ],
)

cc_test(
    name = "geometry_test_mesh",
    size = "small",
    srcs = [
        "test/geometry/test_mesh.cpp",
        "test/geometry/test_mesh_common_functions.h",
    ],
    deps = [
        ":geometry",
        ":test",
    ],
)

cc_test(
    name = "geometry_test_polygon_mesh",
    size = "small",
    srcs = [
        "test/geometry/test_mesh_common_functions.h",
        "test/geometry/test_polygon_mesh.cpp",
    ],
    deps = [
        ":geometry",
        ":test",
    ],
)

cc_test(
    name = "geometry_test_quad_mesh",
    size = "small",
    srcs = [
        "test/geometry/test_mesh_common_functions.h",
        "test/geometry/test_quad_mesh.cpp",
    ],
    deps = [
        ":geometry",
        ":test",
    ],
)

cc_test(
    name = "geometry_test_triangle_mesh",
    size = "small",
    srcs = [
        "test/geometry/test_mesh_common_functions.h",
        "test/geometry/test_triangle_mesh.cpp",
    ],
    deps = [
        ":geometry",
        ":test",
    ],
)

####################################################################################################
# io tests
####################################################################################################
cc_test(
    name = "io_test_timestamp",
    size = "small",
    srcs = ["test/io/test_timestamp.cpp"],
    deps = [
        ":io",
        ":test",
    ],
)

cc_test(
    name = "io_test_io",
    size = "medium",
    srcs = ["test/io/test_io.cpp"],
    deps = [
        ":io",
        ":test",
    ],
)

cc_test(
    name = "io_test_split",
    size = "small",
    srcs = ["test/io/test_split.cpp"],
    deps = [
        ":io",
        ":test",
    ],
)

cc_test(
    name = "io_test_iterators",
    size = "small",
    srcs = ["test/io/test_iterators.cpp"],
    deps = [
        ":io",
        ":test",
    ],
)

cc_test(
    name = "io_test_range_coder",
    size = "small",
    srcs = ["test/io/test_range_coder.cpp"],
    deps = [
        ":io",
        ":test",
    ],
)

cc_test(
    name = "io_test_ply_io",
    size = "small",
    srcs = ["test/io/test_ply_io.cpp"],
    deps = [
        ":io",
        ":test",
    ],
)

cc_test(
    name = "io_test_point_cloud_image_extractors",
    size = "small",
    srcs = ["test/io/test_point_cloud_image_extractors.cpp"],
    deps = [
        ":io",
        ":test",
    ],
)

cc_test(
    name = "io_test_buffers",
    size = "small",
    srcs = ["test/io/test_buffers.cpp"],
    deps = [
        ":common",
        ":io",
        ":test",
    ],
)

####################################################################################################
# ml tests
####################################################################################################
cc_test(
    name = "ml_test_ml_kmeans",
    size = "small",
    srcs = ["test/ml/test_kmeans.cpp"],
    deps = [
        ":common",
        ":ml",
        ":test",
    ],
)

####################################################################################################
# octree tests
####################################################################################################
cc_test(
    name = "octree_test_octree",
    size = "large",
    srcs = ["test/octree/test_octree.cpp"],
    deps = [
        ":common",
        ":octree",
        ":test",
    ],
)

cc_test(
    name = "octree_test_octree_iterator",
    size = "small",
    srcs = ["test/octree/test_octree_iterator.cpp"],
    deps = [
        ":common",
        ":octree",
        ":test",
    ],
)

####################################################################################################
# registration tests
####################################################################################################
cc_test(
    name = "registration_test_warps",
    size = "small",
    srcs = ["test/registration/test_warps.cpp"],
    deps = [
        ":registration",
        ":test",
    ],
)

cc_test(
    name = "registration_test_correspondence_estimation",
    size = "small",
    srcs = ["test/registration/test_correspondence_estimation.cpp"],
    deps = [
        ":features",
        ":io",
        ":registration",
        ":test",
    ],
)

####################################################################################################
# sample_consensus tests
####################################################################################################
cc_test(
    name = "sample_consensus_test_sample_consensus_quadric_models",
    size = "small",
    srcs = ["test/sample_consensus/test_sample_consensus_quadric_models.cpp"],
    deps = [
        ":sample_consensus",
        ":test",
    ],
)

cc_test(
    name = "sample_consensus_test_sample_consensus_line_models",
    size = "small",
    srcs = ["test/sample_consensus/test_sample_consensus_line_models.cpp"],
    deps = [
        ":sample_consensus",
        ":test",
    ],
)

####################################################################################################
# search tests
####################################################################################################
cc_test(
    name = "search_test_kdtree_search",
    size = "large",
    srcs = [
        "test/search/precise_distances.h",
        "test/search/test_kdtree.cpp",
    ],
    deps = [
        ":kdtree",
        ":search",
        ":test",
    ],
)

cc_test(
    name = "search_test_flann_search",
    size = "large",
    srcs = [
        "test/search/precise_distances.h",
        "test/search/test_flann_search.cpp",
    ],
    deps = [
        ":kdtree",
        ":search",
        ":test",
    ],
)

cc_test(
    name = "search_test_organized_search",
    size = "small",
    srcs = [
        "test/search/precise_distances.h",
        "test/search/test_organized.cpp",
    ],
    deps = [
        ":kdtree",
        ":search",
        ":test",
    ],
)

cc_test(
    name = "search_test_octree_search",
    size = "small",
    srcs = [
        "test/search/precise_distances.h",
        "test/search/test_octree.cpp",
    ],
    deps = [
        ":common",
        ":octree",
        ":search",
        ":test",
    ],
)

####################################################################################################
# surface tests
####################################################################################################
cc_library(
    name = "surface_test_common",
    data = ["test/bun0.pcd"],
    deps = [
        ":io",
        ":surface",
        ":features",
        ":test",
    ],
)

cc_test(
    name = "surface_test_marching_cubes",
    size = "large",
    srcs = ["test/surface/test_marching_cubes.cpp"],
    args = ["../pcl/test/bun0.pcd"],
    deps = [":surface_test_common"],
)

cc_test(
    name = "surface_test_moving_least_squares",
    size = "small",
    srcs = ["test/surface/test_moving_least_squares.cpp"],
    args = ["../pcl/test/bun0.pcd"],
    deps = [":surface_test_common"],
)

cc_test(
    name = "surface_test_gp3",
    size = "small",
    srcs = ["test/surface/test_gp3.cpp"],
    args = ["../pcl/test/bun0.pcd"],
    deps = [":surface_test_common"],
)

cc_test(
    name = "surface_test_organized_fast_mesh",
    size = "small",
    srcs = ["test/surface/test_organized_fast_mesh.cpp"],
    args = ["../pcl/test/bun0.pcd"],
    deps = [":surface_test_common"],
)

cc_test(
    name = "surface_test_grid_projection",
    size = "large",
    srcs = ["test/surface/test_grid_projection.cpp"],
    args = ["../pcl/test/bun0.pcd"],
    deps = [":surface_test_common"],
)

cc_test(
    name = "surface_test_ear_clipping",
    size = "small",
    srcs = ["test/surface/test_ear_clipping.cpp"],
    args = ["../pcl/test/bun0.pcd"],
    deps = [":surface_test_common"],
)

cc_test(
    name = "surface_test_poisson",
    size = "small",
    srcs = ["test/surface/test_poisson.cpp"],
    args = ["../pcl/test/bun0.pcd"],
    deps = [":surface_test_common"],
)

cc_test(
    name = "surface_test_convex_hull",
    size = "large",
    srcs = ["test/surface/test_convex_hull.cpp"],
    args = ["../pcl/test/bun0.pcd"],
    deps = [":surface_test_common"],
)

cc_test(
    name = "surface_test_concave_hull",
    size = "small",
    srcs = ["test/surface/test_concave_hull.cpp"],
    args = ["../pcl/test/bun0.pcd"],
    deps = [":surface_test_common"],
)
