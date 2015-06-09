#include <QApplication>
#include <QQmlApplicationEngine>


#include <QtQml/qtqml>
#include "fileio.h"

// Quick file reader app for QML
// Ken Shapiro, 6/6/2015.

// I did pull some source from online but I do understand what this
// code is doing.

// It's supposed to do a "proc/cpuinfo" and output that data, but since I'm
// doing this on Windows I just copied the output of a Linux server I control
// to a text file (cpuinfo1.txt) and uploaded it to this project.  It needs
// to be copied to the debug directory for this program to work.


int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    // there is no native file IO in QML so this gives it that facility via C++ extension
    qmlRegisterType<FileIO, 1>("FileIO", 1, 0, "FileIO");

    // now we execute the QML application
    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();
}
