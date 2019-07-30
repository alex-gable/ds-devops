
###MongoDB
Install MongoDB
```
sudo apt-get install mongodb-clients
```
Get the official Mongo Docker image.
```
mkdir ~/tmp/data
sudo docker run -d -p 27017:27017 -v ~/tmp/data:/data/db mongo
```

docker run -d -p 27017:27107 -v ~/data:/data/db mongo does 3 main things:
-d tells docker to run the container as a daemon, which is the mode that'll you want to use for server containers.
-p 27017:27107 maps the port 27017 of the container to the port 27017 of the host. The syntax is -p HOST_PORT:CONTAINER_PORT.
-v ~/data:/data/db maps the /data/db directory of the container to the ~/data directory on the host. This is called a data volume, the principal mechanism to import and export data with your docker container.
How do you know which port(s) the container expose and which directory the container uses to store data? What I did was simply reading the Dockerfile. Look for the VOLUME command to know what directory the container uses for its data. The EXPOSE command tells you which network port(s) the container listens on.

# Change mydb to the name of the actual database
```
mongo localhost/mydb
db.createCollection('cities')
db.cities.insert({ name: 'New York', country: 'USA' })
db.cities.insert({ name: 'Paris', country: 'France' })
db.cities.find()
```



### dashboards

Dockerfile
```
FROM python:3.6

USER root

WORKDIR /app

ADD . /app

RUN pip install --trusted-host pypi.python.org -r requirements.txt

EXPOSE 80

ENV NAME World

CMD ["python", "app.py"]
```

App
```
import dash
import dash_core_components as dcc
import dash_html_components as html
import flask

external_stylesheets = ['https://codepen.io/chriddyp/pen/bWLwgP.css']

server = flask.Flask(__name__)
app = dash.Dash(__name__, server=server,external_stylesheets=external_stylesheets)
app.config.suppress_callback_exceptions = True


app.layout = html.Div(children=[
    html.H1(children='Hello Dash'),

    html.Div(children='''
        Dash: A web application framework for Python.
    '''),

    dcc.Graph(
        id='example-graph',
        figure={
            'data': [
                {'x': [1, 2, 3], 'y': [4, 1, 2], 'type': 'bar', 'name': 'SF'},
                {'x': [1, 2, 3], 'y': [2, 4, 5], 'type': 'bar', 'name': u'Montréal'},
            ],
            'layout': {
                'title': 'Dash Data Visualization'
            }
        }
    )
    ])

    if __name__ == '__main__':
        app.run_server(port=8050)
```
Expose port 8050 not 80 since that is the port you set when you run the app.

Then
```
docker run -p 8050:8050 my_image_name
```
