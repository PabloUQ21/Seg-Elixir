defmodule Util do
  def ingresar(mensaje, :texto) do
    mensaje
    |> IO.gets()
    |> String.trim()
  end

  def ingresar(mensaje, :entero) do
    try do
      mensaje
      |> ingresar(:texto)
      |> String.to_integer()
    rescue
      ArgumentError ->
        mostrar_error("Error, se espera que ingrese un número entero\n")
        mensaje
        |> ingresar(:entero)
    end
  end

  def mostrar_mensaje(mensaje) do
    IO.puts(mensaje)
  end

  def mostrar_error(mensaje) do
    IO.puts(:standard_error, mensaje)
  end
end

defmodule EntradaEnteros do
  def main do
    valor_total =
      "Ingrese valor total de la factura: "
      |> Util.ingresar(:entero)

    valor_entregado =
      "Ingrese valor entregado para el pago: "
      |> Util.ingresar(:entero)

    calcular_devuelta(valor_entregado, valor_total)
    |> generar_mensaje()
    |> Util.mostrar_mensaje()
  end

  defp calcular_devuelta(valor_entregado, valor_total) do
    valor_entregado - valor_total
  end

  defp generar_mensaje(devuelta) do
    "El valor de devuelta es $#{devuelta}"
  end
end

EntradaEnteros.main()

