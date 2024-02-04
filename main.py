import sys
import os
from PySide6.QtQml import *
from PySide6.QtGui import *
from backend import Backend


def main():
    application = QGuiApplication(sys.argv)
    engine = QQmlApplicationEngine()
    backend = Backend()

    context = engine.rootContext()
    context.setContextProperty("backend", backend)

    engine.load(os.path.join(os.path.dirname(__file__), "./qml/main.qml"))
    if not engine.rootContext():
        sys.exit(-1)
    
    try:
        sys.exit(application.exec())
    except:
        pass

if __name__ == "__main__":
    main()
