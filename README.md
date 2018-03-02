
# Compile

    cmake -E make_directory build
    cmake -E chdir build cmake ..
    cmake --build build

# Troubleshooting

If during the `cmake ..` step it cannot find the **CucumberCpp_INCLUDE_DIR**, make sure the set the environment variable **CUCUMBER_CPP_ROOT** to the location where you cloned the cucumber-cpp repo.

