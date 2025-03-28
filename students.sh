#!/bin/bash

python manage.py shell <<EOF
from api.models import Student

students_data = [
    {"name": "Alice Johnson", "program": "Software Engineering"},
    {"name": "Bob Smith", "program": "Computer Science"},
    {"name": "Charlie Brown", "program": "Information Technology"},
    {"name": "David Wilson", "program": "Cyber Security"},
    {"name": "Ella Martinez", "program": "Artificial Intelligence"},
    {"name": "Franklin Clark", "program": "Data Science"},
    {"name": "Grace Lee", "program": "Cloud Computing"},
    {"name": "Hannah Scott", "program": "Game Development"},
    {"name": "Isaac Wright", "program": "Machine Learning"},
    {"name": "Julia Adams", "program": "Blockchain Technology"},
]

existing_students = Student.objects.count()
students_to_create = max(0, 10 - existing_students)

if students_to_create > 0:
    for student in students_data[:students_to_create]:
        Student.objects.get_or_create(name=student["name"], program=student["program"])

print(f"Total students: {Student.objects.count()}")
EOF
