if(CMT_PACKAGE_MANAGER MATCHES "fetch")
    if(CMT_ENABLE_H5PP)
        if(NOT TARGET h5pp::h5pp)
            include(cmake/Fetch_h5pp.cmake)
        endif()
        if(TARGET h5pp::h5pp)
            target_link_libraries(cmt-dependencies INTERFACE h5pp::h5pp)
        else()
            message(FATAL_ERROR "Failed FetchContent: h5pp")
        endif()
    endif()

    if(CMT_ENABLE_FMT)
        if(NOT TARGET fmt::fmt)
            include(cmake/Fetch_fmt.cmake)
        endif()
        if(TARGET fmt::fmt)
            target_link_libraries(cmt-dependencies INTERFACE fmt::fmt)
        else()
            message(FATAL_ERROR "Failed FetchContent: fmt")
        endif()
    endif()



    if(CMT_ENABLE_EIGEN3)
        if(NOT TARGET Eigen3::Eigen)
            include(cmake/Fetch_Eigen3.cmake)
        endif()
        if(TARGET Eigen3::Eigen)
            target_link_libraries(cmt-dependencies INTERFACE Eigen3::Eigen)
        else()
            message(FATAL_ERROR "Failed FetchContent: Eigen3")
        endif()
    endif()
endif()