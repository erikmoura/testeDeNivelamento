# Teste de Nivelamento
Repositório contendo as resoluções para o teste de nivelamento composto por 4 etapas.

## Web Scraping

Requisitos: _Beautiful Soup, Requests._

Instalação:
``` pip install requests beautifulsoup4 ```

O código _webscraping.py_ utiliza dos módulos Beautiful Soup e Requests para obter dados da web. O Requests permite a realização de requisições HTTP a fim de obter o conteúdo de páginas web enquanto o Beautiful Soup permite a análise e a extração do tal conteúdo. Aproveitando das funcionalidades destes módulos, são resolvidos os itens 1.1 e 1.2. O módulo ZipFile, que já é nativo do Python, é utilizado para compactar os anexos extraídos, possibilitando a solução do item 1.3. 

## Transformação de Dados

Requisitos: _PyMuPdf, PdfPlumber._

Instalação:
``` pip install pymupdf pdfplumber ```

O código _tabelas.py_ utiliza dos módulos Fitz (PyMuPdf) e PdfPlumber para analisar arquivos PDF e possibilitar a extração de tabelas a partir destes. 
