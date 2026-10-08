# Este es el modulo para crear la base de datos
import sqlite3


def init_db():
    # Conexión con la base de datos
    con = sqlite3.connect("Sql.db")
    cur = con.cursor()

    cur.execute("""
    CREATE TABLE IF NOT EXISTS "cliente" (
    "ID" TEXT NOT NULL UNIQUE,
    "nombre_completo" TEXT NOT NULL,
    "telefono" TEXT NOT NULL,
    "correo_electronico" TEXT NOT NULL,
    PRIMARY KEY("ID")
    )""")
    con.commit()

    cur.execute("""
    CREATE TABLE IF NOT EXISTS "vehiculos" (
    "placa" TEXT NOT NULL UNIQUE,
    "marca" TEXT NOT NULL,
    "modelo" TEXT NOT NULL,
    "año" INTEGER NOT NULL,
    "id_cliente" TEXT NOT NULL,
    FOREIGN KEY("id_cliente") REFERENCES "cliente"("ID")
    )""")
    con.commit()
    con.close()


if __name__ == "__main__":
    init_db()

    print("base de datos creada con exito")
