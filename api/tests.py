from django.test import TestCase
from rest_framework.test import APIClient
from rest_framework import status

# Create your tests here.
class APITestCase(TestCase):
    def setUp(self):
        self.client = APIClient()
        self.students = Student.objects.bulk_create(
            [
                Student(name=f"Student {i}", program="Software Engineering")
                for i in range(10)
            ]
        )
        self.subjects = Subject.objects.bulk_create(
            [Subject(name=f"Subject {i}", year=i % 4 + 1) for i in range(10)]
        )

    def test_get_students(self):
        response = self.client.get("/students/")
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertGreaterEqual(len(response.json()), 10)

    def test_get_subjects(self):
        response = self.client.get("/subjects/")
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertGreaterEqual(len(response.json()), 10)

    def test_create_student(self):
        data = {"name": "New Student", "program": "Data Science"}
        response = self.client.post("/students/", data, format="json")
        self.assertEqual(response.status_code, status.HTTP_201_CREATED)

    def test_create_subject(self):
        data = {"name": "New Subject", "year": 2}
        response = self.client.post("/subjects/", data, format="json")
        self.assertEqual(response.status_code, status.HTTP_201_CREATED)

    def test_update_student(self):
        student = self.students[0]
        data = {"name": "Updated Student", "program": "AI"}
        response = self.client.put(f"/students/{student.id}/", data, format="json")
        self.assertEqual(response.status_code, status.HTTP_200_OK)

    def test_update_subject(self):
        subject = self.subjects[0]
        data = {"name": "Updated Subject", "year": 3}
        response = self.client.put(f"/subjects/{subject.id}/", data, format="json")
        self.assertEqual(response.status_code, status.HTTP_200_OK)

    def test_delete_student(self):
        student = self.students[0]
        response = self.client.delete(f"/students/{student.id}/")
        self.assertEqual(response.status_code, status.HTTP_204_NO_CONTENT)

    def test_delete_subject(self):
        subject = self.subjects[0]
        response = self.client.delete(f"/subjects/{subject.id}/")
        self.assertEqual(response.status_code, status.HTTP_204_NO_CONTENT)
