# Tesslate Biosimilar Cortex

This repository contains the core infrastructure for the **Tesslate Biosimilar Cortex**, a self-hosted agentic platform designed for the regulatory and compliance demands of the biosimilars industry. It integrates the visual workflow of **Tesslate**, the cognitive precision of **Context Engineering**, and the auditable data foundation of **RuVector**.

## 1. Core Architecture

The platform is built on a three-tiered architecture:

| Tier | Component | Role |
| :--- | :--- | :--- |
| **1. Data Foundation** | `ruvector` | Provides the self-learning vector graph database with witness chains for cryptographic audit and RVF containers for strict tenant isolation. |
| **2. Cognitive Layer** | `Agent-Skills-for-Context-Engineering` | Manages the agent's context window, enabling high-precision reasoning through progressive disclosure and context compression. |
| **3. Orchestration** | `Tesslate Biosimilar Cortex (This Repo)` | The core platform that integrates the foundational repositories and provides the multi-tenant dashboard and API for CROs. |

## 2. Deployment & Setup

This platform is designed to be deployed in a self-hosted environment (e.g., AWS, GCP, Azure, or on-premise) to meet the data residency and compliance requirements of the life sciences industry.

### Prerequisites

*   Docker & Docker Compose
*   `git`
*   A running PostgreSQL instance

### Automated Setup

A `setup.sh` script is provided to automate the forking of the required foundational repositories and configure the environment.

```bash
# This script will:
# 1. Clone the ruvector and Agent-Skills-for-Context-Engineering repositories.
# 2. Configure the necessary environment variables.
# 3. Prepare the Docker environment.

bash setup.sh
```

### Manual Setup

1.  **Clone the Foundational Repositories**:

    ```bash
    git clone https://github.com/ruvnet/ruvector.git
    git clone https://github.com/muratcankoylan/Agent-Skills-for-Context-Engineering.git
    ```

2.  **Configure Environment**:
    Create a `.env` file and populate it with the necessary database connection strings and API keys.

3.  **Build and Run with Docker**:

    ```bash
    docker-compose up --build
    ```

## 3. Project Structure

```
.
├── docker-compose.yml
├── Dockerfile
├── README.md
├── setup.sh
├── skills/
│   ├── cmc-analyst/
│   │   └── SKILL.md
│   └── regulatory-strategist/
│       └── SKILL.md
└── src/
    ├── api/
    ├── core/
    └── main.py
```

*   **`skills/`**: Contains the specialized agent skills for the Biosimilar Cortex.
*   **`src/`**: The core platform code, including the API, multi-tenant dashboard, and integration logic.

## 4. Usage

Once deployed, the platform provides a web-based interface for CROs to:

1.  **Provision new biosimilar programs**, which spins up a new, isolated RVF container.
2.  **Upload and analyze analytical data** (e.g., SEC-HPLC, Mass Spec) through the `cmc-analyst` skill.
3.  **Perform regulatory analysis** and generate compliance reports with the `regulatory-strategist` skill.
4.  **Export audit-ready data** with embedded cryptographic proofs for FDA submissions.

## 5. Contributing

Contributions are welcome. Please open an issue to discuss your ideas or submit a pull request.
