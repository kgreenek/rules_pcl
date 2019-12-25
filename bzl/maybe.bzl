def pcl_maybe(repo_rule, name, **kwargs):
    """A wrapper around repo rules to prevent adding a rule if it already exists, e.g. if it was
        already added to a user's WORKSPACE file by other dependencies.
    """
    if name not in native.existing_rules():
        repo_rule(name = name, **kwargs)
