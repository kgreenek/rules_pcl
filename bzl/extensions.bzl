load("//bzl:repositories.bzl", "pcl_repositories_non_module")

def _non_module_deps_impl(_ctx):
    pcl_repositories_non_module()

non_module_deps = module_extension(implementation = _non_module_deps_impl)
