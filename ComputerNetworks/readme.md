## Networking

To understand **how the Internet works end-to-end**, think of it as a **global hierarchy of physical infrastructure + companies + networks + protocols**. I'll explain it **layer by layer from undersea cables → Tier-1 ISPs → Tier-2 → Tier-3 → WAN/MAN/LAN/PAN → your device**, so you get the **complete mental model**.

---

# 1. Physical Layer — The Actual Internet Cables 🌍

![Image](https://upload.wikimedia.org/wikipedia/commons/8/89/Submarine_cable_map_umap.png)

![Image](https://static.wixstatic.com/media/9d72ca_e84edc3472c84b05bdc238172947a751~mv2.jpg/v1/fill/w_980%2Ch_551%2Cal_c%2Cq_85%2Cusm_0.66_1.00_0.01%2Cenc_avif%2Cquality_auto/9d72ca_e84edc3472c84b05bdc238172947a751~mv2.jpg)

![Image](https://www.iscpc.org/images/Telegeography%20Map.JPG)

![Image](https://submarine-cable-map-2025.telegeography.com/images/Submarine_Cable_Map_2025_Middle_East-e6c818621ecde37dec9fe1fe63fbd9c7.jpg)

The **internet is not wireless globally**.
It mostly runs on **fiber-optic cables**.

Two main types:

### 1. Submarine (Undersea) Cables

* Connect **continents**
* Carry **~95% of global internet traffic**
* Laid on ocean floor

Examples:

* SEA-ME-WE cable
* MAREA cable (Microsoft + Meta)
* FLAG cable

These cables carry **light signals through fiber optics**.

**Speed**

Modern fiber:

* 100 Gbps
* 400 Gbps
* Tbps scale

---

### 2. Terrestrial Fiber Cables

These run **within countries and cities**.

Examples:

* Airtel fiber backbone
* Jio fiber backbone
* BSNL national fiber network

These connect:

* cities
* data centers
* ISPs

---

# 2. Data Centers — Where Internet Services Live 🖥️

![Image](https://res.cloudinary.com/dlysgt3ss/images/c_scale%2Cw_448%2Ch_305%2Cdpr_2/f_auto%2Cq_auto/v1732533543/1651560827418/1651560827418.jpeg?_i=AA)

![Image](https://storage.googleapis.com/gweb-uniblog-publish-prod/images/Council-Bluffs-server-floor.width-500.format-webp.webp)

![Image](https://www.coresite.com/hubfs/Imported_Blog_Media/6398ca9abb783c11749407a7_th-what-is-hyperscale-data-center.jpg)

![Image](https://etimg.etb2bimg.com/photo/116026542.cms)

When you open:

```
google.com
youtube.com
instagram.com
```

You are connecting to **servers in data centers**.

Major companies own **huge data centers**:

Examples:

* Google
* Amazon AWS
* Microsoft Azure
* Cloudflare
* Meta

Data centers connect to **Tier-1 networks via fiber**.

---

# 3. Internet Backbone — Tier 1 ISPs 🌐

![Image](https://upload.wikimedia.org/wikipedia/commons/3/36/Internet_Connectivity_Distribution_%26_Core.svg)

![Image](https://kmcd.dev/posts/internet-map-2025/screenshot.png)

![Image](https://drpeering.net/img/DFZ.jpg)

![Image](https://drpeering.net/img/Tier%201%20ISP%20Model.jpg)

At the top of the internet hierarchy are **Tier-1 ISPs**.

These companies **own massive global backbone networks**.

They connect **continents and countries**.

### Examples of Tier-1 ISPs

* Lumen (Level 3)
* AT&T
* Verizon
* NTT
* Tata Communications
* Telia Carrier

Important fact:

👉 **Tier-1 networks don't pay anyone for traffic.**

They **peer with each other for free**.

This is called:

### Settlement-Free Peering

Meaning:

```
Tier1 ↔ Tier1
Free traffic exchange
```

They form the **global internet backbone**.

---

# 4. Tier-2 ISPs — Regional Providers

Tier-2 companies:

* buy transit from Tier-1
* peer with other Tier-2

They operate **country or region level networks**.

Examples:

India:

* Airtel
* Jio
* BSNL
* Vodafone

Flow:

```
Tier1 → Tier2 → Tier3
```

They provide **internet bandwidth to smaller providers**.

---

# 5. Tier-3 ISPs — Local Internet Providers

These are **the companies that give you internet**.

Examples:

* Local broadband provider
* Cable operator
* Fiber ISP in your area

They buy bandwidth from **Tier-2 providers**.

Example flow in India:

```
Submarine Cable
      ↓
Tata Communications (Tier 1)
      ↓
Airtel Backbone (Tier 2)
      ↓
Local ISP (Tier 3)
      ↓
Your WiFi Router
```

---

# 6. Internet Exchange Points (IXP)

![Image](https://upload.wikimedia.org/wikipedia/commons/thumb/5/56/NewNSFNETArchitecture.jpg/500px-NewNSFNETArchitecture.jpg)

![Image](https://www.researchgate.net/publication/309457954/figure/fig3/AS%3A667722358722565%401536208824597/P-General-Architecture.png)

![Image](https://www.researchgate.net/publication/350505028/figure/fig1/AS%3A1007224528846849%401617152449059/Traditional-IXP-architecture21.jpg)

![Image](https://drpeering.net/Internet-Peering-Playbook/img/4-Internet-Peering/4-2-Peering-Diagram.png)

IXP = **place where networks connect and exchange traffic**.

Instead of routing traffic globally, companies **exchange locally**.

Example:

```
Jio ↔ Airtel
```

inside a **data center exchange**.

Example IXPs:

* DE-CIX
* AMS-IX
* NIXI (India)

Benefit:

* lower latency
* cheaper traffic
* faster internet

---

# 7. Routing — How Data Finds Its Path

Internet uses **routers and routing protocols**.

Main protocol:

### BGP (Border Gateway Protocol)

BGP decides:

```
Which path packets should take
```

Example:

```
Your PC → ISP → Airtel → Tata → Google Server
```

BGP chooses the **best route based on policies**.

---

# 8. Network Types — PAN → LAN → MAN → WAN

Now the **network scope hierarchy**.

---

## 1. PAN — Personal Area Network

Range:

```
1–10 meters
```

Examples:

* Bluetooth
* Phone hotspot
* Smartwatch

Example:

```
Phone ↔ Earbuds
Phone ↔ Laptop hotspot
```

---

## 2. LAN — Local Area Network

Range:

```
Home / Office
```

Examples:

* Home WiFi
* Office network

Components:

```
Devices → Switch → Router
```

Example:

```
Laptop
Phone
TV
Printer
```

All connected inside your house.

---

## 3. MAN — Metropolitan Area Network

Covers a **city**.

Example:

```
ISP fiber network across city
```

Example cities:

```
Delhi fiber network
Mumbai broadband backbone
```

---

## 4. WAN — Wide Area Network

Covers **countries or continents**.

Example:

```
Internet backbone
```

Examples:

* Global telecom network
* Cloud infrastructure

WAN connects **MAN networks together**.

---

# 9. Complete Internet Flow Example

Let's say you open:

```
youtube.com
```

Step by step:

### Step 1 — Device

Your laptop sends request:

```
HTTPS request
```

---

### Step 2 — Router

Request goes to:

```
Home Router
```

---

### Step 3 — ISP

Router sends packet to:

```
Local ISP
```

---

### Step 4 — Tier 2 Provider

Local ISP forwards traffic to:

```
Airtel / Jio backbone
```

---

### Step 5 — Tier 1 Backbone

Traffic travels through **global backbone fiber**.

---

### Step 6 — Data Center

Request reaches:

```
Google data center
```

---

### Step 7 — Server Response

Google server sends response back through same path.

---

# 10. Full Internet Architecture Diagram (Simplified)

```
Your Device
    │
    │ PAN
    ▼
Home Router
    │
    │ LAN
    ▼
Local ISP (Tier 3)
    │
    │ MAN
    ▼
Regional ISP (Tier 2)
    │
    │ WAN
    ▼
Tier 1 Internet Backbone
    │
    ▼
Internet Exchange Points
    │
    ▼
Cloud Data Center
    │
    ▼
Server (Google, Netflix, etc)
```

---

# 11. Where DevOps/Cloud Engineers Fit

Since you're learning **DevOps + cloud**, this matters.

You mostly interact with:

### Layers you control

```
Application
Server
Cloud network
Load balancers
CDN
DNS
```

Example stack:

```
User
↓
DNS
↓
CDN (Cloudflare)
↓
Load Balancer
↓
Kubernetes cluster
↓
Application Pod
```

But underneath this **entire internet infrastructure exists**.

---

# 12. Key Technologies Powering Internet

Important protocols:

| Protocol   | Purpose                  |
| ---------- | ------------------------ |
| TCP        | Reliable communication   |
| IP         | Addressing               |
| DNS        | Domain → IP              |
| BGP        | Routing between networks |
| HTTP/HTTPS | Web communication        |
| TLS        | Encryption               |

---

# 13. Real World Example (YouTube)

When you open YouTube:

```
1 DNS resolves youtube.com
2 request goes through ISP
3 routed via BGP
4 hits Google edge server
5 CDN serves video
```

Google also deploys **edge caches inside ISP networks** to reduce latency.

---


You’re asking for **core networking fundamentals at a deep level**, which is great because these topics are exactly what **DevOps engineers, backend engineers, and network engineers must master**.

I’ll explain them in a **structured architecture view**:

```
Internet Architecture
│
├── OSI Model
├── TCP/IP Model
├── Protocols
├── Ports
├── IP Addressing
│   ├── IPv4
│   ├── IPv6
│   └── Subnetting
├── Private Networks
│   ├── VPC
│   └── VPN
```

---

# 1. OSI Model (Open Systems Interconnection Model)

The **OSI model** is a **conceptual framework** created by the **International Organization for Standardization** to standardize network communication.

It has **7 layers**, each responsible for a specific function.

```
7  Application
6  Presentation
5  Session
4  Transport
3  Network
2  Data Link
1  Physical
```

Think of it as **how data moves from one computer to another**.

---

## Layer 7 — Application Layer

This layer interacts **directly with user applications**.

Protocols here include:

* HTTP
* HTTPS
* FTP
* SMTP
* DNS

Example:

```
Browser → HTTP request → Web server
```

When you type:

```
https://google.com
```

The **browser creates an HTTP request**.

---

## Layer 6 — Presentation Layer

Responsible for **data formatting and encryption**.

Functions:

* Encryption
* Compression
* Data translation

Example:

Encryption protocol:

* TLS

Flow:

```
Plain data
↓
Encrypted using TLS
↓
Sent to transport layer
```

Example:

```
HTTPS = HTTP + TLS encryption
```

---

## Layer 5 — Session Layer

Manages **sessions between devices**.

Functions:

* session creation
* session management
* session termination

Example:

```
Client ↔ Server session
```

Used in:

* database connections
* login sessions

---

## Layer 4 — Transport Layer

Ensures **reliable or fast communication between hosts**.

Protocols:

* TCP
* UDP

Responsibilities:

```
Port addressing
Segmentation
Reliability
Flow control
Error recovery
```

Example:

```
Browser → Server
Port 443
```

---

### TCP (Transmission Control Protocol)

TCP provides **reliable communication**.

Features:

```
Connection oriented
Acknowledgement
Retransmission
Ordered delivery
```

Example:

```
Web browsing
Email
File transfer
```

TCP handshake:

```
Client → SYN
Server → SYN-ACK
Client → ACK
```

This is called the **3-way handshake**.

---

### UDP (User Datagram Protocol)

UDP is **faster but unreliable**.

Characteristics:

```
No connection
No acknowledgement
Low latency
```

Used in:

```
Video streaming
Online gaming
DNS
VoIP
```

---

## Layer 3 — Network Layer

Responsible for **routing packets between networks**.

Protocol:

* Internet Protocol (IP)

Functions:

```
Logical addressing
Packet routing
Path determination
```

Routers operate here.

Example:

```
192.168.1.10 → 8.8.8.8
```

---

## Layer 2 — Data Link Layer

Responsible for **communication inside local network**.

Protocols:

* Ethernet
* ARP

Devices:

```
Switch
Bridge
```

Key concept:

```
MAC Address
```

Example MAC:

```
00:1A:2B:3C:4D:5E
```

---

## Layer 1 — Physical Layer

Actual **physical transmission of bits**.

Examples:

```
Fiber optic cable
Ethernet cable
Radio waves
Electrical signals
```

Devices:

```
Hub
Repeater
Cables
```

---

# 2. TCP/IP Model (Real Internet Model)

The **TCP/IP model** is the **practical implementation used on the Internet**.

Created by **DARPA**.

It has **4 layers**.

```
Application
Transport
Internet
Network Access
```

Mapping to OSI:

| TCP/IP         | OSI                                  |
| -------------- | ------------------------------------ |
| Application    | Application + Presentation + Session |
| Transport      | Transport                            |
| Internet       | Network                              |
| Network Access | Data Link + Physical                 |

---

# 3. Important Internet Protocols

Here are **core protocols used daily**.

---

## HTTP

HTTP

Used for:

```
Web communication
```

Example:

```
GET /index.html
```

Port:

```
80
```

---

## HTTPS

HTTPS

HTTP + encryption via **TLS**.

Port:

```
443
```

---

## DNS

Domain Name System

Converts:

```
google.com → 142.250.183.14
```

Port:

```
53
```

---

## SSH

Secure Shell

Remote server login.

Port:

```
22
```

---

## FTP

File Transfer Protocol

Used for file transfer.

Port:

```
21
```

---

## SMTP

Simple Mail Transfer Protocol

Used for sending email.

Port:

```
25
```

---

# 4. Ports (Very Important Concept)

A **port** identifies a **specific process on a computer**.

Think of it as:

```
IP address → machine
Port → application
```

Example:

```
192.168.1.10:443
```

Meaning:

```
Machine 192.168.1.10
Application listening on port 443
```

---

### Well-known Ports

| Port | Service |
| ---- | ------- |
| 22   | SSH     |
| 25   | SMTP    |
| 53   | DNS     |
| 80   | HTTP    |
| 443  | HTTPS   |
| 3306 | MySQL   |

---

# 5. IPv4 (Internet Protocol Version 4)

IPv4 uses **32-bit addresses**.

Format:

```
192.168.1.1
```

Total addresses:

```
2^32 = 4.3 billion
```

---

# 6. Why IPv4 Is Not Fully Exhausted

Technically **IPv4 is exhausted**, but we still use it due to:

### 1 NAT

Network Address Translation

One public IP serves many devices.

Example:

```
Public IP
49.204.50.1
```

Used by:

```
100 devices in home network
```

Private IPs:

```
192.168.x.x
10.x.x.x
172.16.x.x
```

---

### 2 Private Addressing

Private ranges:

```
10.0.0.0 – 10.255.255.255
172.16.0.0 – 172.31.255.255
192.168.0.0 – 192.168.255.255
```

Used internally.

---

### 3 CIDR

Classless Inter-Domain Routing

Efficient IP allocation.

Example:

```
192.168.1.0/24
```

---

# 7. IPv6

IPv6 uses **128-bit addresses**.

Example:

```
2001:0db8:85a3:0000:0000:8a2e:0370:7334
```

Total addresses:

```
2^128
```

Which is:

```
340 undecillion addresses
```

Advantages:

```
Huge address space
Better routing
No NAT required
Built-in security
```

---

# 8. Subnetting (Important for DevOps)

Subnetting divides a network into **smaller networks**.

Example:

```
192.168.1.0/24
```

Means:

```
24 bits network
8 bits host
```

Hosts available:

```
2^8 = 256
```

Usable:

```
254
```

Subnet mask:

```
255.255.255.0
```

---

Example smaller subnet:

```
192.168.1.0/26
```

Hosts:

```
64
```

Used for **VPC network design**.

---

# 9. VPC (Virtual Private Cloud)

A **VPC** is an isolated virtual network in cloud.

Example providers:

* Amazon Web Services
* Google Cloud
* Microsoft Azure

Example VPC:

```
10.0.0.0/16
```

Inside VPC you create:

```
Subnets
Route tables
Gateways
Security groups
```

Example architecture:

```
VPC
│
├── Public Subnet
│      ├── Load Balancer
│
├── Private Subnet
│      ├── Application Servers
│
└── Database Subnet
       └── DB Servers
```

---

# 10. VPN (Virtual Private Network)

Virtual Private Network creates a **secure encrypted tunnel over internet**.

Example:

```
Laptop → VPN → Company network
```

Encryption protocols:

* IPsec
* OpenVPN
* WireGuard

---

### Types of VPN

1️⃣ Site-to-Site VPN

```
Office ↔ Cloud
```

2️⃣ Client VPN

```
Laptop → Company network
```

3️⃣ Remote access VPN

```
Employee → company servers
```

---

# 11. Example: Cloud Architecture

Typical **DevOps network**:

```
User
 │
Internet
 │
Cloudflare CDN
 │
AWS Load Balancer
 │
VPC
 │
├── Public Subnet
│      └── Load Balancer
│
├── Private Subnet
│      └── Kubernetes Cluster
│
└── Database Subnet
       └── PostgreSQL
```

---

# 12. Key Networking Concepts DevOps Must Know

Essential topics:

```
DNS
Load Balancing
CDN
VPC
Subnets
NAT
Firewall
Routing
TLS
BGP
```

---


To truly understand networking, you must clearly understand **IP Address** and **MAC Address** because they are the **two core identifiers used for communication on the internet and local networks**.

Think of it like this:

```
MAC Address → Identity of the physical device
IP Address  → Logical location of the device in a network
```

Both work together to move data **from one device anywhere on earth to another device**.

---

# 1. MAC Address (Media Access Control Address)

## Definition

A **MAC address** is a **unique hardware identifier assigned to a network interface card (NIC)**.

The standard is defined by the **Institute of Electrical and Electronics Engineers**.

Every device with networking capability has a MAC address:

Examples:

* Laptop
* Phone
* Router
* Printer
* Server
* Smart TV

---

## Example MAC Address

```
00:1A:2B:3C:4D:5E
```

Format:

```
6 bytes (48 bits)
```

Each pair is **1 byte (8 bits)**.

```
00 1A 2B 3C 4D 5E
```

Binary representation:

```
00000000 00011010 00101011 00111100 01001101 01011110
```

Total size:

```
48 bits
```

Possible addresses:

```
2^48 ≈ 281 trillion
```

---

## Structure of MAC Address

A MAC address has two parts.

```
OUI + Device Identifier
```

### 1. OUI (Organizationally Unique Identifier)

First **24 bits**.

Assigned to manufacturers by IEEE.

Example:

```
00:1A:2B
```

This identifies the company that made the device.

Examples:

| Company             | OUI Example |
| ------------------- | ----------- |
| Apple               | F0:18:98    |
| Dell                | 00:14:22    |
| Samsung Electronics | 28:39:26    |

---

### 2. Device Identifier

Last **24 bits**.

Example:

```
3C:4D:5E
```

Assigned by manufacturer.

---

## MAC Address Types

### Unicast

Communication to **one device**.

```
PC → Router
```

---

### Broadcast

Address:

```
FF:FF:FF:FF:FF:FF
```

Sent to **all devices in LAN**.

Example:

ARP request.

---

### Multicast

Sent to **group of devices**.

Used in:

* IPTV
* streaming

---

## Where MAC Address Is Used

MAC address works at:

```
OSI Layer 2 → Data Link Layer
```

Used inside:

```
LAN (Local networks)
```

Devices using MAC addresses:

```
Switches
Network Interface Cards
```

---

## How Switch Uses MAC Address

Switch maintains a **MAC Address Table**.

Example:

| MAC Address       | Port   |
| ----------------- | ------ |
| 00:1A:2B:3C:4D:5E | Port 1 |
| 02:7B:44:21:AA:09 | Port 2 |

When packet arrives:

```
Destination MAC → switch forwards to correct port
```

---

# 2. IP Address (Internet Protocol Address)

An **IP address** identifies a device **logically on a network**.

It is defined by the **Internet Engineering Task Force** in the **Internet Protocol**.

IP addresses allow communication across **different networks**.

---

## Example IPv4 Address

```
192.168.1.10
```

IPv4 size:

```
32 bits
```

Binary:

```
11000000.10101000.00000001.00001010
```

Total addresses:

```
2^32 = 4.3 billion
```

---

## Structure of IPv4

An IP address has two parts.

```
Network Portion + Host Portion
```

Example:

```
192.168.1.10/24
```

Meaning:

```
Network → 192.168.1
Host → 10
```

---

## Public vs Private IP

### Private IP

Used inside local networks.

Ranges:

```
10.0.0.0 – 10.255.255.255
172.16.0.0 – 172.31.255.255
192.168.0.0 – 192.168.255.255
```

Example:

```
192.168.1.10
```

---

### Public IP

Used on the internet.

Example:

```
142.250.183.14
```

This belongs to **Google**.

Assigned by:

```
ISPs
```

---

# 3. IPv6 (Next Generation IP)

IPv6 was introduced to solve IPv4 exhaustion.

Example:

```
2001:0db8:85a3:0000:0000:8a2e:0370:7334
```

Size:

```
128 bits
```

Total addresses:

```
2^128
```

Which equals:

```
340 undecillion addresses
```

Practically unlimited.

---

# 4. Difference Between IP and MAC

| Feature     | MAC Address     | IP Address     |
| ----------- | --------------- | -------------- |
| Type        | Physical        | Logical        |
| Layer       | Data Link Layer | Network Layer  |
| Size        | 48 bits         | 32 bits (IPv4) |
| Scope       | Local Network   | Global Network |
| Assigned By | Manufacturer    | ISP / Network  |

---

# 5. How IP and MAC Work Together

This is the **most important networking concept**.

Example:

```
Laptop → Router
```

Laptop knows:

```
Destination IP
```

But to send data on LAN it needs:

```
Destination MAC
```

This is solved using:

Address Resolution Protocol

---

# 6. ARP (Address Resolution Protocol)

ARP maps:

```
IP Address → MAC Address
```

Example scenario.

Your PC wants to send data to:

```
192.168.1.1
```

Steps:

### Step 1

PC sends broadcast:

```
Who has 192.168.1.1?
```

---

### Step 2

Router replies:

```
192.168.1.1 → MAC 00:14:22:01:23:45
```

---

### Step 3

PC stores it in:

```
ARP cache
```

Now packets can be sent.

---

# 7. Packet Transmission Example

Suppose your laptop:

```
IP 192.168.1.10
MAC A1:B2:C3:D4:E5:F6
```

Router:

```
IP 192.168.1.1
MAC 00:14:22:01:23:45
```

Packet structure:

```
Ethernet Frame
│
├── Destination MAC
├── Source MAC
├── IP Packet
```

Inside IP packet:

```
Source IP
Destination IP
Data
```

---

# 8. Real Internet Example

You open:

```
youtube.com
```

Flow:

1️⃣ DNS resolves

```
youtube.com → 142.250.183.14
```

2️⃣ Your PC sends packet to router

```
Destination IP → Google server
Destination MAC → Router
```

3️⃣ Router forwards packet across internet.

Routers only look at:

```
IP addresses
```

Switches only look at:

```
MAC addresses
```

---

# 9. Key Rule to Remember

```
MAC Address → used inside LAN
IP Address  → used across networks
```

So packet moves like this:

```
Laptop → Switch → Router → ISP → Internet → Server
```

MAC changes at every hop.

IP stays same.

---

# 10. Real Packet Structure

```
Application Data
↓
TCP Segment
↓
IP Packet
↓
Ethernet Frame
↓
Bits on wire
```

Encapsulation process.

---
