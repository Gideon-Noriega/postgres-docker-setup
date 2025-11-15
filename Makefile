.PHONY: up down logs backup restore

up:
	docker-compose up -d

down:
	docker-compose down

logs:
	docker-compose logs -f postgres

backup:
	docker exec postgres_prod pg_dump -U postgres warehouse > backup_$(shell date +%Y%m%d_%H%M%S).sql

restore:
	@read -p "Enter backup file path: " file; \
	docker exec -i postgres_prod psql -U postgres warehouse < $$file

status:
	docker-compose ps