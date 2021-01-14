workspace "EmptySFMLProject"
    architecture "x86_64"
    startproject "EmptySFMLProject"

    configurations
    {
        "Debug",
        "Release"
    }

outputdir = "%{cfg.buildcfg}-%{cfg.system}-%{cfg.architecture}"

IncludeDir = {}
IncludeDir["SFML"] = "%{wks.location}/EmptySFMLProject/vendor/SFML/include"

LibraryDir = {}
LibraryDir["SFML"] = "%{wks.location}/EmptySFMLProject/vendor/SFML/lib"

project "EmptySFMLProject"
    kind "ConsoleApp"
    language "C++"
    cppdialect "C++17"
		
		location("%{wks.location}/EmptySFMLProject")

    targetdir ("%{wks.location}/bin/" .. outputdir .. "/%{prj.name}")
	objdir ("%{wks.location}/bin-int/" .. outputdir .. "/%{prj.name}")

	files
	{
		"EmptySFMLProject/src/**.h",
		"EmptySFMLProject/src/**.cpp"
	}

	defines
	{
	}

	includedirs
	{
		"src",
		"%{IncludeDir.SFML}"
	}
	
	libdirs
	{
		"%{LibraryDir.SFML}"
	}

	filter "system:windows"
		systemversion "latest"

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"
		
		links
		{
			"sfml-graphics-d.lib",
			"sfml-window-d.lib",
			"sfml-system-d.lib"

		}

	filter "configurations:Release"
		runtime "Release"
		optimize "on"
		
		defines
		{
			"SFML_STATIC"
		}
		
		links
		{
			"winmm.lib",
			"opengl32.lib",
			"freetype.lib",
			"sfml-graphics-s.lib",
			"sfml-window-s.lib",
			"sfml-system-s.lib"
		}
