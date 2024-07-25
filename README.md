# CertGen - Self-Signed Certificate Automation

CertGen is a Docker container that simplifies the process of generating self-signed SSL/TLS certificates for local development environments.

## Features
- Automated certificate generation
- Customizable parameters via environment variables
- Output management
- Easy integration

## Usage
1. Clone this repository.
2. Build the Docker image:
   ```sh
   chmod +x build_image.sh
   ./build_image.sh
   ```
3. Run the image (replace the sample values):
   ```sh
   docker run -v ./output:/output -e DOMAIN=domain.com -e ORG_NAME="Your Org" -e COUNTRY=US -e STATE=FL -e CITY=Miami
   ```
