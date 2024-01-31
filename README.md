# Docker image for ImapTest

## Overview

This creates an unofficial Docker image of ImapTest, an IMAP server tester
from the Dovecot project. The image is published https://hub.docker.com/r/nikolay2007/imaptest

ImapTest is an integration and stress tester for IMAP servers, developed as part of the Dovecot project.

Integration tests:

```
docker run -it jheiss/imaptest \
    host=imap.example.com port=143 \
    user=user@example.com pass=abc123 \
    test=/usr/local/share/imaptest/tests
```

Stress tests:

```
docker run -it jheiss/imaptest \
    host=imap.example.com port=143 \
    user=user@example.com pass=abc123 \
    mbox=/usr/local/share/imaptest/dovecot-crlf
```

See the ImapTest wiki for more details: https://imapwiki.org/ImapTest

## TLS

ImapTest does not support TLS. If your IMAP server requires TLS you can run stunnel to translate for you.

```
docker run -it --name stunnel \
    -e STUNNEL_CLIENT=yes \
    -e STUNNEL_SERVICE=imap \
    -e STUNNEL_ACCEPT=143 \
    -e STUNNEL_CONNECT=host.docker.internal:993 \
    -p 143:143 \
    dweomer/stunnel
```

Then run imaptest:

```
docker run -it --link stunnel jheiss/imaptest host=stunnel port=143 ...
```

## Image

The image is automatically built once a week from the dovecot and imaptest
nightly releases using GitHub Actions via the configuration in this
repository.
