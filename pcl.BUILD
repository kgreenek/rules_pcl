exports_files(["pcl_config.h.in"])

cc_library(
    name = "common",
    srcs = glob([
        "common/src/**/*.cpp",
        "common/include/**/*.hpp",
    ]),
    hdrs = glob(["common/include/**/*.h"]),
    includes = ["common/include"],
    visibility = ["//visibility:public"],
    deps = [
        "@//:pcl_config",
        "@boost//:algorithm",
        "@boost//:date_time",
        "@boost//:filesystem",
        "@boost//:fusion",
        "@boost//:mpl",
        "@boost//:preprocessor",
        "@boost//:signals2",
        "@eigen//:eigen",
    ],
)
