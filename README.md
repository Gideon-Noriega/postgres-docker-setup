# PostgreSQL Production Docker Setup

Production-ready PostgreSQL container with optimized configuration and persistent storage.

## Quick Start

1. **Create .env file**:
   ```bash
   cat > .env << EOF
POSTGRES_DB=warehouse
POSTGRES_USER=postgres
POSTGRES_PASSWORD=your_secure_password_here
POSTGRES_PORT=5432
EOF
   ```

2. **Start container**:
   ```bash
   make up
   # or: docker compose up -d
   ```

3. **Connect**:
   - Host: localhost
   - Port: 5432
   - Database: warehouse
   - User: postgres

## Commands

```bash
make up      # Start container
make down    # Stop container
make logs    # View logs
make status  # Check status
make backup  # Create backup
make restore # Restore from backup
```

## Files

- `docker-compose.yml` - Container configuration
- `.env` - Environment variables
- `postgresql.conf` - Production settings
- `init/01-init.sql` - Database initialization
- `Makefile` - Management commands

## Configuration

The `postgresql.conf` file includes production-optimized settings:

**Memory Settings:**
- `shared_buffers = 256MB` - RAM for caching data pages
- `effective_cache_size = 1GB` - OS cache size estimate
- `work_mem = 4MB` - Memory per query operation

**Performance:**
- `max_connections = 200` - Concurrent connections
- `random_page_cost = 1.1` - Optimized for SSDs
- `effective_io_concurrency = 200` - Concurrent I/O operations

**Logging:**
- `log_min_duration_statement = 1000` - Log slow queries (>1s)
- `log_connections = on` - Track connections
- `log_checkpoints = on` - Monitor checkpoints

## Production Features

- PostgreSQL 17 (latest)
- Persistent volumes
- Health checks
- Optimized memory settings
- Comprehensive logging
- Auto-restart policy

## Logs

View logs using:
```bash
# Container logs
make logs

# PostgreSQL log files
docker exec postgres_prod tail -f /var/lib/postgresql/data/pgdata/log/postgresql-*.log
```

**Log locations:**
- Container: `/var/lib/postgresql/data/pgdata/log/`
- Host: `/var/lib/docker/volumes/postgres_wh_postgres_data/_data/pgdata/log/`

## Version Upgrade

When upgrading major versions, remove old data:
```bash
docker compose down -v
docker compose up -d
```