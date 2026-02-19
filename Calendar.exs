defmodule Saludo do
  def ejecutar do
    IO.puts("Ingrese su nombre:")
    nombre = IO.gets("") |> String.trim()

    {{_anio, _mes, _dia}, {hora, _min, _seg}} = :calendar.local_time()

    mensaje =
      cond do
        hora >= 0 and hora <= 11 -> "Buenos días"
        hora >= 12 and hora <= 17 -> "Buenas tardes"
        hora >= 18 and hora <= 23 -> "Buenas noches"
      end

    IO.puts("#{mensaje} #{nombre}")
  end
end

Saludo.ejecutar()
