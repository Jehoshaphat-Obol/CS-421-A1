from rest_framework import generics
from .serializers import StudentSerializer, SubjectSerializer
from .models import Student, Subject


# Create your views here.
class StudentListView(generics.ListAPIView):
    queryset = Student.objects.all()
    serializer_class = StudentSerializer


class SubjectListView(generics.ListAPIView):
    queryset = Subject.objects.all()
    serializer_class = SubjectSerializer
