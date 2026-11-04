# Turnera MVP

MVP local full-stack para complejos de fútbol 5 y pádel. No requiere dependencias externas: usa Node 24 y SQLite nativo.

## Ejecutar

1. Copiá `.env.example` como `.env` y completá las credenciales cuando corresponda.
2. Ejecutá `npm start`.
3. Abrí `http://localhost:3030`.

La primera ejecución crea `data/turnera.sqlite` y dos cuentas de demostración:

- Dueño: `dueno@turnera.local` / `turnera123`
- Cliente: `cliente@turnera.local` / `turnera123`

## Lo que cubre

- Registro e inicio de sesión con roles.
- Complejos, canchas, política de cancelación y créditos por cliente.
- Reserva transaccional: `BEGIN IMMEDIATE` y restricción única por cancha/horario evitan doble toma.
- Pago de seña o total; el crédito se aplica como movimiento de libro mayor.
- Cancelación: reintegro, crédito o sin devolución según la política; el dueño puede aplicar excepciones.
- Adaptador de Mercado Pago para crear una preferencia cuando `MP_ACCESS_TOKEN` esté definido.
- Webhook preparado para recibir confirmaciones de pago y adaptador de notificaciones por webhook.

## Antes de producción

Configurar un proveedor de identidad/OTP, HTTPS, claves seguras, verificación de firma del webhook de Mercado Pago, URL pública para `notification_url`, política legal de cancelación, y proveedor de WhatsApp/Email. Nunca uses las cuentas demo en producción.
