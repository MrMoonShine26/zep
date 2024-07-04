project "Zep"
	kind "StaticLib"
	language "C++"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		-- "src/**.h",
		"src/**.cpp",
		"src/mcommon/*/**.cpp",
		"include/**.h"
	}
    removefiles { 
            "src/tests/*.*"
    }
	includedirs
	{
		"include"
	}

	defines
	{
		"ZEP_FEATURE_CPP_FILE_SYSTEM"
	}

	filter "system:windows"
		systemversion "latest"
		cppdialect "C++20"
		staticruntime "off"

	filter "system:linux"
		pic "On"
		systemversion "latest"
		cppdialect "C++20"
		staticruntime "off"

	filter "system:macosx"
		cppdialect "c++20"
		staticruntime "off"

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"
