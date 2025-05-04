
# CodeBay Protocol v0.1

**Status**: Draft  
**Maintainer**: CodeBay Foundation  
**Purpose**: To establish a verifiable trust protocol for certifying AI agent-ready websites, APIs, and services.  
**Version**: 0.1  
**License**: MIT (Open Specification)

---

## 🧭 Overview

The CodeBay Protocol defines a standard for certifying that a website, platform, or API is ready to safely interact with AI agents. It introduces:

- Certification levels (Gold / Purple)
- The CBY Number system (on-chain issuance)
- Live agent-readiness scoring (off-chain enforcement)
- A compliance revocation mechanism
- A verifiable public registry

It complements **A2A (Agent-to-Agent)** and **MCP (Model Context Protocol)** by introducing the third critical layer: **Trust and Safety**.

---

## 🟪 Certification Tiers

### 🥇 Gold Certification (Baseline)

> Focus: Protocol-level interoperability

A site, agent, or endpoint certified as **Gold** meets the following minimum requirements:

- ✅ Supports **Model Context Protocol (MCP)**  
- ✅ Enables **Agent-to-Agent (A2A)** compatibility  
- ✅ Presents structured data using **schema.org**  
- ✅ Offers valid, functional API endpoints  
- ✅ Includes clear licensing metadata for AI use

Gold indicates that a system is **machine-readable**, **compliant with agentic standards**, and capable of structured participation in the modular web.

---

### 🟪 Purple Certification (Highest Tier)

> Focus: Operational readiness, modular output, and agent-grade trust

Purple certification represents the highest level of compliance, suitable for platforms or services operating in live agentic environments. It includes all Gold requirements, plus:

- ✅ Real-time AI agent compatibility  
- ✅ Uptime and response time SLA (e.g. 99.5% uptime, sub-1s latency)  
- ✅ Transparent licensing for agent usage (e.g., JSON license manifest)  
- ✅ Verifiable **modular** or **composable** outputs (e.g., structured product flows, reusable agent tasks)

Purple is designed for **agent-facing products**, **autonomous systems**, and **platforms like Frohe** that require high-trust, production-grade performance.

---

## 🔐 CBY Number (Certification ID)

A CBY Number is a unique **alphanumeric identifier** assigned to each certified entity:

```
CBY XXXXX-XXXXX
```

Example: `CBY 7FJ9X-KL3P2`

- Randomly generated at certification  
- Supports over **3.6 quadrillion unique IDs**  
- Stored on-chain for timestamped proof of issuance  
- Resolves to metadata (domain, tier, issued time, license manifest hash)  
- Must be verified via CodeBayChecker.online before use  
- Automatically invalidated if compliance fails

---

## ⚙️ Protocol Architecture

**Hybrid Model**:  
- **On-chain**: CBY Number issuance + metadata hash  
- **Off-chain**: Real-time AI readiness scoring, SLA monitoring, and revocation enforcement

This architecture ensures **speed**, **scalability**, and **security** in agent environments.

---

## 📤 Certification Flow

1. **Submit**: Site submits to `codebaychecker.online`  
2. **Scan**: Off-chain validators test:
   - Structured data, API compliance
   - Licensing metadata
   - MCP + A2A compatibility
   - Performance metrics (latency, uptime)
   - Output modularity
3. **Score**: Site receives a dynamic **AI Readiness Score** (0–100)
4. **Certify**:
   - Score ≥ 80 → Certification granted
   - Score < 80 → Denied or downgraded
5. **Mint**: CBY Number issued on-chain
6. **Display**: Certified entity embeds badge + CBY reference

---

## 📉 Auto-Revocation Logic

- CodeBay Checker re-evaluates entities on a rolling basis or on request  
- If the AI Readiness Score falls below minimum threshold:
  - Certification becomes **invalid**
  - Public registry marks CBY as **revoked**
  - On-chain record remains for transparency

---

## 📮 Public APIs

### `GET /certification/:domain`

Returns:

```json
{
  "domain": "example.com",
  "cby_id": "CBY 7FJ9X-KL3P2",
  "score": 92,
  "tier": "Purple",
  "active": true,
  "expires": "2026-05-04",
  "metadata": {
    "schema_compliance": true,
    "mcp": true,
    "a2a": true,
    "agent_ready": true,
    "modular_outputs": true,
    "license": "agent-standard.json"
  }
}
```

---

### `POST /scan`

Input:

```json
{
  "domain": "example.com"
}
```

Returns readiness score, compliance notes, and certification eligibility.

---

## ⛓ On-Chain Structure (Clarity Smart Contract)

```clarity
(define-map certification
  { id: uint }
  {
    domain: (buff 64),
    issued: uint,
    tier: (string-ascii 10),
    metadata_hash: (buff 32),
    active: bool
  }
)
```

---

## 🧠 Use Cases

- **Agent Systems** (like Frohe) can verify CBY status before executing flows  
- **Search Engines** can prioritize certified domains in agent-based queries  
- **APIs & Platforms** can use CBY as a trust layer before integration  
- **End-users** can verify that a platform is transparent, licensed, and agent-ready

---

## 🚧 Planned Extensions (v0.2+)

- Agent Registry (CBY for agents, not just websites)  
- Trust Score based on uptime, agent usage, and error rate  
- Community voting + attestation model  
- Royalty logic for licensed modular outputs  
- Badge registry and style guide

---

## 📘 License & Contribution

CodeBay Protocol is licensed under the MIT License and maintained by the CodeBay Foundation. Contributions are welcome via GitHub or public RFC process.
