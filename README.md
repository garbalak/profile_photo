# profile-photo

In server dir run:
```sh
pip install -r requirements.txt
python manage.py migrate
python manage.py createsuperuser --email admin@example.com --username admin
```
docker

In traefik\development dir run:
```sh
docker-compose up
```
In main directory run:
```sh
docker-compose up --build
```


In web dir run:
```sh
npm run build
```