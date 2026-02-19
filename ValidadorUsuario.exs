defmodule ValidadorUsuario do

  def validar(usuario) do
    errores =
      usuario
      |> validar_longitud()
      |> validar_minusculas(usuario)
      |> validar_espacios(usuario)
      |> validar_caracteres(usuario)
      |> validar_letra(usuario)

    if errores == [] do
      {:ok, "Usuario válido"}
    else
      {:error, Enum.join(errores, ", ")}
    end
  end

  def validar_longitud(usuario) do
    if String.length(usuario) < 5 or String.length(usuario) > 12 do
      ["Debe tener entre 5 y 12 caracteres"]
    else
      []
    end
  end

  def validar_minusculas(errores, usuario) do
    if usuario != String.downcase(usuario) do
      errores ++ ["Debe estar completamente en minúscula"]
    else
      errores
    end
  end

  def validar_espacios(errores, usuario) do
    if String.contains?(usuario, " ") do
      errores ++ ["No debe contener espacios"]
    else
      errores
    end
  end

  def validar_caracteres(errores, usuario) do
    if String.contains?(usuario, "@") or
       String.contains?(usuario, "#") or
       String.contains?(usuario, "$") or
       String.contains?(usuario, "%") do
      errores ++ ["No debe contener caracteres especiales (@,#,$,%)"]
    else
      errores
    end
  end

  def validar_letra(errores, usuario) do
    solo_letras =
      usuario
      |> String.replace(~r/[^a-z]/, "")

    if String.length(solo_letras) == 0 do
      errores ++ ["Debe contener al menos una letra"]
    else
      errores
    end
  end
end

# Ejemplo de uso:
IO.inspect(ValidadorUsuario.validar("usuario1"))
