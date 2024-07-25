#!/bin/sh

# Default values
DOMAIN=${DOMAIN:-"localhost"}
ORG_NAME=${ORG_NAME:-"Local Development"}
OUTPUT_DIR=${OUTPUT_DIR:-"/output"}
VALIDITY_DAYS=${VALIDITY_DAYS:-365}
COUNTRY=${COUNTRY}
STATE=${STATE}
CITY=${CITY}

# Generate the key pair
openssl genpkey -algorithm RSA -out ${OUTPUT_DIR}/${DOMAIN}.key

# Create a CSR
openssl req -new -key ${OUTPUT_DIR}/${DOMAIN}.key -out ${OUTPUT_DIR}/${DOMAIN}.csr \
    -subj "/C=${COUNTRY}/ST=${STATE}/L=${CITY}/O=${ORG_NAME}/CN=${DOMAIN}"

# Sign the CSR to create a self-signed certificate
openssl x509 -req -days ${VALIDITY_DAYS} -in ${OUTPUT_DIR}/${DOMAIN}.csr -signkey ${OUTPUT_DIR}/${DOMAIN}.key -out ${OUTPUT_DIR}/${DOMAIN}.crt

# Clean up the CSR file
rm ${OUTPUT_DIR}/${DOMAIN}.csr

# Print the generated certificate
echo "Certificate generated successfully:"
cat ${OUTPUT_DIR}/${DOMAIN}.crt
