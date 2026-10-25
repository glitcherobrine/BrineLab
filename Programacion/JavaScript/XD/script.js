const temperature = document.getElementById("temperature");
const button = document.getElementById("myButton");

function C_a_F(temp) {
  return temp * 1.8 + 32;
}

button.addEventListener("click", function () {
  const num = Number(temperature.value);

  if (temperature.value === "") {
    alert("ingrese su temperatura");
  } else {
    console.log(`ingresó estos ${num} grados centigrados`);
    console.log(`Son ${C_a_F(num)}`);
  }
});
