function os.winSdkVersion()
    local reg_arch = iif( os.is64bit(), "\\Wow6432Node\\", "\\" )
    local sdk_version = os.getWindowsRegistry( "HKLM:SOFTWARE" .. reg_arch .."Microsoft\\Microsoft SDKs\\Windows\\v10.0\\ProductVersion" )
    print(sdk_version)
    if sdk_version ~= nil then return sdk_version .. ".0" end
end

workspace %WORKSPACE_NAME%
    architecture "x64"
    configurations {"debug", "release"}
    warnings "Extra"
    language "C++"
    compileas "C++"
    -- staticruntime "On" -- available on master build
    flags {"MultiProcessorCompile", "NoMinimalRebuild",
           "NoBufferSecurityCheck", "FatalCompileWarnings"}
    buildoptions "/std:c++latest"
    system "windows"
    systemversion(os.winSdkVersion())
    architecture "x64"
    defines {"_CRT_SECURE_NO_WARNINGS"}
    links {%LIB_NAMES_WITHOUT_EXTENSION%} -- TEMPLATE
    disablewarnings {"4204", "4133", "4505", "4456", "4201", "4100", "4189", "4458", "4819", "4127", "4701", "4291"}

project %PROJECT_NAME% -- TEMPLATE
    kind "ConsoleApp"

    files {"**.h", "**.hpp", "code/*.cpp", "code/*.c"}

    debugdir "data"

    filter "configurations:debug"
        targetdir "build/debug"
        defines {"DEBUG"}
        symbols "On"

    filter "configurations:release"
        targetdir "build/release"
        optimize "On"
