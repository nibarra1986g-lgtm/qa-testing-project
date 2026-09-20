
Feature: Actualización de estado de transacción desde la aplicación móvil Android

  Scenario: Actualizar correctamente el estado de una transacción desde Android

    Given que el usuario está autenticado en la aplicación Android
    And existe una transacción válida asociada al usuario
    And la transacción se encuentra en un estado que permite su actualización
    And la aplicación Android tiene conexión estable a Internet
    And el Backend está disponible
    And la base de datos está disponible
    And el Back Office está disponible

    When el usuario consulta la transacción desde la aplicación Android
    And selecciona la opción para actualizar el estado
    And selecciona un nuevo estado permitido
    And confirma la actualización

    Then la aplicación Android debe validar que el nuevo estado sea válido
    And debe enviar la solicitud de actualización al Backend
    And el Backend debe validar la autenticación y autorización del usuario
    And debe validar que la transición de estado esté permitida
    And debe actualizar el estado de la transacción
    And debe almacenar el nuevo estado correctamente en la base de datos
    And debe devolver una respuesta exitosa a la aplicación Android
    And la aplicación debe mostrar el nuevo estado de la transacción
    And el Back Office debe mostrar el mismo estado actualizado
    And el identificador de la transacción debe mantenerse sin cambios
    And los demás datos de la transacción deben conservar su integridad

  
