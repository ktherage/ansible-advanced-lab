# Ansible Avancé — Lab

Exercices et "follow along" du cours Udemy
[Learn Ansible Advanced](https://www.udemy.com/course/learn-ansible-advanced/).

## Contenu

- `Dockerfile` / `compose.yaml` — deux conteneurs Ubuntu privilégiés (10.50.1.0, 10.50.1.1) servant de cibles.
- `inventory` — inventaire Ansible pointant vers ces hôtes (identifiants de lab uniquement).
- `ansible.cfg` — `host_key_checking = false` pour le lab.
- `db_and_webserver.playbook.yml` — playbook du cours.

## Utilisation

```bash
docker compose up -d --build
ansible all -m ping
ansible-playbook db_and_webserver.playbook.yml
```

Notes personnelles d'apprentissage, sans lien avec l'auteur du cours.
