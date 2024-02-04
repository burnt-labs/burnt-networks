gentx:
	docker compose up gentx
	docker compose up collect-gentxs
	docker compose up generate-hashes
	docker compose up verify-hashes
