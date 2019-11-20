# SCC5968 Large Scale Analytical Data Processing

Repository for SCC5968 Large Scale Analytical Data Processing discipline @ MSc. Data Science | ICMC | USP.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Prerequisites

To run the project, install the following:

* [MySQL Server 8.0.18](https://dev.mysql.com/downloads/mysql/) - Official MySQL Server;
* [MySQL Workbench 8.0.18](https://dev.mysql.com/downloads/workbench/) - Official MySQL Integrated Development Environment.

### Deployment

To create a schema and load its data, run the setup and main sections of the following scripts:

```
database\<question>\<schema>\create-db.sql
database\<question>\<schema>\load-db.sql
```

Once created, you can run the queries on the following script:

```
database\<question>\<schema>\query-db.sql
```

## Authors

* **André Perez** - [LinkedIn](https://www.linkedin.com/in/andremarcosperez/)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details
