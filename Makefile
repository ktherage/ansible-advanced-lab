reset:
	docker compose down --rmi local

run:
	docker compose up -d --build --wait
	ansible-playbook -i inventory playbook.yml

