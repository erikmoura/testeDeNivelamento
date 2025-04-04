import os
import requests
from bs4 import BeautifulSoup
import wget

# script para baixar arquivos de demonstrações contábeis e operadoras ativas da ANS

def criar_diretorios(base_dir, anos):
    os.makedirs(base_dir, exist_ok=True)
    for ano in anos:
        os.makedirs(os.path.join(base_dir, str(ano)), exist_ok=True)

def obter_links_disponiveis(url):
    response = requests.get(url)
    response.raise_for_status()
    soup = BeautifulSoup(response.text, 'html.parser')
    return {link.text for link in soup.find_all('a', href=True)}

def baixar_arquivos(url_base, diretorio_destino, arquivos_desejados):
    links_disponiveis = obter_links_disponiveis(url_base)
    for arquivo in arquivos_desejados:
        if arquivo in links_disponiveis:
            url_arquivo = url_base + arquivo
            caminho_destino = os.path.join(diretorio_destino, arquivo)
            print(f'Baixando: {url_arquivo} para {caminho_destino}')
            wget.download(url_arquivo, caminho_destino)

def main():
    base_url = 'https://dadosabertos.ans.gov.br/FTP/PDA/demonstracoes_contabeis/'
    url2 = 'https://dadosabertos.ans.gov.br/FTP/PDA/operadoras_de_plano_de_saude_ativas/'
    base_dir = 'Demonstracoes_Contabeis'
    dir2 = 'Operadoras_Ativas'
    anos = [2024, 2023]
    
    criar_diretorios(base_dir, anos)
    criar_diretorios(dir2, [])
    
    for ano in anos:
        url_ano = f'{base_url}{ano}/'
        diretorio_ano = os.path.join(base_dir, str(ano))
        arquivos = [f'{i}T{ano}.zip' for i in range(1, 5)]
        baixar_arquivos(url_ano, diretorio_ano, arquivos) 
    
    arquivo = 'Relatorio_cadop.csv'
    baixar_arquivos(url2, dir2, [arquivo])

if __name__ == '__main__':
    main()
