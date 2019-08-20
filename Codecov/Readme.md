
#Codecov

## Set up locally with pytest

```
pip install codecov

pip install pytest pytest-cov

export CODECOV_TOKEN=*************

pytest --cov=./

codecov
```

This will run  the pytests and coverage report then upload the data to codecov.

##Travis integration

Add codecov to requirements-dev.txt or
```
- travis_retry pip install sphinx
```
under install:

At end of CI build run

```
coervage
```
