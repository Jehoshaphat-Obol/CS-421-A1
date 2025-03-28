from rest_framework import generics

from .models import Student, Subject
from .serializers import StudentSerializer, SubjectSerializer


# Create your views here.
class StudentListView(generics.ListAPIView):
    queryset = Student.objects.all()
    serializer_class = StudentSerializer


class SubjectListView(generics.ListAPIView):
    queryset = Subject.objects.all()
    serializer_class = SubjectSerializer
