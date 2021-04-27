from django.urls import path
from user import views

app_name = 'user'

urlpatterns = [
    path('create/', views.CreateGenericView.as_view(), name='create'),
    path('token/', views.CreateTokenView.as_view(), name='token'),
]
