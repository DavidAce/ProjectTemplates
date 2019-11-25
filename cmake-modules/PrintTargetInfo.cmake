function(pad_string OUT_VARIABLE DESIRED_LENGTH FILL_CHAR VALUE)
    string(LENGTH "${VALUE}" VALUE_LENGTH)
    math(EXPR REQUIRED_PADS "${DESIRED_LENGTH} - ${VALUE_LENGTH}")
    set(PAD ${VALUE})
    if(REQUIRED_PADS GREATER 0)
        math(EXPR REQUIRED_MINUS_ONE "${REQUIRED_PADS} - 1")
        foreach(FOO RANGE ${REQUIRED_MINUS_ONE})
            set(PAD "${PAD}${FILL_CHAR}")
        endforeach()
    endif()
    set(${OUT_VARIABLE} "${PAD}" PARENT_SCOPE)
endfunction()

function(print_target_info target_name)
    if(TARGET ${target_name})
        get_target_property(INFO_INC  ${target_name} INTERFACE_INCLUDE_DIRECTORIES)
        get_target_property(INFO_LIB  ${target_name} INTERFACE_LINK_LIBRARIES)
        get_target_property(INFO_OPT  ${target_name} INTERFACE_COMPILE_OPTIONS)
        get_target_property(INFO_DEF  ${target_name} INTERFACE_COMPILE_DEFINITIONS)
        get_target_property(INFO_FTR  ${target_name} INTERFACE_COMPILE_FEATURES)
        pad_string(padded_target "20" " " "[${target_name}]" )
        if(INFO_INC)
            message(STATUS "${padded_target} INCLUDE: ${INFO_INC}" )
        endif()
        if(INFO_LIB)
            message(STATUS "${padded_target} LIBRARY: ${INFO_LIB}" )
        endif()
        if(INFO_OPT)
            message(STATUS "${padded_target} COMPILE: ${INFO_OPT}" )
        endif()
        if(INFO_DEF)
            message(STATUS "${padded_target} FLAGS  : ${INFO_DEF}" )
        endif()
        if(INFO_FTR)
            message(STATUS "${padded_target} FEATURE: ${INFO_FTR}" )
        endif()
    endif()
endfunction()
