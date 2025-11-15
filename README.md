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

## Production Features

- PostgreSQL 17 (latest)
- Persistent volumes
- Health checks
- Optimized memory settings
- Comprehensive logging
- Auto-restart policy

## Version Upgrade

When upgrading major versions, remove old data:
```bash
docker compose down -v
docker compose up -d
```