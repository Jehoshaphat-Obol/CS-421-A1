# Simple Student and Subject API

This project is a simple API built using Python (Django), Gunicorn, and Nginx. It provides two endpoints to retrieve student and subject information.

## Project Description

This API was developed to fulfill the requirements of a task that involved creating a basic RESTful API to manage student and subject data. The API interacts with a relational database (e.g., PostgreSQL, MySQL, or SQLite) to store and retrieve data. The API is deployed using Gunicorn as an application server and Nginx as a reverse proxy.

## Technologies Used

* **Python:** Programming language.
* **Django:** Web framework.
* **Gunicorn:** WSGI HTTP server.
* **Nginx:** Web server/reverse proxy.
* **Relational Database Management System (RDBMS):** ( SQLite).
* **Git:** Version control.
* **JSON:** Data format for API responses.

## Setup Instructions

1.  **Clone the Repository:**

    ```bash
    git clone <repository_url>
    cd <project_directory>
    ```

2.  **Create a Virtual Environment (Recommended):**

    ```bash
    python3 -m venv venv
    source venv/bin/activate  # On Linux/macOS
    venv\Scripts\activate  # On Windows
    ```

3.  **Install Dependencies:**

    ```bash
    pip install -r requirements.txt
    ```

4.  **Configure Database:**

    * Run migrations to create database tables:

        ```bash
        python manage.py makemigrations
        python manage.py migrate
        ```
    * Populate the database with sample student and subject data. You can either use Django's shell or run the following commands
        ```bash
        chmod +x ./students.sh
        chmod +x ./subjects.sh
        ./students.sh
        ./subjects.sh
        ```

5.  **Run the Django Development Server (for testing):**

    ```bash
    python manage.py runserver
    ```

    The API will be available at `http://127.0.0.1:8000/`.
6. **Basic API navigation**
    By default the API i accessible through the browserable view as seen below from the web browser.
    ![browsableAPI](./docs/image.png)
    - for GUI interaction with the API choose API (default)
        ![browsableAPI](./docs/image2.png)
    - for pure json response choose JSON or append
        ![json](./docs/image3.png)


7. **Read API documenation [here](http://ec2-13-60-162-177.eu-north-1.compute.amazonaws.com/) or visit `http://127.0.0.1:8000/` from your local development server**

## Dependencies

* Django
* Gunicorn
* psycopg2 (if using PostgreSQL) or mysqlclient (if using MySQL) or sqlite3 (if using SQLite)
* Any other required packages listed in `requirements.txt`.

## Version Control

This project uses Git for version control. Regular commits and pushes are made to track progress and milestones.
