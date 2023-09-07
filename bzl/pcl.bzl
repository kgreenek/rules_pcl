_PCL_CONFIG_H_TEMPLATE = "@pcl//:pcl_config.h.in"

_PCL_AARCH64_COMPILER_CONFIG = {
    "have_posix_memalign": True,
    "have_mm_malloc": False,
    "have_sse4_2_extensions": False,
    "have_sse4_1_extensions": False,
    "have_ssse3_extensions": False,
    "have_sse3_extensions": False,
    "have_sse2_extensions": False,
    "have_sse_extensions": False,
}

_PCL_DEFAULT_COMPILER_CONFIG = {
    "have_posix_memalign": True,
    "have_mm_malloc": True,
    "have_sse4_2_extensions": True,
    "have_sse4_1_extensions": True,
    "have_ssse3_extensions": True,
    "have_sse3_extensions": True,
    "have_sse2_extensions": True,
    "have_sse_extensions": True,
}

def _compiler_config_value(value, kwargs):
    # NOTE: __pcl_linux-aarch64 is defined by the pcl_config macro.
    default_architecture_value = select({
        ":__pcl_linux-aarch64": _PCL_AARCH64_COMPILER_CONFIG[value],
        "//conditions:default": _PCL_DEFAULT_COMPILER_CONFIG[value],
    })
    return kwargs.pop(value, default_architecture_value)

def _cmakedefine_substitutions(*args):
    substitutions = {}
    for (cmakedefine_str, enabled) in args:
        full_cmakedefine_str = "#cmakedefine {}".format(cmakedefine_str)
        if enabled:
            substitutions[full_cmakedefine_str] = "#define {}".format(cmakedefine_str)
        else:
            substitutions[full_cmakedefine_str] = "/* #undef {} */".format(
                cmakedefine_str.split(" ")[0],
            )
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
        ctx.attr.version_major,
        ctx.attr.version_minor,
        ctx.attr.version_patch,
        "-dev" if ctx.attr.dev_version else "",
    )
    dev_version_str = "1" if ctx.attr.dev_version else "0"
    substitutions = {
        "@CMAKE_BUILD_TYPE@": ctx.attr.build_type,
        "${PCL_VERSION_MAJOR}": ctx.attr.version_major,
        "${PCL_VERSION_MINOR}": ctx.attr.version_minor,
        "${PCL_VERSION_PATCH}": ctx.attr.version_patch,
        "${PCL_DEV_VERSION}": dev_version_str,
        "${PCL_VERSION_PRETTY}": version_pretty_str,
        "${PCL_INDEX_SIZE}": "32",
        "${PCL_INDEX_SIGNED}": "false",
        "${PCL_INDEX_SIGNED_STR}": "false",
        # TODO(kgreenek): Will this ever need to be different here?
        "${VTK_RENDERING_BACKEND_OPENGL_VERSION}": "1",
    }
    substitutions.update(_log_level_substitutions(ctx.attr.log_level))
    substitutions.update(
        _cmakedefine_substitutions(
            ("PCL_NO_PRECOMPILE", ctx.attr.no_precompile),
            ("PCL_ONLY_CORE_POINT_TYPES", ctx.attr.no_precompile),
        ),
    )
    substitutions.update(
        _cmakedefine_substitutions(
            ("HAVE_TBB 1", False),
            ("HAVE_OPENNI 1", False),
            ("HAVE_OPENNI2 1", False),
            ("HAVE_QHULL 1", True),
            ("HAVE_QHULL_2011 1", True),
            ("HAVE_CUDA 1", False),
            ("HAVE_ENSENSO 1", False),
            ("HAVE_DAVIDSDK 1", False),
            ("HAVE_PNG", True),
            ("HAVE_QVTK 1", False),
            ("HAVE_FZAPI 1", False),
        ),
    )

    # SSE macros.
    substitutions.update(
        _cmakedefine_substitutions(
            ("HAVE_POSIX_MEMALIGN", ctx.attr.have_posix_memalign),
            ("HAVE_MM_MALLOC", ctx.attr.have_mm_malloc),
            ("HAVE_SSE4_2_EXTENSIONS", ctx.attr.have_sse4_2_extensions),
            ("HAVE_SSE4_1_EXTENSIONS", ctx.attr.have_sse4_1_extensions),
            ("HAVE_SSSE3_EXTENSIONS", ctx.attr.have_ssse3_extensions),
            ("HAVE_SSE3_EXTENSIONS", ctx.attr.have_sse3_extensions),
            ("HAVE_SSE2_EXTENSIONS", ctx.attr.have_sse2_extensions),
            ("HAVE_SSE_EXTENSIONS", ctx.attr.have_sse_extensions),
        ),
    )
    substitutions.update(
        _cmakedefine_substitutions(
            ("OPENGL_IS_A_FRAMEWORK", False),
            ("GLUT_IS_A_FRAMEWORK", False),
        ),
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
        "log_level": attr.string(default = "Info"),
        "no_precompile": attr.bool(default = False),
        "only_core_point_types": attr.bool(default = False),
        "version_major": attr.string(default = "1"),
        "version_minor": attr.string(default = "13"),
        "version_patch": attr.string(default = "1"),
        "dev_version": attr.bool(default = False),
        # Compiler config settings.
        "have_posix_memalign": attr.bool(default = True),
        "have_mm_malloc": attr.bool(default = True),
        "have_sse4_2_extensions": attr.bool(default = True),
        "have_sse4_1_extensions": attr.bool(default = True),
        "have_ssse3_extensions": attr.bool(default = True),
        "have_sse3_extensions": attr.bool(default = True),
        "have_sse2_extensions": attr.bool(default = True),
        "have_sse_extensions": attr.bool(default = True),
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
            "{}/src/**/*.c".format(name),
            "{}/src/**/*.cpp".format(name),
            "{}/include/**/*.hpp".format(name),
        ], exclude = exclude_srcs),
        hdrs = native.glob([
            "{}/include/**/*.h".format(name),
            "{}/include/**/*.hh".format(name),
        ], exclude = exclude_hdrs),
        copts = ["-Wno-unknown-pragmas"],
        includes = ["{}/include".format(name)],
        visibility = ["//visibility:public"],
        **kwargs
    )

def pcl_config(**kwargs):
    native.config_setting(
        name = "__pcl_linux-aarch64",
        constraint_values = [
            "@platforms//os:linux",
            "@platforms//cpu:aarch64",
        ],
    )
    gen_pcl_config(
        name = "__pcl_gen_pcl_config",
        have_posix_memalign = _compiler_config_value("have_posix_memalign", kwargs),
        have_mm_malloc = _compiler_config_value("have_mm_malloc", kwargs),
        have_sse4_2_extensions = _compiler_config_value("have_sse4_2_extensions", kwargs),
        have_sse4_1_extensions = _compiler_config_value("have_sse4_1_extensions", kwargs),
        have_ssse3_extensions = _compiler_config_value("have_ssse3_extensions", kwargs),
        have_sse3_extensions = _compiler_config_value("have_sse3_extensions", kwargs),
        have_sse2_extensions = _compiler_config_value("have_sse2_extensions", kwargs),
        have_sse_extensions = _compiler_config_value("have_sse_extensions", kwargs),
        **kwargs
    )
    native.cc_library(
        name = "pcl_config",
        hdrs = [":__pcl_gen_pcl_config"],
        include_prefix = "pcl",
        visibility = ["//visibility:public"],
    )
