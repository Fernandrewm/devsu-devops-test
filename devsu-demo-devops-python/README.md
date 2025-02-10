# Demo Devops Python

This is a simple application to be used in the technical test of DevOps.


## Getting Started

### Prerequisites

- Python 3.11.3
- PostgreSQL 17.2
- Docker and Docker Compose.

### Installation with Docker
To execute the application with docker, ensure you have docker and docker compose installed.

1. Create a `.env` file in the root of the application with the following variables:
```bash
DJANGO_SECRET_KEY=your_secret_key
DATABASE_NAME=your_database_name
DATABASE_USER=your_database_user
DATABASE_PASSWORD=your_database_password
DATABASE_HOST=your_database_host
DATABASE_PORT=your_database_port
```

2. Build and run the container:
```bash
docker-compose up --build
```

3. Access the application at `http://localhost:8000/api/`

4. To stop the container, run:
```bash
docker-compose down
```

### Database

The project uses PostgreSQL as the database.

### Development
For format the code, you can use the following command:
```bash
./format_code.sh
```

This script will install and execute:
- Black to format the code.
- Isort to sort the imports.

## Usage

To run tests you can use this command.

```bash
py manage.py test
```

To run locally the project you can use this command.

```bash
py manage.py runserver
```

Open http://localhost:8000/api/ with your browser to see the result.


#### Create User

To create a user, the endpoint **/api/users/** must be consumed with the following parameters:

```bash
  Method: POST
```

```json
{
    "dni": "dni",
    "name": "name"
}
```

If the response is successful, the service will return an HTTP Status 200 and a message with the following structure:

```json
{
    "id": 1,
    "dni": "dni",
    "name": "name"
}
```

If the response is unsuccessful, we will receive status 400 and the following message:

```json
{
    "detail": "error"
}
```

#### Get Users

To get all users, the endpoint **/api/users** must be consumed with the following parameters:

```bash
  Method: GET
```

If the response is successful, the service will return an HTTP Status 200 and a message with the following structure:

```json
[
    {
        "id": 1,
        "dni": "dni",
        "name": "name"
    }
]
```

#### Get User

To get an user, the endpoint **/api/users/<id>** must be consumed with the following parameters:

```bash
  Method: GET
```

If the response is successful, the service will return an HTTP Status 200 and a message with the following structure:

```json
{
    "id": 1,
    "dni": "dni",
    "name": "name"
}
```

If the user id does not exist, we will receive status 404 and the following message:

```json
{
    "detail": "Not found."
}
```

## License

Copyright © 2023 Devsu. All rights reserved.
