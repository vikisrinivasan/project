from django.shortcuts import render
from django.contrib.auth.decorators import login_required
from .models import UploadedFile
import boto3
import s3_config


@login_required
def upload_file(request):
    context = {}
    if request.method == 'POST' and request.FILES.get('file'):
        file_obj = request.FILES['file']
        s3 = boto3.client(
            's3',
            aws_access_key_id=s3_config.AWS_ACCESS_KEY_ID,
            aws_secret_access_key=s3_config.AWS_SECRET_ACCESS_KEY,
            region_name=s3_config.AWS_S3_REGION_NAME,
        )
        s3.upload_fileobj(file_obj, s3_config.AWS_STORAGE_BUCKET_NAME, file_obj.name)
        UploadedFile.objects.create(file_name=file_obj.name)
        context['success'] = True
    return render(request, 'uploader/upload.html', context)
