project "ozz_base"
	filter "options:static"
		kind "StaticLib"
	filter "options:sharedexport"
		kind "SharedLib"
	filter "options:sharedimport"
		kind "SharedLib"
	filter{}
	language "C++"
	cppdialect "C++17"
	staticruntime "off"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")


	filter "options:sharedexport"
		defines
		{
			"OZZ_USE_DYNAMIC_LINKING",
			"OZZ_BUILD_BASE_LIB"
		}
		
	filter "options:sharedimport"
		defines
		{
			"OZZ_USE_DYNAMIC_LINKING"
		}
	filter {}

	files
	{
		"include/ozz/base/**.h",
		"src/base/**.cc"
	}

	includedirs
	{
		"include",
		"src"
	}

	

	filter "system:windows"
		systemversion "latest"

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"

	filter "configurations:Dist"
		runtime "Release"
		optimize "on"


project "ozz_animation"
	filter "options:static"
		kind "StaticLib"
	filter "options:sharedexport"
		kind "SharedLib"
	filter "options:sharedimport"
		kind "SharedLib"
	filter {}
	language "C++"
	cppdialect "C++17"
	staticruntime "off"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

	
	filter "options:sharedexport"
		defines
		{
			"OZZ_USE_DYNAMIC_LINKING",
			"OZZ_BUILD_ANIMATION_LIB"
		}
		links
		{
			"ozz_base"
		}
	filter "options:sharedimport"
		defines
		{
			"OZZ_USE_DYNAMIC_LINKING"
		}
	
	filter {}

	files
	{
	    "include/ozz/animation/runtime/**.h",
		"src/animation/runtime/**.h",
		"src/animation/runtime/**.cc"
	}

	includedirs
	{
		"include",
		"src"
	}

	

	filter "system:windows"
		systemversion "latest"

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"

	filter "configurations:Dist"
		runtime "Release"
		optimize "on"


-- ozz_geometry is for software skinning
-- we dont need this
--project "ozz_geometry"
--	kind "StaticLib"
--	language "C++"
--	cppdialect "C++11"
--	staticruntime "off"
--
--	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
--	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")
--
--	files
--	{
--	    "include/ozz/geometry/runtime/**.h",
--		"src/geometry/runtime/**.h",
--		"src/geometry/runtime/**.cc"
--	}
--
--	includedirs
--	{
--		"include",
--		"src"
--	}
--
--	filter "system:windows"
--		systemversion "latest"
--
--	filter "configurations:Debug"
--		runtime "Debug"
--		symbols "on"
--
--	filter "configurations:Release"
--		runtime "Release"
--		optimize "on"
--
--	filter "configurations:Dist"
--		runtime "Release"
--		optimize "on"


-- ozz_animation_offline provides support for import of assets from digital content creators
-- (where we write the actual importers ourselves)
project "ozz_animation_offline"
	filter "options:static"
		kind "StaticLib"
	filter "options:sharedexport"
		kind "SharedLib"
	filter "options:sharedimport"
		kind "SharedLib"
	filter{}
	language "C++"
	cppdialect "C++17"
	staticruntime "off"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")


	filter "options:sharedexport"
		defines
		{
			"OZZ_USE_DYNAMIC_LINKING",
			"OZZ_BUILD_ANIMOFFLINE_LIB"
		}
		links
		{
			"ozz_base",
			"ozz_animation"
		}
	filter "options:sharedimport"
		defines
		{
			"OZZ_USE_DYNAMIC_LINKING"
		}
	filter {}
	-- wildcards are not recursive here, on purpose
	files
	{
		"include/ozz/animation/offline/*.h",
		"src/animation/offline/*.h",
		"src/animation/offline/*.cc"
	}

	includedirs
	{
		"include",
		"src"
	}

	

	filter "system:windows"
		systemversion "latest"

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"