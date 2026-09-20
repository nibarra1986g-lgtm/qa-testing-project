
Feature: Pruebas de rendimiento para manejar alta carga de transacciones

  Scenario Outline: Procesar múltiples transacciones simultáneas de forma estable

    Given que las aplicaciones móviles "<plataforma>" están disponibles
    And existen múltiples usuarios autenticados
    And cada usuario tiene una transacción válida para procesar
    And el Backend está disponible
    And la base de datos está disponible
    And el Back Office está disponible
    And el ambiente de pruebas está configurado para ejecutar una prueba de carga
    And se ha definido un límite máximo esperado de tiempo de respuesta
    And se ha definido un porcentaje máximo permitido de errores

    When se ejecutan "<usuarios_concurrentes>" transacciones simultáneamente desde la aplicación "<plataforma>"
    And las solicitudes son enviadas al Backend
    And el Backend procesa las transacciones
    And la información es almacenada en la base de datos
    And las transacciones procesadas son enviadas al Back Office

    Then el Backend debe procesar las solicitudes sin interrupciones inesperadas
    And el tiempo de respuesta debe mantenerse dentro del SLA definido
    And el porcentaje de errores debe mantenerse dentro del límite establecido
    And cada transacción debe conservar su identificador único
    And no deben generarse transacciones duplicadas
    And los datos de cada transacción deben mantenerse íntegros
    And los datos de un usuario no deben mezclarse con los de otro
    And las transacciones procesadas correctamente deben almacenarse en la base de datos
    And las transacciones procesadas correctamente deben visualizarse en el Back Office
    And el estado de cada transacción debe ser consistente entre Backend, base de datos y Back Office
    And no deben existir pérdidas de información durante el procesamiento
    And el sistema debe continuar disponible al finalizar la prueba

    Examples:
      | plataforma | usuarios_concurrentes |
      | iOS        | 100                   |
      | Android    | 100                   |
      | iOS        | 500                   |
      | Android    | 500                   |

