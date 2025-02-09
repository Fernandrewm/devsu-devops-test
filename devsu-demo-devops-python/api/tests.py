# Standard library imports
import json

# Django imports
from django.test import TestCase
from django.urls import reverse

# Third party imports
from rest_framework.test import APIClient, APITestCase

# Local imports
from .models import User


class TestUserView(APITestCase):
    def setUp(self):
        user = User(name="Test1", dni="09876543210")
        user.save()
        self.url = reverse("users-list")
        self.data = {"name": "Test2", "dni": "09876543211"}

    def test_post(self):
        response = self.client.post(self.url, self.data, format="json")
        self.assertEqual(response.status_code, 201)
        self.assertEqual(json.loads(response.content), {"id": 2, "name": "Test2", "dni": "09876543211"})
        self.assertEqual(User.objects.count(), 2)

    def test_get_list(self):
        response = self.client.get(self.url)
        self.assertEqual(response.status_code, 200)
        self.assertEqual(len(json.loads(response.content)), 1)

    def test_get(self):
        response = self.client.get(self.url + "1/")
        self.assertEqual(response.status_code, 200)
        self.assertEqual(json.loads(response.content), {"id": 1, "name": "Test1", "dni": "09876543210"})


class UserTestCase(TestCase):
    def setUp(self):
        self.client = APIClient()
        self.user_data = {"dni": "1234567890", "name": "Test User"}
        self.user = User.objects.create(**self.user_data)

    def test_get_users(self):
        response = self.client.get("/api/users/")
        self.assertEqual(response.json(), [{"id": self.user.id, "dni": "1234567890", "name": "Test User"}])

    def test_create_user(self):
        new_user_data = {"dni": "0987654321", "name": "New Test User"}
        response = self.client.post("/api/users/", new_user_data, format="json")
        self.assertEqual(response.json(), {"id": response.json()["id"], "dni": "0987654321", "name": "New Test User"})
