<?php
$public_key = '-----BEGIN PUBLIC KEY-----
MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEA4UbFuCQqVjGbtSkUR4y4
5pWgDXOSz91vsPsybcIx11/D1bIqHGrocztp6+opw/FoVtZN1+LjH4bAeU87fmtL
0C8xo0+Mo+wi2t8YHfhJ86DChJr0cuIvbH50Xho+jXKCjclsnkNXgLynKvBbnrYF
cTQYtfItY8lhodv66aCycZYayNauW7pwoUe5Jij+QgqUf2NT4MCQM94hn1zqjV/C
w3CvJPozFUppDc6I7a2VCnS0+7ElmIb+n7m4Ux/iRFcDKdk+v/lT05mnfhyNrJXQ
G/G2t7jcf8S0xgSljyA8pVcbHbHGBcXqO7SD0xqTCJdKjWQxfWxQi2VC+ABxfWWd
ewIDAQAB
-----END PUBLIC KEY-----';
$private_key  ='-----BEGIN PRIVATE KEY-----
MIIEvwIBADANBgkqhkiG9w0BAQEFAASCBKkwggSlAgEAAoIBAQDhRsW4JCpWMZu1
KRRHjLjmlaANc5LP3W+w+zJtwjHXX8PVsiocauhzO2nr6inD8WhW1k3X4uMfhsB5
Tzt+a0vQLzGjT4yj7CLa3xgd+EnzoMKEmvRy4i9sfnReGj6NcoKNyWyeQ1eAvKcq
8FuetgVxNBi18i1jyWGh2/rpoLJxlhrI1q5bunChR7kmKP5CCpR/Y1PgwJAz3iGf
XOqNX8LDcK8k+jMVSmkNzojtrZUKdLT7sSWYhv6fubhTH+JEVwMp2T6/+VPTmad+
HI2sldAb8ba3uNx/xLTGBKWPIDylVxsdscYFxeo7tIPTGpMIl0qNZDF9bFCLZUL4
AHF9ZZ17AgMBAAECggEBALftlJjXzkk5j6vFsm0IlB6Po3HYHtHgNcUGExJSL2dt
JPNg18kD8G3E4KJhOWBlxY7AwiW1dULUPmnNKwH4kJmVLq3r0SQ1M/AHniU6BwcH
BkpGSbdSvO2UAWajftb122nwPuKokNTnMoV4YRWf/6mBo3tKE40ZasFAXghJz+ez
4jAhmysqQsA7vnvqbVG8N54nQQOq8A3EGWKxMKsqf901Ttr+H/rvDqmIY660l4Ra
a+Djl49ps2N/LLRgE6YKEcbILqYpY1OJgR2xgsziO0noXC84ml8oNYd5psOQxvvY
0LLxvkx5JmkkCAJ4w4HxP3iaMjGwK0b7rOBSw9g8h4ECgYEA93eTRLUl66QKFE1P
pLLnCuL8nSHGPFjwasElvl5Vpf390r6cAovw9hM0IhRGs6qjYa92qMc2zXkikWTn
vOHyiy7gf3sQGf7h61tlylLAI4whyNZlF7xv90pK7vcZ9K8xOA1wCZt9OQR7ZNn7
D3pgKJsasQqg+rnFI86NPr+XNGsCgYEA6QtRQJjykf2ckjpjOnXQErzYKfU2l6Lf
5reVhc1Y8ZRpyh9ObOP9BwDYsBx6FWd2nQSef0C5h5G1e9hSjjB5XhVfLrHSRevZ
y9UA+auagCmZ+Jld+vYIVzcGv9m5pJ8X4DaTwKwUqceLjyABpnL1z2X22niP/Fsc
75/zNPw6/zECgYEAlBkerG7Qu94XHiFKeaGLfctsLMmKrpD3iJwA75XbIhUIM3hZ
O3jugwXpHEAQM/P6BTsSA139oShOlL7TpQl/suYh+oj2kOgl4kl3eIbfcCasDVqp
c3QVeeQfRjXhdbrm9Mmt9EH2xgm1oxyFELVHGOYCKlPXFVXZ8lzp0NSuM/MCgYAf
Wyh5mpq4zfjtK/ICAawXeVVUf+vyhzW9I2J4+GJJTwDU81VoDV0UPibpu0sp6hvp
kJ+K27ia5x4WJcsl2pvZ7uI5tC9ovQ03Adf5v/8v02kmK+ybQdNpeLvtwGvcHJPn
1TAYMo8tMO40Ocg/DyTH3R5T0vj8qX3BODJPJMkDYQKBgQCb2htU1jk1uHjf2en8
Fk6VigU+aWUY2eoC4shk9/9altKMAJAExljjRiezU53CeYA1cQZ3naHfGHdDQ6WS
UBbFT6tbX2ng0gQH7Bf61pd+Q5bwVjxpr1xspG4iINQ80Tm+XUASWKuggOgnI7OP
kWr1btX04x/Rz5ljt+jz9O91Fw==
-----END PRIVATE KEY-----';

var_dump(openssl_pkey_get_private($private_key));
echo PHP_EOL;
var_dump(openssl_pkey_get_public($public_key));
