# rules_pcl

Rules for building [PCL](https://github.com/PointCloudLibrary/pcl) with bazel.


## How to use

In your WORKSPACE file:

```
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "rules_pcl",
    path = "https://github.com/kgreenek/rules_pcl/archive/c62afc4f026bd7453b44e54d83b06919cf79c6a7.tar.gz",
    sha256 = "3bc58bd33e6c0555aabd2b9ade0daa75c1d3c1630241a36652670d0095d9dcb5",
    strip_prefix = "rules_pcl-c62afc4f026bd7453b44e54d83b06919cf79c6a7",
)

load("@rules_pcl//bzl:repositories.bzl", "pcl_repositories")
pcl_repositories()

# NOTE: This must be loaded after the call to pcl_repositories().
load("@rules_pcl//bzl:init_deps.bzl", "pcl_init_deps")
pcl_init_deps()
```

In your top-level BUILD.bazel file:

```
load("@rules_pcl//:bzl/pcl.bzl", "pcl_config")
pcl_config()
```

You can customize how pcl is compiled by passing args to the pcl_config() macro, but the defaults
will suffice for most. See bzl/pcl.bzl for more info.

To define a target that depends on PCL:

```
cc_binary(
    name = "example",
    srcs = ["main.cc"],
    deps = ["@pcl//:common"],
)
```

Right now only a subset of libraries are supported. For supported libraries, see `//bzl/pcl.bzl`.
