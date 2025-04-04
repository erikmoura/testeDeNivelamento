from django.db import models

class RelatorioCadop(models.Model):
    Registro_ANS = models.CharField(max_length=20)
    CNPJ = models.CharField(max_length=20)
    Razao_Social = models.CharField(max_length=255)
    Nome_Fantasia = models.CharField(max_length=255)
    Modalidade = models.CharField(max_length=100)
    Logradouro = models.CharField(max_length=255)
    Numero = models.CharField(max_length=20)
    Complemento = models.CharField(max_length=255, null=True, blank=True)
    Bairro = models.CharField(max_length=100)
    Cidade = models.CharField(max_length=100)
    UF = models.CharField(max_length=2)
    CEP = models.CharField(max_length=10)
    DDD = models.CharField(max_length=2)
    Telefone = models.CharField(max_length=30)
    Fax = models.CharField(max_length=30, null=True, blank=True)
    Endereco_eletronico = models.EmailField(null=True, blank=True)
    Representante = models.CharField(max_length=255)
    Cargo_Representante = models.CharField(max_length=150)
    Regiao_de_Comercializacao = models.TextField()
    Data_Registro_ANS = models.CharField(max_length=255)

    class Meta:
        db_table = "relatorio_cadop"


    def __str__(self):
        return f'{self.Razao_Social} ({self.Registro_ANS})'
