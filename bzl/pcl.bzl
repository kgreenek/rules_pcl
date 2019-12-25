load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

_PCL_CONFIG_H_TEMPLATE = "@pcl//:pcl_config.h.in"


def _cmakedefine_substitutions(*args):
    substitutions = {}
    for (cmakedefine_str, enabled) in args:
        full_cmakedefine_str = "#cmakedefine {}".format(cmakedefine_str)
        if enabled:
            substitutions[full_cmakedefine_str] = "#define {}".format(cmakedefine_str)
        else:
            substitutions[full_cmakedefine_str] = "/* #undef {} */".format(
                cmakedefine_str.split(" ")[0])
    return substitutions



def _log_level_substitutions(log_level):
    valid_log_levels = ["Always", "Error", "Warn", "Info", "Debug", "Verbose"]
    if not log_level in valid_log_levels:
        fail("log_level ({}) is invalid. Valid options are {}".format(log_level, valid_log_levels))
    return _cmakedefine_substitutions(
        ("VERBOSITY_LEVEL_ALWAYS", log_level == "Always"),
        ("VERBOSITY_LEVEL_ERROR", log_level == "Error"),
        ("VERBOSITY_LEVEL_WARN", log_level == "Warn"),
        ("VERBOSITY_LEVEL_INFO", log_level == "Info"),
        ("VERBOSITY_LEVEL_DEBUG", log_level == "Debug"),
        ("VERBOSITY_LEVEL_VERBOSE", log_level == "Verbose"),
    )


def _gen_pcl_config_impl(ctx):
    version_pretty_str = "{}.{}.{}{}".format(
        ctx.attr.version_major, ctx.attr.version_minor, ctx.attr.version_patch,
        "-dev" if ctx.attr.dev_version else "")
    dev_version_str = "1" if ctx.attr.dev_version else "0"
    substitutions = {
        "@CMAKE_BUILD_TYPE@": ctx.attr.build_type,
        "${PCL_VERSION_MAJOR}": ctx.attr.version_major,
        "${PCL_VERSION_MINOR}": ctx.attr.version_minor,
        "${PCL_VERSION_PATCH}": ctx.attr.version_patch,
        "${PCL_DEV_VERSION}": dev_version_str,
        "${PCL_VERSION_PRETTY}": version_pretty_str,
        # TODO(kgreenek): Will this ever need to be different here?
        "${VTK_RENDERING_BACKEND_OPENGL_VERSION}": "1",
    }
    substitutions.update(_log_level_substitutions(ctx.attr.log_level))
    substitutions.update(
        _cmakedefine_substitutions(
            ("PCL_NO_PRECOMPILE", ctx.attr.no_precompile),
            ("PCL_ONLY_CORE_POINT_TYPES", ctx.attr.no_precompile),
        )
    )
    # None of PCL's external dependencies are supported yet.
    substitutions.update(
        _cmakedefine_substitutions(
            ("HAVE_TBB 1", False),
            ("HAVE_OPENNI 1", False),
            ("HAVE_OPENNI2 1", False),
            ("HAVE_QHULL 1", False),
            ("HAVE_QHULL_2011 1", False),
            ("HAVE_CUDA 1", False),
            ("HAVE_FZAPI 1", False),
            ("HAVE_ENSENSO 1", False),
            ("HAVE_DAVIDSDK 1", False),
            ("HAVE_PNG", False),
        )
    )
    # SSE macros.
    # Just enable them all, since it should be rare that someone is targeting a platform that
    # doesn't support all of these. Please let us know if you have a specific use-case where this
    # doesn't hold.
    substitutions.update(
        _cmakedefine_substitutions(
            ("HAVE_POSIX_MEMALIGN", True),
            ("HAVE_MM_MALLOC", True),
            ("HAVE_SSE4_2_EXTENSIONS", True),
            ("HAVE_SSE4_1_EXTENSIONS", True),
            ("HAVE_SSSE3_EXTENSIONS", True),
            ("HAVE_SSE3_EXTENSIONS", True),
            ("HAVE_SSE2_EXTENSIONS", True),
            ("HAVE_SSE_EXTENSIONS", True),
        )
    )
    substitutions.update(
        _cmakedefine_substitutions(
            ("OPENGL_IS_A_FRAMEWORK", False),
            ("GLUT_IS_A_FRAMEWORK", False),
        )
    )
    ctx.actions.expand_template(
        template = ctx.file._template,
        substitutions = substitutions,
        output = ctx.outputs.pcl_config_hdr,
    )


gen_pcl_config = rule(
    implementation = _gen_pcl_config_impl,
    attrs = {
        "build_type": attr.string(default = "RelWithDebInfo"),
        "dev_version": attr.bool(default = False),
        "log_level": attr.string(default = "Info"),
        "no_precompile": attr.bool(default = False),
        "only_core_point_types": attr.bool(default = False),
        "version_major": attr.string(default = "1"),
        "version_minor": attr.string(default = "9"),
        "version_patch": attr.string(default = "1"),
        "_template": attr.label(
            default = Label(_PCL_CONFIG_H_TEMPLATE),
            allow_single_file = True,
        ),
    },
    outputs = {"pcl_config_hdr": "pcl_config.h"},
)


def pcl_library(name, **kwargs):
    exclude_srcs = kwargs.pop("exclude_srcs", [])
    exclude_hdrs = kwargs.pop("exclude_hdrs", [])
    native.cc_library(
        name = name,
        srcs = native.glob([
            "{}/src/**/*.cpp".format(name),
            "{}/include/**/*.hpp".format(name),
        ], exclude = exclude_srcs),
        hdrs = native.glob(["{}/include/**/*.h".format(name)], exclude=exclude_hdrs),
        includes = ["{}/include".format(name)],
        visibility = ["//visibility:public"],
        **kwargs
    )


def pcl_config(**kwargs):
    gen_pcl_config(name="_gen_pcl_config", **kwargs)
    native.cc_library(
        name = "pcl_config",
        hdrs = [":_gen_pcl_config"],
        include_prefix = "pcl",
        visibility = ["//visibility:public"],
    )
