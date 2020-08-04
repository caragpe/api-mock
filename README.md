# Quick How to
1) Clone this repo
1) docker build --tag wiremock-testing .
1) docker run -it --rm -p 8080:8080 --name test wiremock-testing:latest

Then, browse to http://localhost:8080/routes