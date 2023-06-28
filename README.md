# sdschat

Fastchat implementation for SDSC. 

## How to run this app in SDSC

```
runai submit sdschat-$USER -i caviri/sdschat:latest --service-type=portforward --port 8000:8000 --port 7860:7860 --attach --interactive --node-type "A100" -g 0.5
```

## How to build this image?

```
docker build -t caviri/sdschat:latest . 
```

```
docker push caviri/sdschat:latest
```

```
docker run -it --rm -p 7860:7860 -p 8000:8000 --gpus all caviri/sdschat:latest 
```

## Errors

```
2023-06-28 06:45:04 | ERROR | stderr |
2023-06-28 06:45:10 | INFO | model_worker | Register to controller
2023-06-28 06:45:11 | ERROR | stderr | ╭─────────────────────────────── Traceback (most recent call last) ────────────────────────────────╮
2023-06-28 06:45:11 | ERROR | stderr | │ /usr/local/lib/python3.10/dist-packages/urllib3/connection.py:174 in _new_conn                   │
2023-06-28 06:45:11 | ERROR | stderr | │                                                                                                  │
2023-06-28 06:45:11 | ERROR | stderr | │   171 │   │   │   extra_kw["socket_options"] = self.socket_options                               │
2023-06-28 06:45:11 | ERROR | stderr | │   172 │   │                                                                                      │
2023-06-28 06:45:11 | ERROR | stderr | │   173 │   │   try:                                                                               │
2023-06-28 06:45:11 | ERROR | stderr | │ ❱ 174 │   │   │   conn = connection.create_connection(                                           │
2023-06-28 06:45:11 | ERROR | stderr | │   175 │   │   │   │   (self._dns_host, self.port), self.timeout, **extra_kw                      │
2023-06-28 06:45:11 | ERROR | stderr | │   176 │   │   │   )                                                                              │
2023-06-28 06:45:11 | ERROR | stderr | │   177                                                                                            │
2023-06-28 06:45:11 | ERROR | stderr | │                                                                                                  │
2023-06-28 06:45:11 | ERROR | stderr | │ /usr/local/lib/python3.10/dist-packages/urllib3/util/connection.py:95 in create_connection       │
2023-06-28 06:45:11 | ERROR | stderr | │                                                                                                  │
2023-06-28 06:45:11 | ERROR | stderr | │    92 │   │   │   │   sock = None                                                                │
2023-06-28 06:45:11 | ERROR | stderr | │    93 │                                                                                          │
2023-06-28 06:45:11 | ERROR | stderr | │    94 │   if err is not None:                                                                    │
2023-06-28 06:45:11 | ERROR | stderr | │ ❱  95 │   │   raise err                                                                          │
2023-06-28 06:45:11 | ERROR | stderr | │    96 │                                                                                          │
2023-06-28 06:45:11 | ERROR | stderr | │    97 │   raise socket.error("getaddrinfo returns an empty list")                                │
2023-06-28 06:45:11 | ERROR | stderr | │    98                                                                                            │
2023-06-28 06:45:11 | ERROR | stderr | │                                                                                                  │
2023-06-28 06:45:11 | ERROR | stderr | │ /usr/local/lib/python3.10/dist-packages/urllib3/util/connection.py:85 in create_connection       │
2023-06-28 06:45:11 | ERROR | stderr | │                                                                                                  │
2023-06-28 06:45:11 | ERROR | stderr | │    82 │   │   │   │   sock.settimeout(timeout)                                                   │
2023-06-28 06:45:11 | ERROR | stderr | │    83 │   │   │   if source_address:                                                             │
2023-06-28 06:45:11 | ERROR | stderr | │    84 │   │   │   │   sock.bind(source_address)                                                  │
2023-06-28 06:45:11 | ERROR | stderr | │ ❱  85 │   │   │   sock.connect(sa)                                                               │
2023-06-28 06:45:11 | ERROR | stderr | │    86 │   │   │   return sock                                                                    │
2023-06-28 06:45:11 | ERROR | stderr | │    87 │   │                                                                                      │
2023-06-28 06:45:11 | ERROR | stderr | │    88 │   │   except socket.error as e:                                                          │
2023-06-28 06:45:11 | ERROR | stderr | ╰──────────────────────────────────────────────────────────────────────────────────────────────────╯
2023-06-28 06:45:11 | ERROR | stderr | ConnectionRefusedError: [Errno 111] Connection refused
2023-06-28 06:45:11 | ERROR | stderr |
2023-06-28 06:45:11 | ERROR | stderr | During handling of the above exception, another exception occurred:
2023-06-28 06:45:11 | ERROR | stderr |
2023-06-28 06:45:11 | ERROR | stderr | ╭─────────────────────────────── Traceback (most recent call last) ────────────────────────────────╮
2023-06-28 06:45:11 | ERROR | stderr | │ /usr/local/lib/python3.10/dist-packages/urllib3/connectionpool.py:703 in urlopen                 │
2023-06-28 06:45:11 | ERROR | stderr | │                                                                                                  │
2023-06-28 06:45:11 | ERROR | stderr | │    700 │   │   │   │   self._prepare_proxy(conn)                                                 │
2023-06-28 06:45:11 | ERROR | stderr | │    701 │   │   │                                                                                 │
2023-06-28 06:45:11 | ERROR | stderr | │    702 │   │   │   # Make the request on the httplib connection object.                          │
2023-06-28 06:45:11 | ERROR | stderr | │ ❱  703 │   │   │   httplib_response = self._make_request(                                        │
2023-06-28 06:45:11 | ERROR | stderr | │    704 │   │   │   │   conn,                                                                     │
2023-06-28 06:45:11 | ERROR | stderr | │    705 │   │   │   │   method,                                                                   │
2023-06-28 06:45:11 | ERROR | stderr | │    706 │   │   │   │   url,                                                                      │
2023-06-28 06:45:11 | ERROR | stderr | │                                                                                                  │
2023-06-28 06:45:11 | ERROR | stderr | │ /usr/local/lib/python3.10/dist-packages/urllib3/connectionpool.py:398 in _make_request           │
2023-06-28 06:45:11 | ERROR | stderr | │                                                                                                  │
2023-06-28 06:45:11 | ERROR | stderr | │    395 │   │   │   if chunked:                                                                   │
2023-06-28 06:45:11 | ERROR | stderr | │    396 │   │   │   │   conn.request_chunked(method, url, **httplib_request_kw)                   │
2023-06-28 06:45:11 | ERROR | stderr | │    397 │   │   │   else:                                                                         │
2023-06-28 06:45:11 | ERROR | stderr | │ ❱  398 │   │   │   │   conn.request(method, url, **httplib_request_kw)                           │
2023-06-28 06:45:11 | ERROR | stderr | │    399 │   │                                                                                     │
2023-06-28 06:45:11 | ERROR | stderr | │    400 │   │   # We are swallowing BrokenPipeError (errno.EPIPE) since the server is             │
2023-06-28 06:45:11 | ERROR | stderr | │    401 │   │   # legitimately able to close the connection after sending a valid response.       │
2023-06-28 06:45:11 | ERROR | stderr | │                                                                                                  │
2023-06-28 06:45:11 | ERROR | stderr | │ /usr/local/lib/python3.10/dist-packages/urllib3/connection.py:239 in request                     │
2023-06-28 06:45:11 | ERROR | stderr | │                                                                                                  │
2023-06-28 06:45:11 | ERROR | stderr | │   236 │   │   │   headers = headers.copy()                                                       │
2023-06-28 06:45:11 | ERROR | stderr | │   237 │   │   if "user-agent" not in (six.ensure_str(k.lower()) for k in headers):               │
2023-06-28 06:45:11 | ERROR | stderr | │   238 │   │   │   headers["User-Agent"] = _get_default_user_agent()                              │
2023-06-28 06:45:11 | ERROR | stderr | │ ❱ 239 │   │   super(HTTPConnection, self).request(method, url, body=body, headers=headers)       │
2023-06-28 06:45:11 | ERROR | stderr | │   240 │                                                                                          │
2023-06-28 06:45:11 | ERROR | stderr | │   241 │   def request_chunked(self, method, url, body=None, headers=None):                       │
2023-06-28 06:45:11 | ERROR | stderr | │   242 │   │   """                                                                                │
2023-06-28 06:45:11 | ERROR | stderr | │                                                                                                  │
2023-06-28 06:45:11 | ERROR | stderr | │ /usr/lib/python3.10/http/client.py:1282 in request                                               │
2023-06-28 06:45:11 | ERROR | stderr | │                                                                                                  │
2023-06-28 06:45:11 | ERROR | stderr | │   1279 │   def request(self, method, url, body=None, headers={}, *,                              │
2023-06-28 06:45:11 | ERROR | stderr | │   1280 │   │   │   │   encode_chunked=False):                                                    │
2023-06-28 06:45:11 | ERROR | stderr | │   1281 │   │   """Send a complete request to the server."""                                      │
2023-06-28 06:45:11 | ERROR | stderr | │ ❱ 1282 │   │   self._send_request(method, url, body, headers, encode_chunked)                    │
2023-06-28 06:45:11 | ERROR | stderr | │   1283 │                                                                                         │
2023-06-28 06:45:11 | ERROR | stderr | │   1284 │   def _send_request(self, method, url, body, headers, encode_chunked):                  │
2023-06-28 06:45:11 | ERROR | stderr | │   1285 │   │   # Honor explicitly requested Host: and Accept-Encoding: headers.                  │
2023-06-28 06:45:11 | ERROR | stderr | │                                                                                                  │
2023-06-28 06:45:11 | ERROR | stderr | │ /usr/lib/python3.10/http/client.py:1328 in _send_request                                         │
2023-06-28 06:45:11 | ERROR | stderr | │                                                                                                  │
2023-06-28 06:45:11 | ERROR | stderr | │   1325 │   │   │   # RFC 2616 Section 3.7.1 says that text default has a                         │
2023-06-28 06:45:11 | ERROR | stderr | │   1326 │   │   │   # default charset of iso-8859-1.                                              │
2023-06-28 06:45:11 | ERROR | stderr | │   1327 │   │   │   body = _encode(body, 'body')                                                  │
2023-06-28 06:45:11 | ERROR | stderr | │ ❱ 1328 │   │   self.endheaders(body, encode_chunked=encode_chunked)                              │
2023-06-28 06:45:11 | ERROR | stderr | │   1329 │                                                                                         │
2023-06-28 06:45:11 | ERROR | stderr | │   1330 │   def getresponse(self):                                                                │
2023-06-28 06:45:11 | ERROR | stderr | │   1331 │   │   """Get the response from the server.                                              │
2023-06-28 06:45:11 | ERROR | stderr | │                                                                                                  │
2023-06-28 06:45:11 | ERROR | stderr | │ /usr/lib/python3.10/http/client.py:1277 in endheaders                                            │
2023-06-28 06:45:11 | ERROR | stderr | │                                                                                                  │
2023-06-28 06:45:11 | ERROR | stderr | │   1274 │   │   │   self.__state = _CS_REQ_SENT                                                   │
2023-06-28 06:45:11 | ERROR | stderr | │   1275 │   │   else:                                                                             │
2023-06-28 06:45:11 | ERROR | stderr | │   1276 │   │   │   raise CannotSendHeader()                                                      │
2023-06-28 06:45:11 | ERROR | stderr | │ ❱ 1277 │   │   self._send_output(message_body, encode_chunked=encode_chunked)                    │
2023-06-28 06:45:11 | ERROR | stderr | │   1278 │                                                                                         │
2023-06-28 06:45:11 | ERROR | stderr | │   1279 │   def request(self, method, url, body=None, headers={}, *,                              │
2023-06-28 06:45:11 | ERROR | stderr | │   1280 │   │   │   │   encode_chunked=False):                                                    │
2023-06-28 06:45:11 | ERROR | stderr | │                                                                                                  │
2023-06-28 06:45:11 | ERROR | stderr | │ /usr/lib/python3.10/http/client.py:1037 in _send_output                                          │
2023-06-28 06:45:11 | ERROR | stderr | │                                                                                                  │
2023-06-28 06:45:11 | ERROR | stderr | │   1034 │   │   self._buffer.extend((b"", b""))                                                   │
2023-06-28 06:45:11 | ERROR | stderr | │   1035 │   │   msg = b"\r\n".join(self._buffer)                                                  │
2023-06-28 06:45:11 | ERROR | stderr | │   1036 │   │   del self._buffer[:]                                                               │
2023-06-28 06:45:11 | ERROR | stderr | │ ❱ 1037 │   │   self.send(msg)                                                                    │
2023-06-28 06:45:11 | ERROR | stderr | │   1038 │   │                                                                                     │
2023-06-28 06:45:11 | ERROR | stderr | │   1039 │   │   if message_body is not None:                                                      │
2023-06-28 06:45:11 | ERROR | stderr | │   1040                                                                                           │
2023-06-28 06:45:11 | ERROR | stderr | │                                                                                                  │
2023-06-28 06:45:11 | ERROR | stderr | │ /usr/lib/python3.10/http/client.py:975 in send                                                   │
2023-06-28 06:45:11 | ERROR | stderr | │                                                                                                  │
2023-06-28 06:45:11 | ERROR | stderr | │    972 │   │                                                                                     │
2023-06-28 06:45:11 | ERROR | stderr | │    973 │   │   if self.sock is None:                                                             │
2023-06-28 06:45:11 | ERROR | stderr | │    974 │   │   │   if self.auto_open:                                                            │
2023-06-28 06:45:11 | ERROR | stderr | │ ❱  975 │   │   │   │   self.connect()                                                            │
2023-06-28 06:45:11 | ERROR | stderr | │    976 │   │   │   else:                                                                         │
2023-06-28 06:45:11 | ERROR | stderr | │    977 │   │   │   │   raise NotConnected()                                                      │
2023-06-28 06:45:11 | ERROR | stderr | │    978                                                                                           │
2023-06-28 06:45:11 | ERROR | stderr | │                                                                                                  │
2023-06-28 06:45:11 | ERROR | stderr | │ /usr/local/lib/python3.10/dist-packages/urllib3/connection.py:205 in connect                     │
2023-06-28 06:45:11 | ERROR | stderr | │                                                                                                  │
2023-06-28 06:45:11 | ERROR | stderr | │   202 │   │   │   self.auto_open = 0                                                             │
2023-06-28 06:45:11 | ERROR | stderr | │   203 │                                                                                          │
2023-06-28 06:45:11 | ERROR | stderr | │   204 │   def connect(self):                                                                     │
2023-06-28 06:45:11 | ERROR | stderr | │ ❱ 205 │   │   conn = self._new_conn()                                                            │
2023-06-28 06:45:11 | ERROR | stderr | │   206 │   │   self._prepare_conn(conn)                                                           │
2023-06-28 06:45:11 | ERROR | stderr | │   207 │                                                                                          │
2023-06-28 06:45:11 | ERROR | stderr | │   208 │   def putrequest(self, method, url, *args, **kwargs):                                    │
2023-06-28 06:45:11 | ERROR | stderr | │                                                                                                  │
2023-06-28 06:45:11 | ERROR | stderr | │ /usr/local/lib/python3.10/dist-packages/urllib3/connection.py:186 in _new_conn                   │
2023-06-28 06:45:11 | ERROR | stderr | │                                                                                                  │
2023-06-28 06:45:11 | ERROR | stderr | │   183 │   │   │   )                                                                              │
2023-06-28 06:45:11 | ERROR | stderr | │   184 │   │                                                                                      │
2023-06-28 06:45:11 | ERROR | stderr | │   185 │   │   except SocketError as e:                                                           │
2023-06-28 06:45:11 | ERROR | stderr | │ ❱ 186 │   │   │   raise NewConnectionError(                                                      │
2023-06-28 06:45:11 | ERROR | stderr | │   187 │   │   │   │   self, "Failed to establish a new connection: %s" % e                       │
2023-06-28 06:45:11 | ERROR | stderr | │   188 │   │   │   )                                                                              │
2023-06-28 06:45:11 | ERROR | stderr | │   189                                                                                            │
2023-06-28 06:45:11 | ERROR | stderr | ╰──────────────────────────────────────────────────────────────────────────────────────────────────╯
2023-06-28 06:45:11 | ERROR | stderr | NewConnectionError: <urllib3.connection.HTTPConnection object at 0x7f61dc24fe20>: Failed to establish a new connection: [Errno 111] Connection refused
2023-06-28 06:45:11 | ERROR | stderr |
2023-06-28 06:45:11 | ERROR | stderr | During handling of the above exception, another exception occurred:
2023-06-28 06:45:11 | ERROR | stderr |
2023-06-28 06:45:11 | ERROR | stderr | ╭─────────────────────────────── Traceback (most recent call last) ────────────────────────────────╮
2023-06-28 06:45:11 | ERROR | stderr | │ /usr/local/lib/python3.10/dist-packages/requests/adapters.py:489 in send                         │
2023-06-28 06:45:11 | ERROR | stderr | │                                                                                                  │
2023-06-28 06:45:11 | ERROR | stderr | │   486 │   │                                                                                      │
2023-06-28 06:45:11 | ERROR | stderr | │   487 │   │   try:                                                                               │
2023-06-28 06:45:11 | ERROR | stderr | │   488 │   │   │   if not chunked:                                                                │
2023-06-28 06:45:11 | ERROR | stderr | │ ❱ 489 │   │   │   │   resp = conn.urlopen(                                                       │
2023-06-28 06:45:11 | ERROR | stderr | │   490 │   │   │   │   │   method=request.method,                                                 │
2023-06-28 06:45:11 | ERROR | stderr | │   491 │   │   │   │   │   url=url,                                                               │
2023-06-28 06:45:11 | ERROR | stderr | │   492 │   │   │   │   │   body=request.body,                                                     │
2023-06-28 06:45:11 | ERROR | stderr | │                                                                                                  │
2023-06-28 06:45:11 | ERROR | stderr | │ /usr/local/lib/python3.10/dist-packages/urllib3/connectionpool.py:787 in urlopen                 │
2023-06-28 06:45:11 | ERROR | stderr | │                                                                                                  │
2023-06-28 06:45:11 | ERROR | stderr | │    784 │   │   │   elif isinstance(e, (SocketError, HTTPException)):                             │
2023-06-28 06:45:11 | ERROR | stderr | │    785 │   │   │   │   e = ProtocolError("Connection aborted.", e)                               │
2023-06-28 06:45:11 | ERROR | stderr | │    786 │   │   │                                                                                 │
2023-06-28 06:45:11 | ERROR | stderr | │ ❱  787 │   │   │   retries = retries.increment(                                                  │
2023-06-28 06:45:11 | ERROR | stderr | │    788 │   │   │   │   method, url, error=e, _pool=self, _stacktrace=sys.exc_info()[2]           │
2023-06-28 06:45:11 | ERROR | stderr | │    789 │   │   │   )                                                                             │
2023-06-28 06:45:11 | ERROR | stderr | │    790 │   │   │   retries.sleep()                                                               │
2023-06-28 06:45:11 | ERROR | stderr | │                                                                                                  │
2023-06-28 06:45:11 | ERROR | stderr | │ /usr/local/lib/python3.10/dist-packages/urllib3/util/retry.py:592 in increment                   │
2023-06-28 06:45:11 | ERROR | stderr | │                                                                                                  │
2023-06-28 06:45:11 | ERROR | stderr | │   589 │   │   )                                                                                  │
2023-06-28 06:45:11 | ERROR | stderr | │   590 │   │                                                                                      │
2023-06-28 06:45:11 | ERROR | stderr | │   591 │   │   if new_retry.is_exhausted():                                                       │
2023-06-28 06:45:11 | ERROR | stderr | │ ❱ 592 │   │   │   raise MaxRetryError(_pool, url, error or ResponseError(cause))                 │
2023-06-28 06:45:11 | ERROR | stderr | │   593 │   │                                                                                      │
2023-06-28 06:45:11 | ERROR | stderr | │   594 │   │   log.debug("Incremented Retry for (url='%s'): %r", url, new_retry)                  │
2023-06-28 06:45:11 | ERROR | stderr | │   595                                                                                            │
2023-06-28 06:45:11 | ERROR | stderr | ╰──────────────────────────────────────────────────────────────────────────────────────────────────╯
2023-06-28 06:45:11 | ERROR | stderr | MaxRetryError: HTTPConnectionPool(host='localhost', port=21001): Max retries exceeded with url: /register_worker (Caused by NewConnectionError('<urllib3.connection.HTTPConnection object at 0x7f61dc24fe20>: 
Failed to establish a new connection:
2023-06-28 06:45:11 | ERROR | stderr | [Errno 111] Connection refused'))
2023-06-28 06:45:11 | ERROR | stderr |
2023-06-28 06:45:11 | ERROR | stderr | During handling of the above exception, another exception occurred:
2023-06-28 06:45:11 | ERROR | stderr |
2023-06-28 06:45:11 | ERROR | stderr | ╭─────────────────────────────── Traceback (most recent call last) ────────────────────────────────╮
2023-06-28 06:45:11 | ERROR | stderr | │ /usr/lib/python3.10/runpy.py:196 in _run_module_as_main                                          │
2023-06-28 06:45:11 | ERROR | stderr | │                                                                                                  │
2023-06-28 06:45:11 | ERROR | stderr | │   193 │   main_globals = sys.modules["__main__"].__dict__                                        │
2023-06-28 06:45:11 | ERROR | stderr | │   194 │   if alter_argv:                                                                         │
2023-06-28 06:45:11 | ERROR | stderr | │   195 │   │   sys.argv[0] = mod_spec.origin                                                      │
2023-06-28 06:45:11 | ERROR | stderr | │ ❱ 196 │   return _run_code(code, main_globals, None,                                             │
2023-06-28 06:45:11 | ERROR | stderr | │   197 │   │   │   │   │    "__main__", mod_spec)                                                 │
2023-06-28 06:45:11 | ERROR | stderr | │   198                                                                                            │
2023-06-28 06:45:11 | ERROR | stderr | │   199 def run_module(mod_name, init_globals=None,                                                │
2023-06-28 06:45:11 | ERROR | stderr | │                                                                                                  │
2023-06-28 06:45:11 | ERROR | stderr | │ /usr/lib/python3.10/runpy.py:86 in _run_code                                                     │
2023-06-28 06:45:11 | ERROR | stderr | │                                                                                                  │
2023-06-28 06:45:11 | ERROR | stderr | │    83 │   │   │   │   │      __loader__ = loader,                                                │
2023-06-28 06:45:11 | ERROR | stderr | │    84 │   │   │   │   │      __package__ = pkg_name,                                             │
2023-06-28 06:45:11 | ERROR | stderr | │    85 │   │   │   │   │      __spec__ = mod_spec)                                                │
2023-06-28 06:45:11 | ERROR | stderr | │ ❱  86 │   exec(code, run_globals)                                                                │
2023-06-28 06:45:11 | ERROR | stderr | │    87 │   return run_globals                                                                     │
2023-06-28 06:45:11 | ERROR | stderr | │    88                                                                                            │
2023-06-28 06:45:11 | ERROR | stderr | │    89 def _run_module_code(code, init_globals=None,                                              │
2023-06-28 06:45:11 | ERROR | stderr | │                                                                                                  │
2023-06-28 06:45:11 | ERROR | stderr | │ /usr/local/lib/python3.10/dist-packages/fastchat/serve/model_worker.py:452 in <module>           │
2023-06-28 06:45:11 | ERROR | stderr | │                                                                                                  │
2023-06-28 06:45:11 | ERROR | stderr | │   449 │   │   act_order=args.gptq_act_order,                                                     │
2023-06-28 06:45:11 | ERROR | stderr | │   450 │   )                                                                                      │
2023-06-28 06:45:11 | ERROR | stderr | │   451 │                                                                                          │
2023-06-28 06:45:11 | ERROR | stderr | │ ❱ 452 │   worker = ModelWorker(                                                                  │
2023-06-28 06:45:11 | ERROR | stderr | │   453 │   │   args.controller_address,                                                           │
2023-06-28 06:45:11 | ERROR | stderr | │   454 │   │   args.worker_address,                                                               │
2023-06-28 06:45:11 | ERROR | stderr | │   455 │   │   worker_id,                                                                         │
2023-06-28 06:45:11 | ERROR | stderr | │                                                                                                  │
2023-06-28 06:45:11 | ERROR | stderr | │ /usr/local/lib/python3.10/dist-packages/fastchat/serve/model_worker.py:117 in __init__           │
2023-06-28 06:45:11 | ERROR | stderr | │                                                                                                  │
2023-06-28 06:45:11 | ERROR | stderr | │   114 │   │   │   self.generate_stream_func = generate_stream                                    │
2023-06-28 06:45:11 | ERROR | stderr | │   115 │   │                                                                                      │
2023-06-28 06:45:11 | ERROR | stderr | │   116 │   │   if not no_register:                                                                │
2023-06-28 06:45:11 | ERROR | stderr | │ ❱ 117 │   │   │   self.register_to_controller()                                                  │
2023-06-28 06:45:11 | ERROR | stderr | │   118 │   │   │   self.heart_beat_thread = threading.Thread(                                     │
2023-06-28 06:45:11 | ERROR | stderr | │   119 │   │   │   │   target=heart_beat_worker, args=(self,)                                     │
2023-06-28 06:45:11 | ERROR | stderr | │   120 │   │   │   )                                                                              │
2023-06-28 06:45:11 | ERROR | stderr | │                                                                                                  │
2023-06-28 06:45:11 | ERROR | stderr | │ /usr/local/lib/python3.10/dist-packages/fastchat/serve/model_worker.py:132 in                    │
2023-06-28 06:45:11 | ERROR | stderr | │ register_to_controller                                                                           │
2023-06-28 06:45:11 | ERROR | stderr | │                                                                                                  │
2023-06-28 06:45:11 | ERROR | stderr | │   129 │   │   │   "check_heart_beat": True,                                                      │
2023-06-28 06:45:11 | ERROR | stderr | │   130 │   │   │   "worker_status": self.get_status(),                                            │
2023-06-28 06:45:11 | ERROR | stderr | │   131 │   │   }                                                                                  │
2023-06-28 06:45:11 | ERROR | stderr | │ ❱ 132 │   │   r = requests.post(url, json=data)                                                  │
2023-06-28 06:45:11 | ERROR | stderr | │   133 │   │   assert r.status_code == 200                                                        │
2023-06-28 06:45:11 | ERROR | stderr | │   134 │                                                                                          │
2023-06-28 06:45:11 | ERROR | stderr | │   135 │   def send_heart_beat(self):                                                             │
2023-06-28 06:45:11 | ERROR | stderr | │                                                                                                  │
2023-06-28 06:45:11 | ERROR | stderr | │ /usr/local/lib/python3.10/dist-packages/requests/api.py:115 in post                              │
2023-06-28 06:45:11 | ERROR | stderr | │                                                                                                  │
2023-06-28 06:45:11 | ERROR | stderr | │   112 │   :rtype: requests.Response                                                              │
2023-06-28 06:45:11 | ERROR | stderr | │   113 │   """                                                                                    │
2023-06-28 06:45:11 | ERROR | stderr | │   114 │                                                                                          │
2023-06-28 06:45:11 | ERROR | stderr | │ ❱ 115 │   return request("post", url, data=data, json=json, **kwargs)                            │
2023-06-28 06:45:11 | ERROR | stderr | │   116                                                                                            │
2023-06-28 06:45:11 | ERROR | stderr | │   117                                                                                            │
2023-06-28 06:45:11 | ERROR | stderr | │   118 def put(url, data=None, **kwargs):                                                         │
2023-06-28 06:45:11 | ERROR | stderr | │                                                                                                  │
2023-06-28 06:45:11 | ERROR | stderr | │ /usr/local/lib/python3.10/dist-packages/requests/api.py:59 in request                            │
2023-06-28 06:45:11 | ERROR | stderr | │                                                                                                  │
2023-06-28 06:45:11 | ERROR | stderr | │    56 │   # avoid leaving sockets open which can trigger a ResourceWarning in some               │
2023-06-28 06:45:11 | ERROR | stderr | │    57 │   # cases, and look like a memory leak in others.                                        │
2023-06-28 06:45:11 | ERROR | stderr | │    58 │   with sessions.Session() as session:                                                    │
2023-06-28 06:45:11 | ERROR | stderr | │ ❱  59 │   │   return session.request(method=method, url=url, **kwargs)                           │
2023-06-28 06:45:11 | ERROR | stderr | │    60                                                                                            │
2023-06-28 06:45:11 | ERROR | stderr | │    61                                                                                            │
2023-06-28 06:45:11 | ERROR | stderr | │    62 def get(url, params=None, **kwargs):                                                       │
2023-06-28 06:45:11 | ERROR | stderr | │                                                                                                  │
2023-06-28 06:45:11 | ERROR | stderr | │ /usr/local/lib/python3.10/dist-packages/requests/sessions.py:587 in request                      │
2023-06-28 06:45:11 | ERROR | stderr | │                                                                                                  │
2023-06-28 06:45:11 | ERROR | stderr | │   584 │   │   │   "allow_redirects": allow_redirects,                                            │
2023-06-28 06:45:11 | ERROR | stderr | │   585 │   │   }                                                                                  │
2023-06-28 06:45:11 | ERROR | stderr | │   586 │   │   send_kwargs.update(settings)                                                       │
2023-06-28 06:45:11 | ERROR | stderr | │ ❱ 587 │   │   resp = self.send(prep, **send_kwargs)                                              │
2023-06-28 06:45:11 | ERROR | stderr | │   588 │   │                                                                                      │
2023-06-28 06:45:11 | ERROR | stderr | │   589 │   │   return resp                                                                        │
2023-06-28 06:45:11 | ERROR | stderr | │   590                                                                                            │
2023-06-28 06:45:11 | ERROR | stderr | │                                                                                                  │
2023-06-28 06:45:11 | ERROR | stderr | │ /usr/local/lib/python3.10/dist-packages/requests/sessions.py:701 in send                         │
2023-06-28 06:45:11 | ERROR | stderr | │                                                                                                  │
2023-06-28 06:45:11 | ERROR | stderr | │   698 │   │   start = preferred_clock()                                                          │
2023-06-28 06:45:11 | ERROR | stderr | │   699 │   │                                                                                      │
2023-06-28 06:45:11 | ERROR | stderr | │   700 │   │   # Send the request                                                                 │
2023-06-28 06:45:11 | ERROR | stderr | │ ❱ 701 │   │   r = adapter.send(request, **kwargs)                                                │
2023-06-28 06:45:11 | ERROR | stderr | │   702 │   │                                                                                      │
2023-06-28 06:45:11 | ERROR | stderr | │   703 │   │   # Total elapsed time of the request (approximately)                                │
2023-06-28 06:45:11 | ERROR | stderr | │   704 │   │   elapsed = preferred_clock() - start                                                │
2023-06-28 06:45:11 | ERROR | stderr | │                                                                                                  │
2023-06-28 06:45:11 | ERROR | stderr | │ /usr/local/lib/python3.10/dist-packages/requests/adapters.py:565 in send                         │
2023-06-28 06:45:11 | ERROR | stderr | │                                                                                                  │
2023-06-28 06:45:11 | ERROR | stderr | │   562 │   │   │   │   # This branch is for urllib3 v1.22 and later.                              │
2023-06-28 06:45:11 | ERROR | stderr | │   563 │   │   │   │   raise SSLError(e, request=request)                                         │
2023-06-28 06:45:11 | ERROR | stderr | │   564 │   │   │                                                                                  │
2023-06-28 06:45:11 | ERROR | stderr | │ ❱ 565 │   │   │   raise ConnectionError(e, request=request)                                      │
2023-06-28 06:45:11 | ERROR | stderr | │   566 │   │                                                                                      │
2023-06-28 06:45:11 | ERROR | stderr | │   567 │   │   except ClosedPoolError as e:                                                       │
2023-06-28 06:45:11 | ERROR | stderr | │   568 │   │   │   raise ConnectionError(e, request=request)                                      │
2023-06-28 06:45:11 | ERROR | stderr | ╰──────────────────────────────────────────────────────────────────────────────────────────────────╯
2023-06-28 06:45:11 | ERROR | stderr | ConnectionError: HTTPConnectionPool(host='localhost', port=21001): Max retries exceeded with url: /register_worker (Caused by NewConnectionError('<urllib3.connection.HTTPConnection object at 0x7f61dc24fe20>: Failed to establish a new connection:
2023-06-28 06:45:11 | ERROR | stderr | [Errno 111] Connection refused'))
```