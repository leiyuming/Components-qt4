TEMPLATE = lib
TARGET = Components
QT += declarative
CONFIG += qt plugin

TARGET = $$qtLibraryTarget($$TARGET)
uri = Components

# Input
SOURCES += \
    components_plugin.cpp \
    item/WheelArea.cpp \
    item/Tip.cpp \
    item/DropArea.cpp \
    item/CursorArea.cpp \
    Util.cpp \
    item/Pixmap.cpp \
    item/Dialog.cpp \
    item/UiMoveControl.cpp \
    item/PopWindow.cpp \
    item/Window.cpp \
    item/InvokeQML.cpp \
    item/ToolTip.cpp \
    item/Settings.cpp \
    item/EventLoop.cpp \
    item/Style.cpp \
    item/Invoker.cpp \
    item/GraphicsEffect.cpp \
    item/Arc.cpp \
    item/SheetEffect.cpp \
    item/OpacityEffect.cpp

HEADERS += \
    components_plugin.h \
    item/WheelArea.h \
    item/Tip.h \
    item/DropArea.h \
    item/CursorArea.h \
    Util.h \
    item/Pixmap.h \
    item/Dialog.h \
    item/UiMoveControl.h \
    item/PopWindow.h \
    item/Window.h \
    item/InvokeQML.h \
    item/ToolTip.h \
    item/Settings.h \
    item/EventLoop.h \
    item/Style.h \
    item/Invoker.h \
    item/GraphicsEffect.h \
    item/Arc.h \
    item/SheetEffect.h \
    item/OpacityEffect.h

OTHER_FILES = qmldir

!equals(_PRO_FILE_PWD_, $$OUT_PWD) {
    copy_qmldir.target = $$OUT_PWD/qmldir
    copy_qmldir.depends = $$_PRO_FILE_PWD_/qmldir
    copy_qmldir.commands = $(COPY_FILE) \"$$replace(copy_qmldir.depends, /, $$QMAKE_DIR_SEP)\" \"$$replace(copy_qmldir.target, /, $$QMAKE_DIR_SEP)\"
    QMAKE_EXTRA_TARGETS += copy_qmldir
    PRE_TARGETDEPS += $$copy_qmldir.target
}

RESOURCES += \
    components.qrc \
    res.qrc

FORMS +=
