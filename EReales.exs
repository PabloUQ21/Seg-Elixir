defmodule Util do

  def ingresar(mensaje, :texto) do
    IO.gets(mensaje)
    |> String.trim()
  end

  def ingresar(mensaje, :entero),
    do: ingresar(mensaje, &String.to_integer/1, :entero)

  def ingresar(mensaje, :real),
    do: ingresar(mensaje, &String.to_float/1, :real)

  defp ingresar(mensaje, parser, tipo_dato) do
    try do
      mensaje
      |> ingresar(:texto)
      |> parser.()
    rescue
      ArgumentError ->
        IO.puts("Error, se espera que ingrese un número #{tipo_dato}\n")
        mensaje
        |> ingresar(parser, tipo_dato)
    end
  end

  def mostrar_mensaje(mensaje) do
    IO.puts(mensaje)
  end
end


defmodule EntradaReales do

  def main do
    valor_producto =
      "Ingrese el valor del producto: "
      |> Util.ingresar(:entero)

    porcentaje_descuento =
      "Ingrese el porcentaje de descuento (entre 0.0 y 1.0): "
      |> Util.ingresar(:real)

    valor_descuento =
      calcular_valor_descuento(valor_producto, porcentaje_descuento)

    valor_final =
      calcular_valor_final(valor_producto, valor_descuento)

    generar_mensaje(valor_descuento, valor_final)
    |> Util.mostrar_mensaje()
  end

  defp calcular_valor_descuento(valor_producto, porcentaje_descuento) do
    valor_producto * porcentaje_descuento
  end

  defp calcular_valor_final(valor_producto, valor_descuento) do
    valor_producto - valor_descuento
  end

  defp generar_mensaje(valor_descuento, valor_final) do
    valor_descuento = Float.round(valor_descuento, 1)
    valor_final = Float.round(valor_final, 1)

    "Valor de descuento: $#{valor_descuento} y el valor final: $#{valor_final}"
  end
end

EntradaReales.main()

