# Docker image for ImapTest

## Overview

This creates an unofficial Docker image of ImapTest, an IMAP server tester
from the Dovecot project. The image is published
https://hub.docker.com/repository/docker/jheiss/imaptest

ImapTest is an integration and stress tester for IMAP servers, developed as part of the Dovecot project.

Integration tests:

```
docker run -it jheiss/imaptest host=imap.example.com port=1993 user=user@example.com pass=abc123 test=/usr/local/share/imaptest/tests
```

Stress tests:

```
docker run -it jheiss/imaptest host=imap.example.com port=1993 user=user@example.com pass=abc123 mbox=/usr/local/share/imaptest/dovecot-crlf
```

See the ImapTest wiki for more details: https://imapwiki.org/ImapTest

## Image

The image is automatically built once a week from the dovecot and imaptest
nightly releases using GitHub Actions via the configuration in this
repository.
