TEMPLATE = app

QT += qml quick widgets enginio

SOURCES += main.cpp \
    user.cpp \
    login.cpp \
    currentissue.cpp \
    timestamp.cpp

RESOURCES += qml.qrc

# Additional import path used to resolve QML modules in Qt Creator's code model
QML_IMPORT_PATH =

# Default rules for deployment.
include(deployment.pri)

HEADERS += \
    user.h \
    login.h \
    currentissue.h \
    timestamp.h
