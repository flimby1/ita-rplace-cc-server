## Client-Server-Kommunikation

- Il client si connette al server tramite web socket
- All'inizio il client invia la sua piattaforma e versione come json al server

```json 
{
  "operation": "handshake",
  "data": {
    "platform": "python",
    "version": 999
  }
}
```

- Se il server rileva che il client sta utilizzando una versione precedente, invia al client una richiesta di aggiornamento
  risposta:

```json 
{
  "operation": "notify-update"
}
```

- Non appena il client è in grado di impostare un pixel, invia un `request-pixel` al server

```json 
{
  "operation": "request-pixel",
  "user": "<user-id">"
}
 ```

- Il server quindi risponde con il pixel da impostare come json, es:

```json 
{
  "operation": "place-pixel",
  "data": {
    "x": 0,
    "y": 857,
    "color": 4,
    "priority": 1
  },
  "user": "<user-id">"
}
 ```

- Wenn kein Pixel existiert, wird `{}` zurückgesendet.
