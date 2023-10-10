# rules_pcl

Rules for building [PCL](https://github.com/PointCloudLibrary/pcl) with bazel.


## How to use

In your WORKSPACE.bazel file:

```
load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

http_archive(
    name = "rules_pcl",
    url = "https://github.com/kgreenek/rules_pcl/archive/refs/tags/pcl-1.13.1-v1.tar.gz",
    sha256 = "06d2ed755fbf9ddd30f8bb3ed73f23ee6155d52e742d4e4a278c9458e9a3e17b",
    strip_prefix = "rules_pcl-pcl-1.13.1-v1",
)

load("@rules_pcl//bzl:repositories.bzl", "pcl_repositories")
pcl_repositories()

# NOTE: This must be loaded after the call to pcl_repositories().
load("@rules_pcl//bzl:init_deps.bzl", "pcl_init_deps")
pcl_init_deps()
```

There are a set of config flags that can be used to customize how pcl is compiled. The defaults will
suffice for most. See [BUILD.bazel](BUILD.bazel) and [bzl/pcl.bzl](bzl/pcl.bzl) for more info.

For example, to change the log level:

```
build --@rules_pcl//:log_level=Debug
```

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

### bzlmod

With Bazelmod enabled, (`--enable_bzlmod`), add the following to your `MODULE.bzl` file:

```
bazel_dep(name = "rules_pcl", version = "0.0.0", dev_dependency = True)
non_module_deps = use_extension("@rules_pcl//bzl:extensions.bzl", "non_module_deps")
use_repo(non_module_deps, "pcl")
```

Example `.bazelrc` usage:
```
common:bzlmod --enable_bzlmod
common:bzlmod --registry=https://raw.githubusercontent.com/kgreenek/rules_pcl/main
common:bzlmod --registry=https://bcr.bazel.build
```