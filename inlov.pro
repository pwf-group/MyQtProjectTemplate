TEMPLATE = app

QT += qml quick

ANDROID_PACKAGE_SOURCE_DIR = $$PWD/android-sources

HEADERS += \
    src/myapplication.h \
    src/inlovservice.h \
    src/eventdetails.h \
    src/attendeesmodel.h
	
SOURCES += \
    src/main.cpp \
    src/myapplication.cpp \
    src/inlovservice.cpp \
    src/eventdetails.cpp \
    src/attendeesmodel.cpp

RESOURCES += \
    qml/qml.qrc \
    qml/material_ui/material_ui.qrc \
    qml/mycomponent/mycomponent.qrc \
    qml/qml_bootstrap/qml_bootstrap.qrc \
    qml/page/page.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)
include(myscreen/myscreen.pri)
#include(mypositioning/mypositioning.pri)