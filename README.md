<div align="center">

<a href="https://github.com/Pratham-Tomar/HealthCare-System" target="_blank">
<pre>
╔══════════════════════════════════════════════════════════════════════════════╗
║                                                                              ║
║        ██╗  ██╗███╗   ███╗███████╗                                          ║
║        ██║  ██║████╗ ████║██╔════╝                                          ║
║        ███████║██╔████╔██║███████╗                                          ║
║        ██╔══██║██║╚██╔╝██║╚════██║                                          ║
║        ██║  ██║██║ ╚═╝ ██║███████║                                          ║
║        ╚═╝  ╚═╝╚═╝     ╚═╝╚══════╝                                          ║
║                                                                              ║
║           ·  Healthcare  Management  System  ·  Spring Boot + React  ·      ║
║                                                                              ║
║              ▶  Click  anywhere  here  to  view  the  repository            ║
╚══════════════════════════════════════════════════════════════════════════════╝
</pre>
</a>

<p>
  <img src="https://img.shields.io/badge/Java-17-ED8B00?style=for-the-badge&logo=openjdk&logoColor=white" />
  <img src="https://img.shields.io/badge/Spring_Boot-3.x-6DB33F?style=for-the-badge&logo=springboot&logoColor=white" />
  <img src="https://img.shields.io/badge/React-18-61DAFB?style=for-the-badge&logo=react&logoColor=black" />
  <img src="https://img.shields.io/badge/TypeScript-5.x-3178C6?style=for-the-badge&logo=typescript&logoColor=white" />
</p>

<p>
  <img src="https://img.shields.io/badge/PostgreSQL-17-336791?style=for-the-badge&logo=postgresql&logoColor=white" />
  <img src="https://img.shields.io/badge/Architecture-Microservices-blueviolet?style=for-the-badge" />
  <img src="https://img.shields.io/badge/Security-JWT-FF6B35?style=for-the-badge&logo=jsonwebtokens&logoColor=white" />
  <img src="https://img.shields.io/badge/Redux_Toolkit-2.x-764ABC?style=for-the-badge&logo=redux&logoColor=white" />
</p>

<p><em>Built for hospitals. Designed for humans.</em></p>

<br/>

### ⚕️ Live Repository

<a href="https://github.com/Pratham-Tomar/HealthCare-System" target="_blank">
  <img src="https://img.shields.io/badge/▶%20%20VIEW%20ON%20GITHUB-%20HealthCare--System-238636?style=for-the-badge&logo=github&logoColor=white" alt="View on GitHub" />
</a>

<br/><br/>

> A full-stack Hospital Management System built on a **microservices architecture**.
> Role-based portals for Admins, Doctors, and Patients — covering appointments, records,
> pharmacy inventory, and media management, all behind a unified JWT-secured API Gateway.
>
> **No monolith. No compromise. Just clean, scalable healthcare software.**

</div>

---

## What is HMS?

HMS is a **production-grade hospital platform** where every service owns its domain. The API Gateway handles routing and JWT validation so each microservice stays lean and focused. The React frontend adapts its entire UI based on the logged-in user's role — Admin, Doctor, or Patient — with zero overlap.

---

## Features

### Admin Portal

| Feature | Description |
|:--------|:------------|
| 📊 **Dashboard** | Real-time hospital statistics and analytics |
| 👨‍⚕️ **Doctor Management** | Register, view, and manage doctor profiles |
| 🏥 **Patient Management** | Full patient record oversight |
| 📦 **Inventory Control** | Track and manage medical supplies |
| 💊 **Medicine Management** | Add, update, and monitor medicines |
| 💰 **Sales Reports** | Pharmacy sales tracking and reporting |

### Doctor Portal

| Feature | Description |
|:--------|:------------|
| 📋 **Dashboard** | Daily overview — appointments, patients, activity |
| 📅 **Appointments** | View and manage scheduled appointments |
| 🔍 **Appointment Details** | Deep-dive into individual patient visit records |
| 🗂️ **Patient Records** | Access full patient history and health data |
| 🧪 **Pharmacy Access** | View prescriptions and pharmacy info |
| 🪪 **Profile Management** | Manage personal and professional details |

### Patient Portal

| Feature | Description |
|:--------|:------------|
| 🏠 **Dashboard** | Personal health summary and upcoming visits |
| 🗓️ **Appointments** | Book, view, and manage appointments |
| 👤 **Profile** | Update personal information and medical records |

---

## Architecture

```
┌─────────────────────────────────────────────────────────────────┐
│                        React Frontend                           │
│              (TypeScript · Mantine UI · Redux Toolkit)          │
└─────────────────────────────┬───────────────────────────────────┘
                              │  HTTP / REST
                              ▼
┌─────────────────────────────────────────────────────────────────┐
│                    API Gateway  :9000                           │
│              (Spring Cloud Gateway · JWT Auth Filter)           │
└──────┬──────────┬──────────┬──────────┬──────────┬─────────────┘
       │          │          │          │          │
       ▼          ▼          ▼          ▼          ▼
  ┌────────┐ ┌─────────┐ ┌──────────┐ ┌────────┐ ┌────────┐
  │ UserMS │ │ProfileMS│ │Appoint-  │ │Pharma- │ │MediaMS │
  │ :8080  │ │ :9100   │ │  mentMS  │ │  cyMS  │ │ :9400  │
  └────────┘ └─────────┘ │  :9200   │ │ :9300  │ └────────┘
                          └──────────┘ └────────┘
       │          │          │              │
       └──────────┴──────────┴──────────────┘
                              │
                   ┌──────────▼──────────┐
                   │   Eureka Server     │
                   │   Service Registry  │
                   │       :8761         │
                   └─────────────────────┘
```

---

## Microservices

| Service | Port | Responsibility |
|:--------|:----:|:---------------|
| **Eureka Server** | `8761` | Service registry and discovery |
| **API Gateway** | `9000` | Unified entry point, routing, JWT validation |
| **UserMS** | `8080` | Authentication, registration, role management |
| **ProfileMS** | `9100` | Doctor and patient profile data |
| **AppointmentMS** | `9200` | Appointment scheduling and history |
| **PharmacyMS** | `9300` | Medicines, inventory, and sales |
| **MediaMS** | `9400` | File and media upload/storage |

---

## Tech Stack

### Backend
| Layer | Technology |
|:------|:-----------|
| Language | Java 17 |
| Framework | Spring Boot 3.x |
| Service Discovery | Spring Cloud Netflix Eureka |
| API Gateway | Spring Cloud Gateway |
| Security | Spring Security + JWT |
| ORM | Spring Data JPA / Hibernate |
| Database | PostgreSQL 17 |
| Inter-service Calls | OpenFeign |
| Build Tool | Maven |
| Utilities | Lombok |

### Frontend
| Layer | Technology |
|:------|:-----------|
| Language | TypeScript 5.x |
| Framework | React 18 |
| UI Library | Mantine UI v7 + PrimeReact |
| State Management | Redux Toolkit |
| HTTP Client | Axios |
| Icons | Tabler Icons |
| Date Utilities | Day.js |
| Styling | Tailwind CSS |

---

## Getting Started

### Prerequisites

- Java 17+
- Node.js 18+ & npm
- PostgreSQL 17
- Maven 3.8+
- Homebrew (macOS) for PostgreSQL management

### 1 — Clone the repository

```bash
git clone https://github.com/Pratham-Tomar/HealthCare-System.git
cd HealthCare-System
```

### 2 — Start all backend services

A single script boots all microservices in the correct dependency order — Eureka → Gateway → all services:

```bash
chmod +x start-hms.sh
./start-hms.sh
```

Logs for each service are written to the `logs/` directory.

### 3 — Start the frontend

```bash
cd Frontend
npm install
npm start
```

Open **http://localhost:3000** in your browser.

### 4 — Stop all services

```bash
./stop-hms.sh
```

---

## Service Endpoints

```
  Frontend App     →  http://localhost:3000
  API Gateway      →  http://localhost:9000
  Eureka Dashboard →  http://localhost:8761
  UserMS           →  http://localhost:8080
  ProfileMS        →  http://localhost:9100
  AppointmentMS    →  http://localhost:9200
  PharmacyMS       →  http://localhost:9300
  MediaMS          →  http://localhost:9400
```

---

## Project Structure

```
HMS Source/
├── Backend/
│   ├── Eureka-Server/       ← Service registry
│   ├── GatewayMS/           ← API gateway + JWT filter
│   ├── UserMS/              ← Auth & user management
│   ├── ProfileMS/           ← Doctor & patient profiles
│   ├── Appointment/         ← Appointment management
│   ├── PharmacyMS/          ← Pharmacy & inventory
│   └── media/               ← File/media service
├── Frontend/
│   └── src/
│       ├── Pages/
│       │   ├── Admin/       ← Admin portal pages
│       │   ├── Doctor/      ← Doctor portal pages
│       │   └── Patient/     ← Patient portal pages
│       ├── Components/      ← Reusable UI components
│       ├── Slices/          ← Redux state slices
│       ├── Service/         ← Axios API service layer
│       └── Routes/          ← Role-based routing
├── start-hms.sh             ← One-click backend startup
└── stop-hms.sh              ← Graceful shutdown
```

---

## Contributing

Contributions are welcome. Keep PRs focused — one feature or fix per PR.

```bash
git checkout -b feature/your-feature
# make your changes
git commit -m "feat: describe your change"
git push origin feature/your-feature
# open a Pull Request against main
```

---

<div align="center">

Built to make hospital operations faster and more effective.

<a href="https://github.com/Pratham-Tomar/HealthCare-System" target="_blank">
  <img src="https://img.shields.io/badge/▶%20%20STAR%20THIS%20REPO-HealthCare--System-ffc200?style=for-the-badge&logo=github&logoColor=black" alt="Star this repo" />
</a>

<br/><br/>

**Star this repo ⭐ if you found it useful.**

<br/>

MIT © [Pratham Tomar](https://github.com/Pratham-Tomar)

</div>
