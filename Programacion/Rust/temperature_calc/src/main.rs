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
fn c_a_f(c: f64) -> f64 {
    (c * FACTOR_DECIMAL) + FAHR_OFFSET
}
fn c_a_k(c: f64) -> f64 {
    c + KELVIN_OFFSET
}
fn k_a_f(k: f64) -> f64 {
    (k - KELVIN_OFFSET) * FACTOR_DECIMAL + FAHR_OFFSET
}
fn k_a_c(k: f64) -> f64 {
    k - KELVIN_OFFSET
}

fn main() {
    let mut option = String::new();
    loop {
        option.clear();
        println!("Selecciona una opción\n1. °F\n2. °C\n3. K\n4. Salir");
        println!("Ingrese un numero(1-4): ");
        io::stdin()
            .read_line(&mut option)
            .expect("Error al leer la linea");

        match option.trim() {
            "1" => {
                let mut input_sub_option = String::new();

                println!("Selecciona una opción\n1. °F a °C\n2. °F a K\n");
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
            "2" => {
                let mut input_sub_option = String::new();

                println!("Selecciona una opción\n1. °C a °F\n2. °C a K\n");
                io::stdin()
                    .read_line(&mut input_sub_option)
                    .expect("Error al leer la linea");
                let sub_option: u8 = input_sub_option
                    .trim()
                    .parse()
                    .expect("Opción inválida. \n");

                if sub_option == 1 {
                    println!("Son {} °F", round2(c_a_f(input_temperature())));
                    break;
                } else if sub_option == 2 {
                    println!("Son {} K", round2(c_a_k(input_temperature())));
                    break;
                }
            }
            "3" => {
                let mut input_sub_option = String::new();

                println!("Selecciona una opción\n1. K a °F\n2. K a °C\n");
                io::stdin()
                    .read_line(&mut input_sub_option)
                    .expect("Error al leer la linea");
                let sub_option: u8 = input_sub_option
                    .trim()
                    .parse()
                    .expect("Opción inválida. \n");

                if sub_option == 1 {
                    println!("Son {} °F", round2(k_a_f(input_temperature())));
                    break;
                } else if sub_option == 2 {
                    println!("Son {} °C", round2(k_a_c(input_temperature())));
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
