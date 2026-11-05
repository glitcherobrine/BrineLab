class insumo:
    def __init__(self, item, ingrediente, cantidad, precioEstimado):
        self.item = item
        self.ingrediente = ingrediente
        self.cantidad = cantidad
        self.precioEstimado = precioEstimado


def data():
    cantidadDefault = 1000000
    bienes = [
        insumo(1, "Azucar Crema Funda", cantidadDefault, 30),
        insumo(2, "Canela", cantidadDefault, 70),
        insumo(3, "Clavo Dulce", cantidadDefault, 90),
        insumo(4, "Galletas de Leche", cantidadDefault, 60),
        insumo(5, "Habichuela Roja", cantidadDefault, 180),
        insumo(6, "Leche de Coco", cantidadDefault, 80),
        insumo(7, "Leche Evaporada", cantidadDefault, 75),
        insumo(8, "Malagueta", cantidadDefault, 45)
    ]
    return bienes


def main():
    bienes = data()
    def monto(can, precio): return can * precio
    print(
        f"{'ID':<5}{'Integrante':<21}{'Cantidad':<12}"
        f"{'Precio Unitario':<17}{'Monto':<18}"
    )
    for b in bienes:
        print(
            f"{b.item:<5}{b.ingrediente:<21}"
            f"{b.cantidad:<12,}{'$':<1}{b.precioEstimado:<16,.2f}"
            f"{'$':<1}{monto(b.cantidad, b.precioEstimado):<17,.2f}"
        )


if __name__ == "__main__":
    main()
