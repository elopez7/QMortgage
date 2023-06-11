cmake_minimum_required(VERSION 3.23)


find_package(Qt6 6.5 REQUIRED COMPONENTS Core Qml)

set(QT_QML_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/qml)

set(QML_IMPORT_PATH ${QT_QML_OUTPUT_DIRECTORY}
    CACHE STRING "Qt Creator loan helper import path"
    FORCE
)


qt_add_library(loanHelperModule STATIC)
qt6_add_qml_module(loanHelperModule
    URI "loanHelperModule"
    AUTO_RESOURCE_PREFIX
    VERSION 1.0
    PLUGIN_TARGET loanHelperModulePlugin
    IMPORT_PATH ${QT_QML_OUTPUT_DIRECTORY}
    SOURCES
        loanhelper.h
        loanhelper.cpp
        amortizationtablemodel.h
        amortizationtablemodel.cpp
        enumconverters.h
        loanDTO.h
        paymentDTO.h
)


target_include_directories(loanHelperModule
    PUBLIC "{CMAKE_CURRENT_SOURCE_DIR}/../"
    PRIVATE "{CMAKE_CURRENT_SOURCE_DIR}"
)

target_link_directories(loanHelperModule
    PRIVATE Qt6::Core
)
