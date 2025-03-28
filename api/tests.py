from django.test import TestCase
from rest_framework.test import APIClient
from rest_framework import status
from .models import Student, Subject
from django.urls import reverse


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
        response = self.client.get(reverse("api:student-list"))
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertGreaterEqual(len(response.json()), 10)

    def test_get_subjects(self):
        response = self.client.get(reverse("api:subject-list"))
        self.assertEqual(response.status_code, status.HTTP_200_OK)
        self.assertGreaterEqual(len(response.json()), 10)
