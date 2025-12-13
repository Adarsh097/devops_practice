## Docker Mastery

A **hypervisor** is software (or firmware) that **creates and runs virtual machines (VMs)**. It allows **multiple operating systems** to run on a **single physical machine** by sharing hardware resources like CPU, memory, storage, and network.

---

### 🔹 What does a hypervisor do?

* Allocates hardware resources to each VM
* Isolates VMs from each other for security and stability
* Manages VM lifecycle (start, stop, pause)
* Enables efficient hardware utilization

---

### 🔹 Types of Hypervisors

#### **1. Type 1 – Bare-metal Hypervisor**

Runs **directly on the hardware** (no host OS).

**Examples:**

* VMware ESXi
* Microsoft Hyper-V
* Xen
* KVM

✅ High performance
✅ Used in data centers & cloud platforms (AWS, Azure, GCP)

---

#### **2. Type 2 – Hosted Hypervisor**

Runs **on top of an existing operating system**.

**Examples:**

* VirtualBox
* VMware Workstation
* Parallels Desktop

✅ Easy to install
❌ Slightly lower performance
✅ Used for development, testing, learning

---

### 🔹 Simple analogy

Think of a hypervisor as a **building manager**:

* The **physical server** is the building
* **Virtual machines** are apartments
* The **hypervisor** manages who gets how much electricity, water, and space

---

### 🔹 Why hypervisors are important

* Cloud computing foundation
* Server consolidation
* Cost and energy efficiency
* Easy testing & isolation
* Disaster recovery & scalability


In **AWS terms**, a **hypervisor** is the core technology that **AWS uses to virtualize physical servers and run EC2 instances**.

---

## 🔹 Hypervisor in AWS

### **AWS uses a custom hypervisor called *Nitro***

Earlier AWS used **Xen**, but now **most EC2 instances run on the AWS Nitro System**.

---

## 🔹 What is the AWS Nitro Hypervisor?

The **Nitro Hypervisor** is a **lightweight, hardware-assisted hypervisor** that:

* Runs **directly on bare metal (Type 1)**
* Offloads virtualization tasks to **dedicated hardware**
* Leaves more CPU & memory for your EC2 instances

👉 You **don’t manage or see the hypervisor**—AWS manages it for you.

---

## 🔹 How Nitro works (simplified)

```
Physical Server
 ├─ Nitro Card (Networking, Storage, Security)
 ├─ Nitro Hypervisor
 └─ EC2 Instances (Your OS & Apps)
```

* **Nitro Cards** handle:

  * Networking (VPC)
  * EBS storage
  * Security isolation
* **Nitro Hypervisor** focuses only on:

  * CPU & memory isolation

---

## 🔹 Benefits of Nitro in AWS

* 🚀 Near bare-metal performance
* 🔐 Strong isolation between EC2 instances
* 📈 Better scalability
* 🧩 Supports modern instance types (C, M, R, Graviton)

---

## 🔹 EC2 and Hypervisor relationship

* One **physical server**
* Runs **multiple EC2 instances**
* Each EC2 instance = a **virtual machine**
* Hypervisor ensures **resource sharing + isolation**

---

## 🔹 Interview-ready answer

> *In AWS, a hypervisor is the underlying virtualization layer used to run EC2 instances. AWS primarily uses the Nitro Hypervisor, a lightweight Type-1 hypervisor that works with dedicated Nitro hardware to provide secure isolation and near bare-metal performance.*

---

## Part1
1. sudo systemctl start docker
2. sudo systemctl restart docker
3. sudo systemctl status docker

4. docker --version
5. docker --help
6. docker ps -a (to see all containers)
7. docker rm container-id/name (to remove the container)
8. docker stop container-id/name (to stop running container)
9. docker system prune (to remove stopped container, unused volume and networks)
10. docker logs container-id
11. docker rmi image-id

# Common Commands:
  run         Create and run a new container from an image
  exec        Execute a command in a running container
  ps          List containers
  build       Build an image from a Dockerfile
  bake        Build from a file
  pull        Download an image from a registry
  push        Upload an image to a registry
  images      List images
  login       Authenticate to a registry
  logout      Log out from a registry
  search      Search Docker Hub for images
  version     Show the Docker version information
  info        Display system-wide information


# Add current user to docker group (give it privileges to run docker commands)
1. sudo usermod -a -G docker $USER
2. reboot

# Running mysql:latest image after (docker pull mysql)
1. docker run -it --name my-db - e MYSQL_ROOT_PASSWORD=1234 mysql:latest
2. docker exec -it container-id/name bash (to run the interactive terminal inside the container)
3. mysql -u root -p (to run mysql as root user) -> will prompt to enter the password
4. exit (to exit the terminals of mysql or bash)

# Tags
1. -e = environment
2. -d = daemon (to run the container in background wihtout blocking the terminal)
3. -p system_port:container_port

# Running Jenkins
1. docker pull jenkins/jenkins
2. docker run -d --name jenkins-server -p 8080:8080 jenkins/jenkins:latest
3. In security groups rule, expose the 8080/tcp port for 0.0.0.0/0 IP to access jenkins on any device.

# Running nginx server
1. docker pull nginx
2. docker run -d --name nginx-server -p 80:80 nginx:latest
3. In security groups expose port:80.


# Short method to install docker
1. sudo apt-get update
2. sudo apt-get install docker.io


# Dockerfile
1. Inside one folder there can only one docker file

```
FROM python:3.9
WORKDIR app
COPY . /app
RUN pip install -r requirements.txt 
EXPOSE 8002
CMD ["python","manage.py","runserver","0.0.0.0:8002"]

```
2. docker build . -t my-app (building the image using the dockerfile present in the current directory)
3.  dk run -d -p 8002:8002 my-app:latest


# Dockering a react-django-demo-app
1. git clone repo_url
2. check which python:version does it require and install it
3. sudo apt install python3-pip (package manager to install django further)
4. pip install django==3.2 (install django)
5. django app run on port:8000 by default