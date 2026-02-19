defmodule Util do
  @moduledoc """
  Módulo con funciones que se reutilizan
  - autor: Juan Pablo Londoño Gomez
  - fecha: 2026
  - licencia: GNU GPL v3
  """

  @doc """
  Función para mostrar un mensaje en la pantalla.

  ## Parámetro
    - mensaje: texto que se le presenta al usuario

  ## Ejemplo

      iex> Util.mostrar_mensaje("Hola Mundo")

      "Hola Mundo"
      |> Util.mostrar_mensaje()
  """
  def mostrar_mensaje(mensaje) do
    mensaje
    |> IO.puts()
  end
end

""" (Util Usando Java)
defmodule Util do
  def mostrar_mensaje(mensaje) do
    System.cmd("java", ["-cp", ".", "Mensaje", mensaje])
  end
end
  """
