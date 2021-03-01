QT -= gui

CONFIG += c++11 console
CONFIG -= app_bundle

# You can make your code fail to compile if it uses deprecated APIs.
# In order to do so, uncomment the following line.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

SOURCES += \
        desktopfile.cpp \
        jsonfile.cpp \
        main.cpp

unix:!macx {
    target.path = /usr/bin
    INSTALLS += target
}

HEADERS += \
    desktopfile.h \
    jsonfile.h