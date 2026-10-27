# AI-Powered SQL Assistant

An AI-powered assistant that allows users to ask questions about business data in natural language and receive answers generated from a MySQL database.

## Overview

This project uses a local large language model (LLM) and n8n to translate natural-language questions into SQL queries, execute them against a demo MySQL database, and summarize the results.

The goal is to make business data easier to access without requiring users to write SQL manually.

## Architecture

**User → n8n AI Agent → Ollama LLM → MySQL → Results**

- **n8n:** Workflow automation and AI agent orchestration
- **Ollama:** Runs the language model locally
- **MySQL:** Stores demo customer and transaction data
- **SQL:** Retrieves the requested information from the database

## Database Schema

### customers
- `customer_id`
- `customer_name`
- `city`
- `segment`
- `registration_date`

### transactions
- `transaction_id`
- `customer_id`
- `transaction_date`
- `amount`
- `status`

The `transactions.customer_id` column references `customers.customer_id`.

## Example Questions

- How many customers are registered in each city?
- What is the total transaction amount by city?
- Show the number of transactions by status.
- Which customers have the highest total transaction amount?
- Show monthly transaction totals.

## Prerequisites

- Docker Desktop
- n8n
- MySQL
- Ollama
- A compatible Ollama model downloaded locally

## Setup

1. Create the demo database and tables using `database/schema.sql`.
2. Optionally load fictional records from `database/sample_data.sql`.
3. Install and start Ollama, then download a compatible model.
4. Start n8n and import `n8n/workflow.json`.
5. Configure the Ollama and MySQL connections in n8n.
6. Test the workflow using one of the example questions.

Use your own local credentials and connection settings. Never commit passwords, tokens, or private connection details to GitHub.

## Security

- Use a dedicated, read-only MySQL account for the AI workflow.
- Allow only the SQL operations required by the application, ideally `SELECT`.
- Validate generated SQL before execution.
- Do not use real customer or confidential business data in the demo.
- Keep credentials outside the exported workflow and source control.

## Limitations

LLM-generated SQL may be incorrect. Validate query results and restrict database permissions before using this project with important data.

## Future Improvements

- Add a web-based chat interface.
- Add SQL validation and query restrictions.
- Display query results as tables and charts.
- Add query history and error handling.
- Support more databases and business datasets.

## License

Choose a license before making the repository public. For example, the MIT License allows broad reuse with attribution.

