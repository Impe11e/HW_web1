from abc import ABC, abstractmethod

from GUI_Interface import main as guimain


class BotInterface(ABC):
    @abstractmethod
    def main(self):
        pass


class ConsoleBotInterface(BotInterface):
    def main(self):
        raise NotImplementedError('Я ще не зроблений :)')


class GUIBotInterface(BotInterface):
    def main(self):
        guimain()


def main():
    interface_format = str(input("Введіть в якому форматі ви хочете використовувати бота (GUI / Console): ")).lower()
    if interface_format == "gui":
        gui = GUIBotInterface()
        gui.main()
    elif interface_format == "console":
        console = ConsoleBotInterface()
        console.main()
    else:
        raise Exception("Невідомий формат інтерфейсу!")


if __name__ == '__main__':
    main()
