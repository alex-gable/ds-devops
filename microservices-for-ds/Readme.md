

# Microservices for Data science

Microservices-based application comprises of numerous tiny independent services that are integrated with each other. While these tiny individual services may be simple, there is a significant complexity that arises from their interaction in an effort to orchestrate an application or workflow-
Docker is the go-to platform for deploying microservices.

Advantages of Docker:
*Reproducibility*
With Docker, you ensure that your software artifact (application, data analysis, predictive model etc.) runs on all docker run-time environments. Your shipments are more robust, as the container contains everything that’s needed to run your artifact. You are not distributing only the code, but also the environment.
*Consistency*
Docker equips you with one uniform and consistent run-time environment for all kinds of software artifacts. It reduces the time for system administration and lets you focus on your core work. You might know Anaconda environments; Docker is something similar for the whole software ecosystem.
*Traceability*
a.) Version controlling of Docker container code
A Docker container is built from a script which is a human-readable summary of the necessary software dependencies and environment. This script can be version controlled. The script is entirely traceable this way.
b.) Uniform distribution environment for all artifacts
Docker containers can be stored in a repository within your organization. You keep the whole version history this way.
*Portability*
Docker containers can easily be ported from one docker environment to another. Docker Swarm (or Kubernetes) lets you scale applications automatically. Costs for system administration and operation are reduced this way.
However, what are the use-cases for Docker in the data science universe? I will concentrate on data science OSEMN process:

##What can we containerize and expose as a REST service.

### Data Ingest
From surveys, clinical trials, web scraping, scientific experiments, corporate applications or simulations. Typically data engineers are dealing with the data, but also other stakeholders are involved, which leads to a wide diversity of database systems and programming languages.
Web scraping: Python application with low-level dependencies to Selenium’s Chrome driver and a Postgres database is packed as a multi-container application with Docker Compose
Labelling images: Lean web application with vue.js, a NodeJS backend and a MongoDB is used to label images
Surveys: Small static microsite build by the marketing team in plain HTML with an integrated SurveyMonkey form
Corporate application: Banking web application implemented in AngularJS and Java in the backend with an Oracle database produces valuable banking data from the customers
Computer simulation: Simulation programmed in C++ stores its results in JSON on Amazon S3
Asynchronous data streams: Car Sensors are sending their data to Kafka, which is distributing the data within the company

### Data Cleaning and Aggregation

Aggregation: An Application in Java gets the data from Kafka streams, does aggregations on the low-level data and stores it to an Oracle database
Data analysts clean and preprocess the data from a corporate web application as preparation for answering a business question with an RMarkdown Notebook, which they want to share with the management
A Machine Learning Engineer combines data from different data sources, cleans and preprocesses data for a predictive model in a Jupyter Notebook
Data is combined, cleaned, aggregated and preprocessed and persisted for high-level interactive dashboards in Tableau


### Data Exploration

Data Analysts are creating Jupyter or RMarkdown Notebooks to answer a question they need to share with everyone interested in it.
Data Analysts cluster the companies customers into new segments which are persisted in a Customer Segment Database in MySQL
Data Analysts build interactive web applications for high-level data exploring for interested stakeholders in RShiny, Dash, Tableau or Kibana. This way managers can find patterns on their own (danger zone!).

### Model Building
The complete training process for a neural network for object detection in images is isolated to a Docker container that is run on Azure, AWS or Google Cloud
A Keras model is imported into DeepLearning4J and published as a Java Microservice due to performance issues with Python

### Interpretation and Deployment
Microsites to tell the data story
A predictive machine learning model in Python is released as microservice
A REST microservice in Java with aggregated data is released to paying B2B customers
A product recommender Service in Python is integrated into the company’s web application
Data-driven stories are published on the company’s Tableau Server and shared for internal and external use
Data storytellers in the content management team share exciting insights from data analysts on a static Jekyll website
