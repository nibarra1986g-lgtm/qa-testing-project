
Feature: Visualización del historial de transacciones en el sitio web

  Scenario: Consultar correctamente el historial de transacciones de un usuario

    Given que el usuario está registrado y autenticado en el sitio web
    And el usuario tiene transacciones previamente procesadas
    And el Frontend del sitio web está disponible
    And el Backend está disponible
    And la base de datos contiene las transacciones del usuario
    When el usuario accede a la sección "Historial de transacciones"
    And el Frontend solicita al Backend el historial del usuario autenticado
    Then el Backend debe validar la identidad y autorización del usuario
    And debe consultar únicamente las transacciones asociadas al usuario
    And debe devolver la información correctamente al Frontend
    And el Frontend debe mostrar el historial de transacciones
    And cada transacción debe mostrar su identificador
    And debe mostrar la fecha de la transacción
    And debe mostrar el importe de la transacción
    And debe mostrar el estado actual de la transacción
    And la información mostrada debe coincidir con la información almacenada en el Backend
    And no deben mostrarse transacciones pertenecientes a otros usuarios
    And no deben existir registros duplicados

  Scenario: Mostrar correctamente el historial cuando el usuario no tiene transacciones

    Given que el usuario está autenticado en el sitio web
    And el usuario no tiene transacciones registradas
    And el Backend está disponible
    When el usuario accede a la sección "Historial de transacciones"
    Then el Frontend debe solicitar el historial al Backend
    And el Backend debe responder correctamente
    And el Frontend debe mostrar un mensaje indicando que no existen transacciones
    And no debe mostrar información perteneciente a otros usuarios

