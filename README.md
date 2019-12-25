# rules_pcl

Rules for building PCL with bazel.


## How to use

In your WORKSPACE file:

```
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "rules_pcl",
    path = "https://github.com/kgreenek/rules_pcl/archive/e693a85a21972616408c1fb2b350f39058ab9181.tar.gz",
    sha256 = "7b007e5dab1796dab0e8ce849e6b55ceb12b8c920ab414a09b9145c525cb3a10",
    strip_prefix = "rules_pcl-e693a85a21972616408c1fb2b350f39058ab9181",
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
