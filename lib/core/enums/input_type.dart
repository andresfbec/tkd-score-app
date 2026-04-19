enum InputType {
  text, // Texto normal, sin restricciones
  name, // Solo letras y espacios, ideal para nombres propios
  email, // Dirección de correo electrónico
  number, // Números enteros
  password, // Contraseña
  phone, // Número de teléfono
  alphanumeric, // Letras y números
  dropdown, // Para campos que se llenan con opciones predefinidas
  date
}