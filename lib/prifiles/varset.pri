THELIBS_INSTALL_PREFIX = $$PREFIX
equals(THELIBS_INSTALL_PREFIX, "") {
    THELIBS_INSTALL_PREFIX = $$[THELIBS_INSTALL_PREFIX]
}
equals(THELIBS_INSTALL_PREFIX, "") {
    THELIBS_INSTALL_PREFIX = $$[QT_INSTALL_PREFIX]
    CONFIG += THELIBS_INSTALL_PREFIX_IS_DEFAULT
}

equals(THELIBS_INSTALL_LIB, "") {
    THELIBS_INSTALL_PREFIX_IS_DEFAULT {
        THELIBS_INSTALL_LIB = $$[QT_INSTALL_LIBS]
    } else {
        THELIBS_INSTALL_LIB = $$THELIBS_INSTALL_PREFIX/lib
    }
}

equals(THELIBS_INSTALL_HEADERS, "") {
    THELIBS_INSTALL_PREFIX_IS_DEFAULT {
        THELIBS_INSTALL_HEADERS = $$[QT_INSTALL_HEADERS]
    } else {
        THELIBS_INSTALL_HEADERS = $$THELIBS_INSTALL_PREFIX/include
    }
}

equals(THELIBS_INSTALL_MODULES, "") {
    THELIBS_INSTALL_PREFIX_IS_DEFAULT {
        THELIBS_INSTALL_MODULES = $$[QMAKE_MKSPECS]/modules
    } else {
        THELIBS_INSTALL_HEADERS = $$THELIBS_INSTALL_PREFIX/qt/mkspecs/modules
    }
}

equals(THELIBS_INSTALL_BIN, "") {
    THELIBS_INSTALL_BIN = $$THELIBS_INSTALL_PREFIX/bin
}
