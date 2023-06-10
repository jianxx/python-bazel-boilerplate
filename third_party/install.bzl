"""This file contains bazel repository installation logic.

As of now, load statements are not lazily evaluated (therefore not allowed in functions).
As a workaround, we created this file to call the macros defined in repositories loaded
in deps.bzl.
"""

load("@bazel_gazelle//:deps.bzl", "gazelle_dependencies")
load("@io_bazel_rules_go//go:deps.bzl", "go_register_toolchains", "go_rules_dependencies")

def install_gazelle_dependencies():
    """install installs dependencies and toolchains in the dependent repositories."""

    # go_rules_dependencies is a function that registers external dependencies needed by the Go rules.
    # See: https://github.com/bazelbuild/rules_go/blob/master/go/dependencies.rst#go_rules_dependencies
    go_rules_dependencies()

    # go_rules_dependencies is a function that registers external dependencies needed by the Go rules.
    # See: https://github.com/bazelbuild/rules_go/blob/master/go/dependencies.rst#go_rules_dependencies
    go_register_toolchains(version = "1.18.10")

    # The following call configured the gazelle dependencies, Go environment and Go SDK.
    gazelle_dependencies()
