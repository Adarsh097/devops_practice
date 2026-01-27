## Kubernetes | part-3

1. kubectl delete -f . -> to delete everything created from .yml files
2. kubectl get ns
3. kubectl get all -n ingress-nginx

![alt text](image-8.png)f

# Secrets and ConfigMaps

![alt text](image-9.png)

Great question — this is one of those **core Kubernetes concepts** that quietly powers almost every real production setup. Let’s break it down cleanly and practically 👇

---

## Why do we even need ConfigMaps & Secrets? (The Big Picture)

In Kubernetes, **applications should be portable and environment-agnostic**.

That means:

* Same Docker image runs in **dev, staging, prod**
* Only **configuration changes**, not code

So we separate:

* **Code** → inside container image
* **Configuration & credentials** → provided at runtime

That’s where **ConfigMaps** and **Secrets** come in.

---

# 1️⃣ ConfigMaps

### 🔹 What is a ConfigMap?

A **ConfigMap** stores **non-sensitive configuration data** in key–value format.

Examples:

* Environment variables
* App config files
* Feature flags
* URLs, ports, log levels

---

### 🔹 Why ConfigMaps are needed

Without ConfigMaps:

* You hardcode configs into the image ❌
* Need to rebuild image for every env ❌
* Bad DevOps practice ❌

With ConfigMaps:

* Change config **without rebuilding images**
* Same image → different behavior per environment
* Cleaner, safer, scalable

---

### 🔹 Common use cases

```text
APP_ENV=production
LOG_LEVEL=debug
DB_HOST=postgres-service
REDIS_URL=redis:6379
```

---

### 🔹 Example ConfigMap

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: app-config
data:
  APP_ENV: production
  LOG_LEVEL: info
```

---

### 🔹 How Pods use ConfigMaps

#### 1️⃣ As Environment Variables

```yaml
envFrom:
- configMapRef:
    name: app-config
```

#### 2️⃣ As Individual Variables

```yaml
env:
- name: APP_ENV
  valueFrom:
    configMapKeyRef:
      name: app-config
      key: APP_ENV
```

#### 3️⃣ As Files (Very common)

```yaml
volumeMounts:
- name: config-volume
  mountPath: /app/config

volumes:
- name: config-volume
  configMap:
    name: app-config
```

---

### 🔹 Key traits of ConfigMaps

| Feature              | ConfigMap         |
| -------------------- | ----------------- |
| Sensitive data       | ❌ No              |
| Stored in etcd       | ✅ Plain text      |
| Readable via kubectl | ✅                 |
| Used for             | App configuration |

---

# 2️⃣ Secrets

### 🔹 What is a Secret?

A **Secret** stores **sensitive information** securely.

Examples:

* Database passwords
* API keys
* OAuth tokens
* TLS certificates
* Docker registry creds

---

### 🔹 Why Secrets are needed

If you store secrets in:

* GitHub ❌
* Docker image ❌
* ConfigMap ❌

You risk:

* Credential leaks
* Security breaches
* Compliance failures

Secrets help:

* Keep credentials out of code
* Control access via RBAC
* Rotate credentials safely

---

### 🔹 Example Secret

```yaml
apiVersion: v1
kind: Secret
metadata:
  name: db-secret
type: Opaque
data:
  DB_PASSWORD: cGFzc3dvcmQ=   # base64 encoded
```

> ⚠️ Base64 ≠ encryption.
> Security comes from **RBAC + etcd encryption + access control**.

---

### 🔹 How Pods use Secrets

#### 1️⃣ As Environment Variables

```yaml
env:
- name: DB_PASSWORD
  valueFrom:
    secretKeyRef:
      name: db-secret
      key: DB_PASSWORD
```

#### 2️⃣ As Files (recommended)

```yaml
volumeMounts:
- name: secret-volume
  mountPath: /secrets

volumes:
- name: secret-volume
  secret:
    secretName: db-secret
```

---

### 🔹 Key traits of Secrets

| Feature        | Secret            |
| -------------- | ----------------- |
| Sensitive data | ✅ Yes             |
| Stored in etcd | ✅ Base64          |
| RBAC protected | ✅                 |
| Used for       | Passwords, tokens |

---

# 3️⃣ ConfigMap vs Secret (Interview Gold ✨)

| Aspect      | ConfigMap      | Secret          |
| ----------- | -------------- | --------------- |
| Data type   | Non-sensitive  | Sensitive       |
| Encoding    | Plain text     | Base64          |
| Security    | Low            | High            |
| Git storage | Okay           | ❌ Avoid         |
| Example     | URLs, env vars | Passwords, keys |

---

# 4️⃣ Real-World Example (Production Mindset)

**Backend API Pod**

* ConfigMap:

  * APP_ENV
  * LOG_LEVEL
  * SERVICE_URL
* Secret:

  * DB_PASSWORD
  * JWT_SECRET
  * STRIPE_API_KEY

This lets you:

* Deploy same image everywhere
* Rotate secrets without redeploying code
* Lock down access using RBAC

---

# 5️⃣ Why this matters in production 🚀

Without ConfigMaps & Secrets:

* Hardcoded values
* Frequent rebuilds
* Security risks
* Poor scalability

With them:

* Clean separation of concerns
* Secure credential management
* DevOps & cloud-native best practice
* Easier CI/CD pipelines

---

# Mysql deployment
4. cd mysql ->  vim deployment.yml

```

kind: Deployment
apiVersion: apps/v1

metadata: 
  name: mysql-dep
  namespace: mysql
  labels:
    app: mysql
spec:
  replicas: 2
  selector:
    matchLabels:
      app: mysql

  template:
    metadata:
      name: mysql-pod
      namespace: mysql
      labels:
        app: mysql
    spec:
      containers:
        - name: mysql
          image: mysql:latest
          ports:
            - containerPort: 3306
          env:
            - name: MYSQL_ROOT_PASSWORD
              valueFrom: 
                secretKeyRef: 
                    name: mysql-secret
                    key: password

```
5. vim namespace.yml

```
kind: Namespace
apiVersion: v1

metadata:
  name: mysql

```

6. kubectl apply -f namespace.yml
7. kubectl get ns
8. kubectl apply -f deployment.yml
9. kubectl get all -n mysql
10. You will get error -> describe the error that you got
11. kubectl describe pod/mysql-dep-5bf64bb488-z4trt  -n mysql
12. kubectl logs pod/mysql-dep-5bf64bb488-z4trt  -n mysql

13. On seeing the logs after noticing that container has failed afer successfully pulling the image after 'pod describe' -> permission for password is asked. So, we create secrets.yml

14. vim secrets.yml
```
kind: Secret
apiVersion: v1

metadata:
    name: mysql-secret
    namespace: mysql

type: opaque
data:
    password: QWRtaW4=


```
15. echo -n "Admin" | base64
16. kubectl apply -f secrets.yml
17. kubectl get secret -n mysql
18. '>' fileName -> to clear the content of file
19. kubectl delete -f deployment.yml 
20.  kubectl apply -f deployment.yml 
21. Access the pod for mysql

