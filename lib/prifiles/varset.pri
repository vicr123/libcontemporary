
THELIBS_INSTALL_PREFIX = PREFIX
equals(THELIBS_INSTALL_PREFIX, "") {
    THELIBS_INSTALL_PREFIX = $$[THELIBS_INSTALL_PREFIX]
}
equals(THELIBS_INSTALL_PREFIX, "") {
    THELIBS_INSTALL_PREFIX = $$[QT_INSTALL_PREFIX]
}

equals(THELIBS_INSTALL_LIB, "") {
    THELIBS_INSTALL_LIB = $$[QT_INSTALL_LIBS]
}

equals(THELIBS_INSTALL_HEADERS, "") {
    THELIBS_INSTALL_HEADERS = $$[QT_INSTALL_HEADERS]
}

equals(THELIBS_INSTALL_MODULES, "") {
    THELIBS_INSTALL_MODULES = $$[QMAKE_MKSPECS]/modules
}
