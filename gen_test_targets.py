#!/usr/bin/env python3
import argparse
import os

EXCLUDE_TESTS = {
    # This test loads a file in code using an env var rather than taking an argument.
    "geometry": ["test_mesh_io"],
}

MEDIUM_TESTS = {
    "filters": ["test_crop_hull"],
    "io": ["test_io"],
}
LARGE_TESTS = {
    "common": ["test_eigen"],
}

RENAME_DEPS = {
    ":gtest": ":test",
    "FLANN::FLANN": "@flann",
}

EXTRA_SRCS = {
    "geometry": {
        "all": ["test/geometry/test_mesh_common_functions.h"],
    },
    "search": {
        "all": ["test/search/precise_distances.h"],
    },
}

# These targets are missing required deps, which works with cmake but not bazel.
EXTRA_DEPS = {
    "2d": {
        "test_2d_keypoint_instantiation_with_precompile": [":2d"],
        "test_2d_keypoint_instantiation_without_precompile": [":2d"],
    },
    "io": {
        "test_buffers": [":io"]
    },
    "octree": {
        "test_octree": [":octree"],
    },
    "registration": {
        "test_correspondence_estimation": [":io"],
    },
}

PARSER_STATE_NONE = "NONE"
PARSER_STATE_TEST_NAME = "TEST_NAME"
PARSER_STATE_SRCS = "SRCS"
PARSER_STATE_DEPS = "DEPS"
PARSER_STATE_ARGS = "ARGS"


def parse_args() -> tuple[list[str], any]:
    parser = argparse.ArgumentParser(
        description="Generates bazel BUILD targets for test targets")
    parser.add_argument("--pcl_path", help="Path to the local pcl source code")
    parser.add_argument("--pcl_lib",
                        help="The pcl library to generate tests for")
    parser.add_argument("--out", "-o", help="Path to the output BUILD file")
    return parser.parse_args()


def main():
    args = parse_args()
    test_lib_path = os.path.join(args.pcl_path, "test", args.pcl_lib)
    cmakelists_path = os.path.join(test_lib_path, "CMakeLists.txt")
    with open(cmakelists_path) as cmakelists_file:
        with open(args.out, "w") as out_file:
            parser_state = PARSER_STATE_NONE
            test_name = None
            srcs = []
            deps = []
            arguments = []
            target_complete = False
            for line in cmakelists_file:
                line = line.strip()
                # Example line defining a test:
                # PCL_ADD_TEST(common_test_wrappers test_wrappers FILES test_wrappers.cpp LINK_WITH pcl_gtest pcl_common)
                words = line.split()
                word_index = 0
                if parser_state == PARSER_STATE_NONE:
                    if not line.startswith("PCL_ADD_TEST"):
                        continue
                    # Handle spurious whitespace like "PCL_ADD_TEST (foo ...".
                    test_line_parts = line.split("(")
                    assert (len(test_line_parts) == 2)
                    words = test_line_parts[1].split()
                    test_name = words[1]
                    parser_state = PARSER_STATE_SRCS
                    print(test_name)
                    word_index = 2

                while word_index < len(words):
                    word = words[word_index]
                    if word == "FILES":
                        parser_state = PARSER_STATE_SRCS
                        word_index += 1
                        continue
                    if word == "LINK_WITH":
                        parser_state = PARSER_STATE_DEPS
                        word_index += 1
                        continue
                    if word == "ARGUMENTS":
                        parser_state = PARSER_STATE_ARGS
                        word_index += 1
                        continue

                    if word.endswith(")"):
                        target_complete = True
                        word = word.rstrip(")").strip()

                    if parser_state == PARSER_STATE_SRCS:
                        srcs.append(os.path.join("test", args.pcl_lib, word))
                    elif parser_state == PARSER_STATE_DEPS:
                        dep = word.replace("pcl_", ":")
                        if dep in RENAME_DEPS:
                            dep = RENAME_DEPS[dep]
                        deps.append(dep)
                    elif parser_state == PARSER_STATE_ARGS:
                        arguments.append(word)

                    if target_complete:
                        if args.pcl_lib in EXCLUDE_TESTS and test_name in EXCLUDE_TESTS[
                                args.pcl_lib]:
                            print(
                                f"WARNING: Skipping excluded test {test_name}")
                        elif len(arguments) > 0:
                            # Some PCL tests require pass arguments. Maybe I'll figure out later how to landle
                            # this...
                            print(
                                f"WARNING: Skipping test {test_name} because it requires args"
                            )
                        else:
                            if args.pcl_lib in EXTRA_SRCS:
                                if "all" in EXTRA_SRCS[args.pcl_lib]:
                                    for extra_src in EXTRA_SRCS[
                                            args.pcl_lib]["all"]:
                                        if extra_src not in srcs:
                                            srcs.append(extra_src)
                                if test_name in EXTRA_SRCS[args.pcl_lib]:
                                    srcs.extend(
                                        EXTRA_SRCS[args.pcl_lib][test_name])
                            if args.pcl_lib in EXTRA_DEPS and test_name in EXTRA_DEPS[
                                    args.pcl_lib]:
                                deps.extend(
                                    EXTRA_DEPS[args.pcl_lib][test_name])
                            srcs.sort()
                            deps.sort()
                            arguments.sort()
                            size = "small"
                            if args.pcl_lib in LARGE_TESTS and test_name in LARGE_TESTS[
                                    args.pcl_lib]:
                                size = "large"
                            elif args.pcl_lib in MEDIUM_TESTS and test_name in MEDIUM_TESTS[
                                    args.pcl_lib]:
                                size = "medium"
                            out_file.write("cc_test(\n")
                            out_file.write(
                                f"    name = \"{args.pcl_lib}_{test_name}\",\n"
                            )
                            out_file.write(f"    size = \"{size}\",\n")
                            if len(srcs) == 1:
                                out_file.write(
                                    f"    srcs = [\"{srcs[0]}\"],\n")
                            else:
                                out_file.write("    srcs = [\n")
                                for src in srcs:
                                    out_file.write(f"        \"{src}\",\n")
                                out_file.write("    ],\n")
                            if len(deps) == 1:
                                out_file.write(
                                    f"    deps = [\"{deps[0]}\"],\n")
                            else:
                                out_file.write("    deps = [\n")
                                for dep in deps:
                                    out_file.write(f"        \"{dep}\",\n")
                                out_file.write("    ],\n")
                            out_file.write(")\n")
                            out_file.write("\n")

                        # Reset state
                        parser_state = PARSER_STATE_NONE
                        test_name = None
                        srcs = []
                        deps = []
                        arguments = []
                        target_complete = False

                        # Ignore the rest of the line.
                        break

                    word_index += 1


if __name__ == "__main__":
    main()
