docker pull timescale/timescaledb-ha:pg16

docker run -d --name timescaledb -p 5432:5432 -e POSTGRES_PASSWORD=password timescale/timescaledb-ha:pg16

connectionString: "postgres://postgres:password@localhost:5432/postgres",



