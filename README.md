# Query-Craft

Query Craft is an educational tool designed to guide students how to craft SQL queries effectively. It provides interactive learning materials, examples, and practice problems to help users understand various SQL concepts and improve their query writing skills.

## Setup 

### Prerequisites

- Ensure you have Docker installed on your system.

### Installation

1. Clone the repository:

    ```bash
    git clone <repository-url>
    cd query-craft
    ```

2. Build and start the Docker containers:

    ```bash
    docker-compose up --build
    ```
3. Access the Application

- Once the application is running, you can access it by navigating to `http://localhost:<port number in docker-compose.yml file>`in your web browser.

4. Exporting the Application

- Once the docker images are built run the export-query-craft-mac.sh shell script on a MAC machine or the export-query-craft-windows.bat batch file on a windows environment.

## Technical Overview 

The application is built using a combination of Python, Flask, JavaScript, and Docker. Below is a high-level overview of how it works: 

### Backend 
* The backend is developed using Python and Flask. Flask handles the routing and serves the HTML templates to the frontend. 
* The app.py file is the main entry point of the application. 

### Frontend 
* HTML templates are in the templates directory and are rendered by Flask.
* JavaScript files in the static/js directory to handle interactive elements and query execution. 

### Docker
* The application includes a Dockerfile and a docker-compose.yml file for containerization. 
