# rules_pcl

Rules for building [PCL](https://github.com/PointCloudLibrary/pcl) with bazel.


## How to use

In your WORKSPACE file:

```
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "rules_pcl",
    url = "https://github.com/kgreenek/rules_pcl/archive/v1.0.0.tar.gz",
    sha256 = "91f224f1e76110a1478fae9f50f3a86821cb016b81f0abf5693dc7a9a3e0bfc7",
    strip_prefix = "rules_pcl-1.0.0",
)

load("@rules_pcl//bzl:repositories.bzl", "pcl_repositories")
pcl_repositories()

# NOTE: This must be loaded after the call to pcl_repositories().
load("@rules_pcl//bzl:init_deps.bzl", "pcl_init_deps")
pcl_init_deps()
```

In your top-level BUILD.bazel file:

```
load("@rules_pcl//bzl:pcl.bzl", "pcl_config")
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

PCL requires C++14. You can either pass it as an argument to the bazel build command:

```
bazel build --cxxopt='-std=c++14' //...
```

Or you can make C++14 the default for all builds by adding this to a file called `.bazelrc` in your
workspace root:

```
build --cxxopt='-std=c++14'
```

Or you can update your toolchain to build with C++14.

All sub-modules are currently supported except for the following:
* cuda
* gpu
* outofcore
* visualization

An example bazel workspace can be found under the //example directory of this repo.
