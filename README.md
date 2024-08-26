👋 **Hi, I'm Andras Arato.**

I’m a tech enthusiast with a keen interest in Infrastructure as Code (IaC) projects and various aspects of modern software development.

## Contact Me

- **📫 How to Reach Me:**  
  Feel free to get in touch via email at [andras@arato.biz](mailto:andras@arato.biz). Whether you have a question, a collaboration idea, or just want to connect, I'd love to hear from you.

- **🌐 Visit My Website:**  
  Check out my personal website at [arato.biz](https://arato.biz) for more information about my work, projects, and thoughts on technology.

## Repository Information

This repository contains the source code for my personal website, which you can explore right [here](https://github.com/aarato/aarato) on GitHub. The website’s content is dynamically loaded from a [single bi-lingual YAML file ](https://github.com/aarato/aarato/blob/main/config.yaml) stored in this repository. This approach allows me to quickly make updates directly on GitHub, leveraging built-in version control for efficient content management.

  - **Frontend:** Vue.js 3, Vite, Bootstrap CSS
  - **Infrastructure:** Docker, Nginx, GitHub Actions (for CI/CD)
  - **Hosting:** As this website is fully static on the back-end, it can be hosted anywhere by using you favorite web service.

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
#Run the Docker Container:
docker run -it --rm  -p 8080:80 testwebsite
```
