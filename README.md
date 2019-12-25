# rules_pcl

Rules for building PCL with bazel.


## How to use

In your WORKSPACE file:

```
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "rules_pcl",
    path = "https://github.com/kgreenek/rules_pcl/archive/2c40974055b403733952956ddc3cde8eda1336fd.tar.gz",
    sha256 = "f8546232221ac48971cf681fecb431e263ea70250073806eacc713b8703f1a17",
    strip_prefix = "rules_pcl-2c40974055b403733952956ddc3cde8eda1336fd",
)

load("@rules_pcl//:bzl/pcl_deps.bzl", "pcl_deps")
pcl_deps()
load("@rules_pcl//:bzl/pcl-1.9.1_repositories.bzl", "pcl_repositories")
pcl_repositories()
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

Right now only a subset of libraries are supported.
