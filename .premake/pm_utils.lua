-- NOTE(illkwon): https://github.com/premake/premake-core/issues/767

local m = {}

local get_default_action = function(os_id)
    local default_action = {
        ["windows"] = "vs2017",
        ["linux"] = "gmake"
    }

    local selected_action = default_action[os_id]
    assert(selected_action ~= nil, "Failed to find default action of current os")

    return selected_action
end

local set_action = function(action)
    printf("Action: [%s]", action)
    _ACTION = action
end

function m.make_single_c_project_single_workspace(project_name)
    local target_os = os.host()
    printf("Current OS: [%s]", os.host())
    printf("Target OS: [%s]", target_os) -- TODO(illkwon): Should I set _TARGET_OS manually?
    set_action(get_default_action(target_os))

    local workspace_name = project_name .. "_ws"

    workspace(workspace_name)
        configurations {"debug", "release"}
        warnings "Extra"
        language "C"
        compileas "C"
        systemversion "latest"
        staticruntime "On"
        flags {
            "MultiProcessorCompile",
            "FatalCompileWarnings",
        }

        if os.istarget("windows") then
            platforms {
                "windows32",
                "windows64",
            }
        elseif os.istarget("linux") then
            platforms {
                "linux32",
                "linux64",
            }
        else
            assert(false, "Target platform [" .. _TARGET_OS .. "] is not supported!")
        end

        filter "platforms:*32"
            architecture "x86"

        filter "platforms:*64"
            architecture "x86_64"

        filter "platforms:windows*"
            system "windows"
            defines {"_CRT_SECURE_NO_WARNINGS"}
            disablewarnings {
                "4201", -- nameless union/struct is not a part of standard
                "4100", -- unreferenced formal parameter
                "4189", -- local variable is initialized but not referenced
                "4204", -- non-constant aggregate initializer is not a part of standard
            }
            characterset "MBCS"

        filter "platforms:linux*"
            system "linux"

    project(project_name)
        kind "ConsoleApp" -- TODO(illkwon): Choose between ConsoleApp and WindowedApp?
        files {"**.h", "**.c"}
        debugdir "data"

        filter "configurations:debug"
            intrinsics "on"
            targetdir "build/debug"
            defines "DEBUG"
        filter "configurations:release"
            targetdir "build/release"
            optimize "On"
end

return m
