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

1. **Clone the Repository:**

    ```bash
    git clone <repository_url>
    cd <project_directory>
    ```

2. **Create a Virtual Environment (Recommended):**

    ```bash
    python3 -m venv venv
    source venv/bin/activate  # On Linux/macOS
    venv\Scripts\activate  # On Windows
    ```

3. **Install Dependencies:**

    ```bash
    pip install -r requirements.txt
    ```

4. **Configure Database:**

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

5. **Run the Django Development Server (for testing):**

    ```bash
    python manage.py runserver
    ```

    The API will be available at `http://127.0.0.1:8000/`.
6. **Basic API navigation**
    By default the API i accessible through the browserable view as seen below from the web browser.
    ![browsableAPI](./docs/image.png)
    * for GUI interaction with the API choose API (default)
        ![browsableAPI](./docs/image2.png)
    * for pure json response choose JSON
        ![json](./docs/image3.png)
        or user command-line tools or postman
        ![json](./docs/image4.png)

7. **Read API documenation [here](http://ec2-13-60-162-177.eu-north-1.compute.amazonaws.com/) or visit `http://127.0.0.1:8000/` from your local development server**

## Dependencies

* Django
* Gunicorn
* psycopg2 (if using PostgreSQL) or mysqlclient (if using MySQL) or sqlite3 (if using SQLite)
* Any other required packages listed in `requirements.txt`.

# Assignment 2

## Types of Backups

There are mainly three strategies used to back up applications in software development.

### 1. Full Backup

In a full backup, all project files and data are copied and stored in a backup storage regularly. For example, if backups are scheduled to be done on Sunday, Monday, and Tuesday, each of these backups will generate a full copy/instance/snapshot of the application at the time the backup was made.

#### Advantages
1. It is a fast restoration strategy as it does not require backtracking or referencing previous backups to restore the system.
2. System restoration and recovery time is fast and straightforward.
3. All data is stored in one place, making it easier to manage.

#### Disadvantages
1. Requires high bandwidth to perform the backup operation.
2. High storage consumption since every backup stores the entire project and its data, even if no changes occurred.

---

### 2. Differential Backup

This strategy only copies data that has changed since the last full backup. For example, if the last full backup was made on Sunday, then the backups made on Monday, Tuesday, and so on will contain only the changes since Sunday.

#### Advantages
1. Saves storage space compared to full backups.
2. Faster to execute than a full backup, since only changed files are copied.
3. Easier to restore than incremental backups, requiring only the last full backup and the latest differential backup.

#### Disadvantages
1. Requires more storage than incremental backups, as data changes accumulate with each backup until the next full backup.
2. Recovery takes slightly longer than a full backup, as it involves at least two backup files (the full and the latest differential).

---

### 3. Incremental Backup

This strategy only copies data changes since the last backup of any kind—whether full or incremental. For example, if a full backup is made on Sunday, an incremental backup on Monday will store changes since Sunday, and Tuesday's backup will store only changes since Monday's backup, and so on.

#### Advantages
1. Saves the most storage space of all three strategies.
2. Backup operations are quick and require minimal resources.
3. Efficient in terms of time and bandwidth.

#### Disadvantages
1. Restoration can be slow and complex, as it requires the last full backup and every incremental backup made since then.
2. If one incremental backup is lost or corrupted, all subsequent backups may become unusable.
3. Higher potential for data inconsistency during restoration if backups are not properly managed.

## Bash Script Usage

1. Update permission to allow execution
    ```bash
    chmod +x ./backup_scripts/health_check.sh
    chmod +x ./backup_scripts/update.sh
    chmod +x ./backup_scripts/backup_api.sh
    ```
2. execute the files
    ```bash
    ./backup_scripts/health_check.sh
    ./backup_scripts/update.sh
    ./backup_scripts/backup_api.sh
    ```