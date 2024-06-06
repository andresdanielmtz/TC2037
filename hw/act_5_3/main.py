import threading
import time

class PuenteEstrecho:
    def __init__(self):
        self.lock = threading.Lock()

    def pasar(self, sentido: str):
        with self.lock:
            print(f"+Un carro en sentido {sentido} esta pasando.")
            try:
                time.sleep(1)  # sleep for 1 second
            except Exception as e:
                print(e)
            print(f"**El carro en sentido {sentido} ya pasó.")

class Carros(threading.Thread):
    def __init__(self, sentido: str, rec: PuenteEstrecho):
        super().__init__()
        self.sentido = sentido
        self.rec = rec

    def run(self):
        self.rec.pasar(self.sentido)

def main():
    p = PuenteEstrecho()
    norte = Carros("Norte", p)
    sur = Carros("Sur", p)

    norte.start()
    sur.start()

    norte.join()
    sur.join()

if __name__ == "__main__":
    main()

