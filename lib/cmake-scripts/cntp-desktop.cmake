function(cntp_target_install_desktop_file target translationfile)
    IF(${CMAKE_SYSTEM_NAME} MATCHES "Linux")
        find_path(CNTPTRDESKTOP_PATH cntp-trdesktop)
        IF(${CNTPTRDESKTOP_PATH} STREQUAL "CNTPTRDESKTOP_PATH-NOTFOUND")
            message(FATAL_ERROR "cntp-trdesktop executable not available, desktop file translations cannot be created")
        ELSE()
            message("-- Finding desktop files to generate translations for (target ${target})")
            get_filename_component(translationfile_noext ${translationfile} NAME_WLE)

            add_custom_target(${target}_CNTPDESKTOPTRANSLATIONS
                    COMMAND ${CNTPTRDESKTOP_PATH}/cntp-trdesktop --json-generate --json-directory ${CMAKE_CURRENT_SOURCE_DIR}/translations/desktop/${translationfile_noext}/ --desktop-template ${translationfile}
                    WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
                    COMMENT "Generating .desktop translation files"
                    VERBATIM)
            add_dependencies(${target} ${target}_CNTPDESKTOPTRANSLATIONS)

            add_custom_target(${target}_CNTPDESKTOPTRANSLATIONMERGE
                    COMMAND ${CNTPTRDESKTOP_PATH}/cntp-trdesktop --desktop-generate --json-directory ${CMAKE_CURRENT_SOURCE_DIR}/translations/desktop/${translationfile_noext}/ --desktop-template ${translationfile} --desktop-output ${CMAKE_CURRENT_BINARY_DIR}/${translationfile_noext}.desktop
                    WORKING_DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}
                    COMMENT "Generating .desktop file from translations"
                    VERBATIM)
            add_dependencies(${target} ${target}_CNTPDESKTOPTRANSLATIONMERGE)

            install(FILES ${CMAKE_CURRENT_BINARY_DIR}/${translationfile_noext}.desktop
                    DESTINATION ${CMAKE_INSTALL_DATADIR}/applications/)
        ENDIF()
    ENDIF()
endfunction()

function(cntp_target_install_desktop_file_switch target translationfile blueprintfile)
    # TODO: Blueprint detection
    cntp_target_install_desktop_file(${target} ${translationfile})
endfunction()