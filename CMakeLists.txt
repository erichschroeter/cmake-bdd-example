cmake_minimum_required(VERSION 3.5)

project(hello)

set(CMAKE_MODULE_PATH ${PROJECT_SOURCE_DIR}/cmake/modules)

enable_testing()
set(GMOCK_ROOT ${CMAKE_CURRENT_BINARY_DIR}/gmock)
set(GMOCK_VER "1.8.0")
find_package(GMock REQUIRED)

find_package(CucumberCpp REQUIRED)

add_library(calc
	src/calc.h
	src/calc.cpp
	)
target_include_directories(calc
	PUBLIC
		${CMAKE_SOURCE_DIR}/src
	)

add_executable(step_definition_runner
	features/step_definitions/Add_Steps.cpp
	)
target_include_directories(step_definition_runner
	PRIVATE
		${CucumberCpp_INCLUDE_DIR}
		${GMOCK_INCLUDE_DIRS}
	)
target_link_libraries(step_definition_runner calc ${GMOCK_BOTH_LIBRARIES})

#get_cmake_property(_variableNames VARIABLES)
#foreach (_variableName ${_variableNames})
    #message(STATUS "${_variableName}=${${_variableName}}")
#endforeach()
