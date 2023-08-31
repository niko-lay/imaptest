#!/bin/sh

set -e

if [ "x${SKIP_EMAILS_DOWNLOAD}" != "x" ];
then
	echo "Emails download from s3 was skipped"
else
	echo "Tring to get new dovecot-crlf from s3..."
	aws s3 cp s3://${AWS_S3_BUCKET_NAME}/${AWS_S3_FILE_NAME} /tmp/dovecot-crlf
fi


exec /usr/local/bin/imaptest mbox=/tmp/dovecot-crlf $(echo $@ | envsubst)
