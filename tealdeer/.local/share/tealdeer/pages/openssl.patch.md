- Generate a self-signed certificate and key valid for 365 days:

`openssl req -nodes -x509 -newkey rsa:4096 -keyout boggs.key -out boggs.csr -days 365 -subj "/C=PH/ST=NCR/L=Makati/O=Boggs/OU=Engineering/CN=boggs.xyz"`

- Generate Diffie-Hellman parameters:

`openssl dhparam -out /data/dhparam.pem 2048`
