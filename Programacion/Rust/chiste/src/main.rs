use std::{io::{self, Write}, process};

fn main() {
    let mut input = String::new();

    println!("Por que la escoba está feliz?\n1. Poique?\n2 .Salir");
    println!("Digite un número: ");
    io::stdin()
        .read_line(&mut input)
        .expect("Error al leer la linea");

    match input.trim() {
        "1" => {
            println!("Por que va riendo XDDDDDDDDDDDDDDDDDDDDDD");
            println!("Presione Enter para salir...");
            io::stdout().flush().unwrap();

            let mut enter = String::new();
            io::stdin().read_line(&mut enter).unwrap();
        },
        "2" => {
            println!("Saliendo del programa...");
            process::exit(0)
        }
        _ => println!("Opción no válida."),
    }
}
