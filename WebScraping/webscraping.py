import os
import requests
from bs4 import BeautifulSoup
from zipfile import ZipFile
import wget

def criar_diretorio(diretorio):
    os.makedirs(diretorio, exist_ok=True)

def obter_links_anexos(url, padroes):
    response = requests.get(url)
    response.raise_for_status()
    soup = BeautifulSoup(response.text, 'html.parser')
    
    links_encontrados = []
    for link in soup.find_all('a', href=True):
        if any(padrao in link.text for padrao in padroes):
            links_encontrados.append(link['href'])
        if len(links_encontrados) == len(padroes):
            break
    
    if len(links_encontrados) < len(padroes):
        raise Exception('Nem todos os anexos foram encontrados.')
    
    return links_encontrados

def baixar_arquivos(links, diretorio_destino, nomes):
    caminhos = []
    for link, nome in zip(links, nomes):
        caminho = os.path.join(diretorio_destino, nome)
        print(f'Baixando: {link} para {caminho}')
        wget.download(link, caminho)
        caminhos.append(caminho)
    return caminhos

def compactar_arquivos(caminhos, diretorio_destino, nome_zip):
    caminho_zip = os.path.join(diretorio_destino, nome_zip)
    with ZipFile(caminho_zip, 'w') as arquivo_zip:
        for caminho in caminhos:
            arquivo_zip.write(caminho, os.path.basename(caminho))
    print(f'Arquivo compactado criado: {caminho_zip}')

def main():
    url = 'https://www.gov.br/ans/pt-br/acesso-a-informacao/participacao-da-sociedade/atualizacao-do-rol-de-procedimentos'
    diretorio_destino = 'Anexos'
    nomes_anexos = ['Anexo_I.pdf', 'Anexo_II.pdf']
    padroes_busca = ['Anexo I.', 'Anexo II.']
    
    criar_diretorio(diretorio_destino)
    links_anexos = obter_links_anexos(url, padroes_busca)
    caminhos_baixados = baixar_arquivos(links_anexos, diretorio_destino, nomes_anexos)
    compactar_arquivos(caminhos_baixados, diretorio_destino, 'Anexos.zip')

if __name__ == '__main__':
    main()
