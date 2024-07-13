
# Pokémon Marketplace Application

## Description

This application is a simple Pokémon marketplace where users can register, log in, buy, and sell Pokémon. It consists of a Rails backend API and a Vue.js frontend.

## Prerequisites

- Docker
- Docker Compose

## Getting Started

### 1. Clone the Repository

```bash
git clone <repository_url>
cd <repository_directory>
```

### 2. Set Up Environment Variables

Create a `.env` file in the root directory and add the following:

```dotenv
DATABASE_USERNAME=your_db_username
DATABASE_PASSWORD=your_db_password
```

Replace `your_db_username` and `your_db_password` with your actual database credentials.

### 3. Build and Run the Application

Use Docker Compose to build and run the application:

```bash
docker-compose up --build
```

### 4. Seed the Database

In a new terminal, run the following command to seed the database:

```bash
docker-compose exec web bundle exec rails db:seed
```

### 5. Access the Application

- **Backend API**: `http://localhost:3000`
- **Frontend**: `http://localhost:8080`

### 6. Running Tests

To run the test suite, use the following command:

```bash
docker-compose exec web bundle exec rspec
```

## Endpoints

### Public Endpoints

- `GET /`: Landing Page
- `GET /pokemons`: List all Pokémon
- `GET /pokemons/:id`: Show a specific Pokémon
- `GET /pokemons/:id/checkout`: Proceed to buy a Pokémon

### Authenticated Endpoints

- `POST /pokemons/:id/buy`: Buy a Pokémon
- `POST /pokemons/:id/sell`: Sell a Pokémon
- `GET /me`: Display the logged-in user's account
- `GET /me/add`: Show a screen to add money to the wallet
- `PATCH /me/add`: Add money to the wallet
- `GET /me/transactions`: Show all user transactions
