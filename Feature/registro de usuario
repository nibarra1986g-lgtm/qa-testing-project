Feature: Registro de usuario desde aplicación móvil

  Scenario Outline: Registro exitoso de un nuevo usuario

    Given que la aplicación "<plataforma>" está instalada y actualizada
    And el dispositivo tiene conexión estable a Internet
    And el servicio de registro del backend está disponible
    And el correo electrónico no está registrado

    When el usuario captura un nombre válido
    And captura un correo electrónico válido
    And captura un número telefónico válido
    And captura una contraseña válida
    And acepta los términos y condiciones
    And selecciona "Registrarse"

    Then la aplicación debe enviar la solicitud al backend
    And el backend debe validar la información
    And debe crearse el usuario en la base de datos
    And la aplicación debe mostrar el registro exitoso
    And el usuario debe aparecer en el Back Office

    Examples:
      | plataforma |
      | iOS        |
      | Android    |
