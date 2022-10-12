# File based in https://gist.github.com/magopian/4077998

.PHONY: all help translate test clean update compass collect rebuild

SETTINGS={{ project_name }}.settings
TEST_SETTINGS={{ project_name }}.test_settings
MANAGE=code/manage.py

# target: runserver - Execute default server
runserver:
	@python3 $(MANAGE) runserver

# target: app - create new app django
app:
	@python3 $(MANAGE) startapp $(app_name)

# target: migrate - run migrate django
migrate:
	@python3 $(MANAGE) migrate

# target: makemigration - run makemigrations django
makemigration:
	@python3 $(MANAGE) makemigrations

# target: all - Default target. Does nothing.
all:
	@echo "Hello $(LOGNAME), nothing to do by default"
	@echo "Try 'make help'"

# target: help - Display callable targets.
help:
	@egrep "^# target:" [Mm]akefile

# target: translate - calls the "makemessages" django command
translate:
	cd {{ project_name }} && django-admin.py makemessages --settings=$(SETTINGS) -i "site-static/*" -a --no-location

# target: test - calls the "test" django command
test:
	django-admin.py test --settings=$(TEST_SETTINGS)

# target: clean - remove all ".pyc" files
clean:
	django-admin.py clean_pyc --settings=$(SETTINGS)

# target: update - install (and update) pip requirements
update:
	pip install -U -r requirements.pip

# target: compass - compass compile all scss files
compass:
	cd {{ project_name }}/compass && compass compile

# target: collect - calls the "collectstatic" django command
collect:
	python3 $(MANAGE) collectstatic  --noinput

# target: build - call docker compose build
build:
	@docker-compose -f  compose.yml build --pull
# target: up - call docker compose up
up:
	@docker-compose up