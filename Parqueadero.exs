defmodule Parqueadero do

  def calcular_tarifa_base(horas) do
    cond do
      horas <= 2 ->
        3000

      horas >= 3 and horas <= 5 ->
        3000 + (horas - 2) * 2500

      horas >= 6 and horas <= 8 ->
        3000 + (3 * 2500) + (horas - 5) * 2000

      horas > 8 ->
        18000
    end
  end

  def aplicar_descuentos(valor, tipo_cliente, tipo_vehiculo, dia) do
    descuento_cliente =
      if tipo_cliente == 1, do: 0.15, else: 0

    descuento_vehiculo =
      if tipo_vehiculo == 1, do: 0.20, else: 0

    descuento_dia =
      if dia == 1, do: 0.10, else: 0

    descuento_total = descuento_cliente + descuento_vehiculo + descuento_dia

    valor_final = valor - (valor * descuento_total)

    {valor, valor_final}
  end

  def ejecutar do
    IO.puts("Horas de permanencia:")
    horas = IO.gets("") |> String.trim() |> String.to_integer()

    IO.puts("Tipo de cliente (1=frecuente, 2=regular):")
    tipo_cliente = IO.gets("") |> String.trim() |> String.to_integer()

    IO.puts("Tipo de vehículo (1=eléctrico, 2=convencional):")
    tipo_vehiculo = IO.gets("") |> String.trim() |> String.to_integer()

    IO.puts("Día (1=fin de semana, 2=entre semana):")
    dia = IO.gets("") |> String.trim() |> String.to_integer()

    tarifa_base = calcular_tarifa_base(horas)
    {sin_descuento, con_descuento} =
      aplicar_descuentos(tarifa_base, tipo_cliente, tipo_vehiculo, dia)

    IO.puts("------ DESGLOSE ------")
    IO.puts("Tarifa base: $#{sin_descuento}")
    IO.puts("Total con descuentos: $#{Float.round(con_descuento, 2)}")
  end
end

Parqueadero.ejecutar()
