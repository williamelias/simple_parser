# File based in https://gist.github.com/magopian/4077998

.PHONY: all help translate test clean update compass collect rebuild

SETTINGS={{ project_name }}.settings
TEST_SETTINGS={{ project_name }}.test_settings

# target: runserver - Execute default server
runserver:
	@python3 manage.py runserver

# target: app - create new app django
app:
	@python3 manage.py startapp $(app_name)

# target: migrate - run migrate django
migrate:
	@python3 manage.py migrate

# target: makemigration - run makemigrations django
makemigration:
	@python3 manage.py makemigrations

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
	python3 manage.py collectstatic  --noinput

# target: rebuild - clean, update, compass, collect, then rebuild all data
rebuild: clean update compass collect
	python3 reset_db --settings=$(SETTINGS) --router=default --noinput
	python3 syncdb --settings=$(SETTINGS) --noinput
	python3 migrate --settings=$(SETTINGS)
	#python3 loaddata --settings=$(SETTINGS) <your fixtures here>