# Publicación de Turnera

Esta aplicación ya está preparada para ejecutarse como un servicio Node persistente.

## Arquitectura elegida

El MVP usa SQLite para reservar de manera atómica. Por eso se publica en un servicio con volumen persistente (Railway o Render), no en Vercel: las funciones de Vercel no conservan este archivo de base de datos entre ejecuciones.

## Variables necesarias

Configurar estas variables únicamente en el panel seguro del proveedor:

| Variable | Uso |
| --- | --- |
| `APP_URL` | URL pública HTTPS final de la app. |
| `MP_ACCESS_TOKEN` | Token privado de producción de Mercado Pago. |
| `MP_WEBHOOK_SECRET` | Firma secreta de Webhooks de Mercado Pago. |
| `NOTIFICATION_WEBHOOK_URL` | Opcional, para WhatsApp, email o SMS. |

Nunca subir `.env` al repositorio ni pegar credenciales en el código.

## Mercado Pago

Al tener la URL pública, configurar el webhook de pagos en:

`https://TU-DOMINIO/api/payments/mercadopago/webhook`

La app verifica la firma `x-signature` antes de consultar el pago y recién entonces confirma la reserva. Si no hay claves válidas, no bloquea el turno.

## Salida a producción

1. Publicar este directorio en Railway o Render usando `Dockerfile`.
2. Adjuntar el volumen persistente en `/app/data`.
3. Cargar las variables anteriores en el panel del proveedor.
4. Copiar la URL HTTPS resultante a `APP_URL` y reiniciar el servicio.
5. Registrar la URL de webhook en Mercado Pago y guardar su firma secreta.
6. Hacer una compra de prueba y confirmar que el webhook cambia el estado a `paid` o `deposit_paid`.
