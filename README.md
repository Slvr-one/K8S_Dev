# K8S_Dev
My personal repository for Kubernetes dev projects

## some documentation:

- blah
- blah

# project goals:

here I'll outline two projects that will give you hands-on experience with Zookeeper and Kafka, as well as with PKI certificates using Java Keytool and OpenSSH.

## Project 1: Setting up and Troubleshooting a Kafka Environment with Zookeeper

### Objective: Set up a Kafka environment with Zookeeper and develop a simple application that publishes and consumes messages. Then, simulate common issues and use the Zookeeper CLI to troubleshoot.

Steps:
* Setup: Download and install Apache Kafka and Zookeeper on your local machine.
* Kafka-Zookeeper Configuration: Configure Kafka to use Zookeeper. Create a Kafka topic and ensure it's correctly registered in Zookeeper.
* Application Development: Develop a simple producer-consumer application in a language of your choice (Java, Python, etc.) that publishes messages to the Kafka topic and consumes them.
* Troubleshooting Simulation: Simulate common issues such as network partitions, broker failures, etc. Use the Zookeeper CLI to investigate the issues.
* Documentation: Document each step, noting down any issues encountered and how you resolved them. This will be your troubleshooting guide.

## Project 2: Securing Data Transmission with PKI Certificates using Java Keytool and OpenSSH

### Objective: Secure data transmission between a client and a server application using PKI certificates. You'll request, sign, install, and renew certificates using Java Keytool and OpenSSH.

Steps:
* Setup: Develop a simple client-server application in Java. The client should send a request to the server and the server should respond.
* Certificate Creation: Use Java Keytool to create a self-signed certificate for your server application.
* Certificate Installation: Install the certificate on the server and configure it to use this certificate for SSL/TLS communication.
* Client Configuration: Configure the client to trust the server's certificate (you may need to import the server's certificate into the client's truststore using Keytool).
* Data Transmission: Test secure data transmission between the client and server.
* Certificate Renewal: Simulate certificate expiry and use Keytool to renew the certificate. Test whether the client can still communicate securely with the server.
* SSH Key Pair Generation: Use OpenSSH to generate a SSH key pair. Use the public key to authenticate with a remote server.
* Documentation: Document each step, noting down any issues encountered and how you resolved them.
Remember, these projects are quite complex and will require a good understanding of Kafka, Zookeeper, SSL/TLS, and PKI certificates. Make sure to break down each step further and tackle them one at a time. Good luck!

