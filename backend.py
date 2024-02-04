from PySide6.QtCore import QObject, Signal, Slot

class Backend(QObject):
    loginSignal = Signal(str, str)
    registerSignal = Signal(str, str)

    def __init__(self):
        super().__init__()

    @Slot(str, str)
    def login(self, username, password):
        self.username = username
        self.password = password
        print(f"Login: {username} {password}")
        self.loginSignal.emit(username, password)
    
    @Slot(str, str)
    def register(self, username, password):
        self.username = username
        self.password = password
        print(f"Register: {username} {password}")
        self.registerSignal.emit(username, password)
