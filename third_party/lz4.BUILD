licenses(["notice"])  # BSD 2-Clause

cc_library(
    name = "lz4",
    srcs = [
        "lib/lz4.c",
        "lib/lz4frame.c",
        "lib/lz4hc.c",
        "lib/xxhash.c",
    ],
    hdrs = [
        "lib/lz4.h",
        "lib/lz4frame.h",
        "lib/lz4frame_static.h",
        "lib/lz4hc.h",
        "lib/xxhash.h",
    ],
    include_prefix = "lz4",
    includes = ["lib"],
    strip_include_prefix = "lib",
    # This c file is included by lib/lz4hc.c
    textual_hdrs = ["lib/lz4.c"],
    visibility = ["//visibility:public"],
)
