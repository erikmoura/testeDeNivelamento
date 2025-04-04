import fitz  # PyMuPDF
import pdfplumber
import csv
import os
from zipfile import ZipFile

def substituir_valores(valor):
    substituicoes = {
        "OD": "Seg. Odontológica",
        "AMB": "Seg. Ambulatorial"
    }
    return substituicoes.get(valor, valor)

def extrair_tabelas_de_pdf(caminho_pdf, caminho_csv):
    # contando numero de paginas do pdf
    with fitz.open(caminho_pdf) as documento:
        numero_paginas = len(documento)
    
    print(f"Número total de páginas: {numero_paginas}")
    
    # extraindo tabelas a partir da terceira página
    # (considerando que a contagem começa em 0, a terceira página é o índice 2)
    with pdfplumber.open(caminho_pdf) as pdf:
        cabecalho = None
        todas_linhas = []
        
        for numero_pagina in range(2, numero_paginas):
            pagina = pdf.pages[numero_pagina]
            tabelas = pagina.extract_tables()
            
            if tabelas:
                tabela = tabelas[0]  # considerando que há apenas uma tabela por página
                if cabecalho is None:
                    cabecalho = tabela[0]  # pegando cabecalho da primeira tabela
                    cabecalho = [substituir_valores(celula) for celula in cabecalho]
                
                linhas_processadas = [[substituir_valores(celula) for celula in linha] for linha in tabela[1:]]
                todas_linhas.extend(linhas_processadas)  # adicionando dados apos a substituicao
        
        # escrevendo o csv
        if cabecalho and todas_linhas:
            with open(caminho_csv, mode='w', newline='', encoding='utf-8') as arquivo:
                escritor = csv.writer(arquivo)
                escritor.writerow(cabecalho)  
                escritor.writerows(todas_linhas)  
                
            print(f"Dados extraídos e salvos em {caminho_csv}")
        else:
            print("Nenhuma tabela encontrada.")

def compactar_csv_em_zip(arquivo_csv, arquivo_zip):
    with ZipFile(arquivo_zip, 'w') as zip_arquivo:
        zip_arquivo.write(arquivo_csv, os.path.basename(arquivo_csv))

def main():
    caminho_pdf = "../WebScraping/Anexos/Anexo_I.pdf"
    caminho_csv = "Tabela_Extraida.csv"
    caminho_zip = "Teste_Erik_Alves_De_Moura_Izidoro.zip"
    
    extrair_tabelas_de_pdf(caminho_pdf, caminho_csv)
    compactar_csv_em_zip(caminho_csv, caminho_zip)
    print(f"Arquivo compactado salvo como {caminho_zip}")

if __name__ == "__main__":
    main()
