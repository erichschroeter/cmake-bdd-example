# FindCucumberCpp.cmake
#
# Finds the cucumber-cpp library
#
# This will define the following variables
#
#    CucumberCpp_FOUND
#    CucumberCpp_INCLUDE_DIRS
#
# and the following imported targets
#
#     CucumberCpp::CucumberCpp
#

find_package(PkgConfig)
pkg_check_modules(PC_CucumberCpp QUIET CucumberCpp)

find_path(CucumberCpp_INCLUDE_DIR
    NAMES cucumber-cpp/autodetect.hpp
    PATHS ${PC_CucumberCpp_INCLUDE_DIRS} ENV CUCUMBER_CPP_ROOT
    PATH_SUFFIXES include
)

set(CucumberCpp_VERSION ${PC_CucumberCpp_VERSION})

mark_as_advanced(CucumberCpp_FOUND CucumberCpp_INCLUDE_DIR CucumberCpp_VERSION)

include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(CucumberCpp
    REQUIRED_VARS CucumberCpp_INCLUDE_DIR
    VERSION_VAR CucumberCpp_VERSION
)

if(CucumberCpp_FOUND)
    set(CucumberCpp_INCLUDE_DIRS ${CucumberCpp_INCLUDE_DIR})
endif()

if(CucumberCpp_FOUND AND NOT TARGET CucumberCpp::CucumberCpp)
    add_library(CucumberCpp::CucumberCpp INTERFACE IMPORTED)
    set_target_properties(CucumberCpp::CucumberCpp PROPERTIES
        INTERFACE_INCLUDE_DIRECTORIES "${CucumberCpp_INCLUDE_DIR}"
    )
endif()
