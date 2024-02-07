hash:
	docker compose up generate-hashes
verify:
	docker compose up verify-hashes

validate:
	docker compose up validate-genesis

gentx:
	docker compose up gentx
	docker compose up collect-gentxs
	docker compose up generate-hashes
	docker compose up verify-hashes
