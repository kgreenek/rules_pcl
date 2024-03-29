# Description:
#   Eigen is a C++ template library for linear algebra: vectors,
#   matrices, and related algorithms.

licenses([
    # Note: Eigen is an MPL2 library that includes GPL v3 and LGPL v2.1+ code.
    #       We've taken special care to not reference any restricted code.
    "reciprocal",  # MPL2
    "notice",  # Portions BSD
])

exports_files(["COPYING.MPL2"])

EIGEN_FILES = [
    "Eigen/**",
    "unsupported/Eigen/**",
]

# Non MPL2 files
EIGEN_RESTRICTED_FILES = [
    "unsupported/Eigen/src/IterativeSolvers/IterationController.h",
    "unsupported/Eigen/src/IterativeSolvers/ConstrainedConjGrad.h",
]

EIGEN_MPL2_HEADER_FILES = glob(
    EIGEN_FILES,
    exclude = EIGEN_RESTRICTED_FILES,
)

cc_library(
    name = "eigen",
    hdrs = EIGEN_MPL2_HEADER_FILES,
    defines = ["EIGEN_MPL2_ONLY"],
    includes = ["."],
    visibility = ["//visibility:public"],
)
