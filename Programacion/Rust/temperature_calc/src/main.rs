use std::io;

fn round2(dec: f64) -> f64 {
    (dec * 100.0).round() / 100.0
}
fn input_temperature() -> f64 {
    let mut input = String::new();

    println!("Introduzca la temperatura: ");
    io::stdin()
        .read_line(&mut input)
        .expect("Error al leer la linea");

    let temperature: f64 = input.trim().parse().expect("Solo numeros");
    temperature
}
const FAHR_OFFSET: f64 = 32.0;
const FACTOR_DECIMAL: f64 = 1.8;
const KELVIN_OFFSET: f64 = 273.15;

fn f_a_c(f: f64) -> f64 {
    (f - FAHR_OFFSET) / FACTOR_DECIMAL
}
fn f_a_k(f: f64) -> f64 {
    (f - FAHR_OFFSET) / FACTOR_DECIMAL + KELVIN_OFFSET
}

fn main() {
    let mut option = String::new();
    loop {
        println!("Selecciona una opción\n1. °F\n4. Salir");
        println!("Ingrese un numero(1-4): ");
        io::stdin()
            .read_line(&mut option)
            .expect("Error al leer la linea");

        match option.trim() {
            "1" => {
                let mut input_sub_option = String::new();

                println!("Selecciona una opción\n1. °F a °C\n2. °F a K");
                io::stdin()
                    .read_line(&mut input_sub_option)
                    .expect("Error al leer la linea");
                let sub_option: u8 = input_sub_option
                    .trim()
                    .parse()
                    .expect("Opción inválida. \n");

                if sub_option == 1 {
                    println!("Son {} °C", round2(f_a_c(input_temperature())));
                    break;
                } else if sub_option == 2 {
                    println!("Son {} K", round2(f_a_k(input_temperature())));
                    break;
                }
            }
            "4" => {
                println!("Saliendo del programa...\n");
                break;
            }
            _ => println!("Opción inválida. \n"),
        }
    }
}
