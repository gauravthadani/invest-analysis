## Environment:

.PHONY: local-up
local-up: docker-up

.PHONE: docker-up
docker-up:
	@docker-compose up -d --wait

.PHONY: local-down
local-down: ## Bring down the development environment
	@docker-compose down
