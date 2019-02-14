# openssl --
{:data-section="shell"}
{:data-date="February 12, 2019"}
{:data-extra="Um Pages"}

## EXAMPLES

`openssl req -nodes -x509 -newkey rsa:4096 -keyout boggs.key -out boggs.csr -days 365 -subj "/C=PH/ST=NCR/L=Makati/O=Boggs/OU=Engineering/CN=boggs.xyz"`

`openssl dhparam -out /data/dhparam.pem 2048`
