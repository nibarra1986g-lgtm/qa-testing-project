Feature: Integración de Backend y Back Office para procesar transacciones

  Scenario Outline: Procesar correctamente una transacción reportada desde una aplicación móvil

    Given que el usuario está autenticado en la aplicación "<plataforma>"
    And existe una transacción válida asociada al usuario
    And la aplicación tiene conexión estable a Internet
    And el servicio de Backend está disponible
    And el Back Office está disponible
    And la base de datos está disponible

    When el usuario reporta la transacción desde la aplicación "<plataforma>"
    And la aplicación envía la solicitud al Backend
    And el Backend recibe la solicitud correctamente

    Then el Backend debe validar la autenticación del usuario
    And debe validar la información de la transacción
    And debe generar o conservar un identificador único de transacción
    And debe procesar la transacción de acuerdo con las reglas de negocio
    And debe almacenar la transacción correctamente en la base de datos
    And debe asignar el estado correspondiente a la transacción
    And el Backend debe enviar la información procesada al Back Office
    And el Back Office debe recibir la transacción
    And el Back Office debe mostrar el identificador correcto de la transacción
    And el estado mostrado en el Back Office debe coincidir con el estado del Backend
    And los datos de usuario, fecha, importe y referencia deben coincidir
    And no debe existir información duplicada
    And la aplicación móvil debe recibir una respuesta de procesamiento exitoso

    Examples:
      | plataforma |
      | iOS        |
      | Android    |


# Escenarios adicionales


  Scenario: Evitar el procesamiento duplicado de una transacción

    Given que una transacción ya fue reportada y procesada correctamente
    And la transacción tiene un identificador único
    And el Backend está disponible
    And el Back Office está disponible

    When el Backend recibe nuevamente la misma transacción
    And la solicitud contiene el mismo identificador único

    Then el Backend debe identificar que la transacción ya fue procesada
    And debe evitar crear un registro duplicado
    And debe mantener la información original de la transacción
    And el Back Office debe mostrar una sola transacción
    And el estado de la transacción debe mantenerse consistente



  Scenario: Mantener la integridad de datos entre Backend y Back Office

    Given que existe una transacción procesada correctamente por el Backend
    And la transacción contiene un identificador, usuario, importe, fecha y estado

    When el Back Office consulta la transacción

    Then debe mostrar el mismo identificador de transacción
    And debe mostrar el mismo usuario
    And debe mostrar el mismo importe
    And debe mostrar la misma fecha de operación
    And debe mostrar el mismo estado
    And no debe existir información modificada o truncada durante la integración

  Scenario: Procesar transacciones concurrentes desde iOS y Android

    Given que existen múltiples usuarios utilizando las aplicaciones iOS y Android
    And cada usuario tiene una transacción válida
    And el Backend y Back Office están disponibles

    When múltiples transacciones son enviadas simultáneamente
    Then el Backend debe procesar cada transacción de manera independiente
    And cada transacción debe conservar su identificador único
    And los datos de un usuario no deben mezclarse con los de otro
    And no deben generarse transacciones duplicadas
    And todas las transacciones procesadas correctamente deben aparecer en el Back Office
    And los estados deben ser consistentes entre Backend y Back Office


