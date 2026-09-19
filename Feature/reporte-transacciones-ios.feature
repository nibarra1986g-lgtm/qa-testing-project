Feature: Reporte de transacciones desde la aplicación móvil iOS

  # Caso positivo - flujo End-to-End
  Scenario: Reportar exitosamente una transacción desde iOS

    Given que el usuario tiene instalada la aplicación iOS
    And la aplicación se encuentra actualizada
    And el usuario está autenticado correctamente
    And el dispositivo tiene conexión estable a Internet
    And existe una transacción válida asociada al usuario
    And el servicio de reporte de transacciones del backend está disponible
    And el Back Office está disponible para procesar transacciones

    When el usuario accede a la sección "Transacciones"
    And selecciona la transacción que desea reportar
    And captura todos los datos obligatorios del reporte
    And selecciona el motivo del reporte
    And confirma el envío de la transacción

    Then la aplicación iOS debe validar los datos ingresados
    And debe enviar la solicitud al backend mediante la API correspondiente
    And el backend debe validar la autenticación del usuario
    And el backend debe validar la información de la transacción
    And el backend debe generar un identificador único para el reporte
    And la información debe almacenarse correctamente en la base de datos
    And el backend debe responder a la aplicación con una confirmación exitosa
    And la aplicación iOS debe mostrar un mensaje indicando que el reporte fue enviado correctamente
    And la transacción debe quedar con el estado "Reportada"
    And el reporte debe estar disponible en el Back Office
    And el Back Office debe mostrar la información correspondiente a la transacción
    And el identificador de la transacción debe coincidir entre iOS, Backend y Back Office

Scenario: No permitir reportar una transacción sin información obligatoria

    Given que el usuario está autenticado en la aplicación iOS
    And tiene una transacción disponible para reportar

    When el usuario selecciona la opción "Reportar"
    And deja uno o más campos obligatorios vacíos
    And intenta enviar el reporte

    Then la aplicación debe identificar los campos obligatorios faltantes
    And debe mostrar mensajes de validación
    And no debe enviar una solicitud válida al backend
    And no debe crearse un reporte en el Back Office
