
newoption {
    trigger = "project_name",
    description = "Name of a project"
}

newoption {
    trigger = "abs_root_path",
    description = "Path of absolute root directory"
}

local project_name = _OPTIONS["project_name"];
local abs_root_path = _OPTIONS["abs_root_path"];
assert(project_name ~= nil, "project_name is not specified")
assert(abs_root_path ~= nil, "abs_root_path is not specified")

local pm = require "pm_utils"
pm.make_single_c_project_single_workspace(project_name, abs_root_path)
