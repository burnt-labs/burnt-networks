clean:
	rm -rvf ".docker/home/data"/*
	rm -rvf ".docker/home/config"/*
	rm -rvf ".docker/home/keyring"*

hash:
	docker compose up generate-hashes
verify:
	docker compose up verify-hashes
validate:
	docker compose up validate-genesis

gentx:
	docker compose up gentx
	docker compose up generate-hashes
	docker compose up verify-hashes

account:
	docker compose up add-genesis-account

collect:
	docker compose up collect-gentxs
	docker compose up generate-hashes
	docker compose up verify-hashes
