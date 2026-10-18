#include <iostream>
#include <ostream>
#include <type_traits>

using namespace std;

double temperature() {
  double temp{0.0};
  cout << "Introduzca la temperatura: ";
  cin >> temp;
  return temp;
};

constexpr double FAHR_OFFSET = 32.0;
constexpr double FACTOR_DECIMAL = 1.8;
constexpr double KELVIN_OFFSET = 273.15;

double F_a_C(double Fahr) { return (Fahr - FAHR_OFFSET) / FACTOR_DECIMAL; }
double F_a_K(double Farh) {
  return (Farh - FAHR_OFFSET) / FACTOR_DECIMAL + KELVIN_OFFSET;
}
double C_a_F(double Cels) { return (Cels * FACTOR_DECIMAL) + FAHR_OFFSET; }
double C_a_k(double Cels) { return Cels + KELVIN_OFFSET; }
double K_a_F(double Kelv) {
  return (Kelv - KELVIN_OFFSET) * FACTOR_DECIMAL + FAHR_OFFSET;
}
double K_a_C(double Kelv) { return Kelv - KELVIN_OFFSET; }

int main() {
  int option{0};
  bool continuar = true;

  while (continuar) {
    cout << "Selecciona una opción\n1. °F\n2. °C\n3. K\n4. Salir\n";
    cout << "Ingrese un numero(1-4): ";
    cin >> option;

    switch (option) {
    case 1: {
      int subOption{0};
      cout << "Selecciona una opción:\n1. °F a °C\n2. °F a K\n";
      cin >> subOption;
      if (subOption == 1) {
        cout << F_a_C(temperature()) << " °C\n";
      } else if (subOption == 2) {
        cout << F_a_K(temperature()) << " K\n";
      }
      break;
    }
    case 2: {
      int subOption{0};
      cout << "Selecciona una opción\n1. °C a °F\n2. °C a K\n";
      cin >> subOption;
      if (subOption == 1) {
        cout << C_a_F(temperature()) << " °F\n";
      } else if (subOption == 2) {
        cout << C_a_k(temperature()) << " K\n";
      }
      break;
    }
    case 3: {
      int subOption{0};
      cout << "Selecciona una opción\n1. K a °F\n2. K a °C\n";
      cin >> subOption;
      if (subOption == 1) {
        cout << K_a_F(temperature()) << " °F\n";
      } else if (subOption == 2) {
        cout << K_a_C(temperature()) << " °C\n";
      }
      break;
    }
    case 4:
      cout << "Saliendo del programa...\n";
      continuar = false;
      break;
    default:
      cout << "Opción inválida.\n";
      break;
    }
  }
  return 0;
}
