use std::io::{self, Write};

fn round2(dec: f64) -> f64 {
    (dec * 100.0).round() / 100.0
}

fn f_a_c(f: f64) -> f64 {
    (f - 32.0) / 1.8
}

fn main() {
    let mut input = String::new();

    print!("Introduzca la temperatura a convertir(°F a °C): ");
    io::stdout().flush().unwrap();
    io::stdin()
        .read_line(&mut input)
        .expect("Error al leer la linea");

    let num: f64 = input.trim().parse().expect("Introduzca un número válido");
    let result: f64 = round2(f_a_c(num));

    println!("Son {}°C", result)
}
