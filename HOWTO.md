# How-To Guide
Please follow the below steps for your particular deployment scenario
## How to Run Locally

To run this project locally, clone the repository and follow these steps:
```
#Clone the repository:
git clone https://github.com/aarato/aarato.git
cd aarato
#Install dependencies:
npm install
#Run the development server:
npm run dev
```

## How to Run as a Docker Container

To run this project as a docker container, follow these steps:
```
#Clone the repository:
git clone https://github.com/aarato/aarato.git
cd aarato
#Build the Docker Image:
docker build --load -t testwebsite .
#Alternatively you can build a Multi-Arch image to your repository
docker buildx build --platform linux/amd64,linux/arm64 -t aarato/aarato:latest --load .
#Run the Docker Container:
docker run -it --rm  -p 8080:80 testwebsite
```
