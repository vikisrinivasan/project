from django.test import TestCase, Client

class UploadPageTest(TestCase):
    def test_get_upload_page(self):
        response = Client().get('/')
        self.assertEqual(response.status_code, 200)
