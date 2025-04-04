from django.urls import path
from ..views import registro_view

urlpatterns = [
    path('relatorios/', registro_view.listar_relatorios),
    path('relatorios/<str:registro_ans>/', registro_view.buscar_por_registro_ans),
]
