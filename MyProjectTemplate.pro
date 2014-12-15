TEMPLATE = app

QT += qml quick widgets

HEADERS +=

SOURCES += main.cpp

RESOURCES += \
    qml/qml.qrc \
    qml/material_ui/material_ui.qrc \
    qml/qml_bootstrap/qml_bootstrap.qrc \
    qml/page/page.qrc

OTHER_FILES += \
    qml/*.qml \
    qml/material_ui/*.qml \
    qml/page/*.qml

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)
include(mypositioning/mypositioning.pri)
include(myscreen/myscreen.pri)
