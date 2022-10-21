# Questionário conceitual

Responda as questões neste mesmo arquivo, por favor, responda com suas próprias palavras, com sinceridade quando não conhecer determinado assunto.

1. Conhece GIT? Já o utilizou em algum projeto?
R: Sim, ultilizo em todos os projetos que já desenvolvi, para versionamento de codigo

2. Qual a diferença entre GIT e GITHUB?
R: Git é um sotware aonde permite o versionamento de codigo e GITHUB/GITLAB é aonde ficar hospedado os versionamentos feitos com o GIT, então um complementa o outro.

3. Conhece ou tem experiência com desenvolvimento Web? Descreva como se dá a requisição HTTP entre um cliente e o servidor, e como se dá a resposta.
R: Possuo sim, com React e Vue. Quando se vai fazer uma requisição HTTP você precisa especificar aonde ele está na internet, então você passar a url e consecutivamente o tipo de requisição (GET,POST,PUT,PATCH,DELETE), as mais ultilizadas são GET para consultar dados, POST para inserir dados e PUT para atualização de dados, geralmente não ultilizamos DELETE e sim um POST para atualiza o tipo de dado para "enable: false" ou algo do tipo... A resposta da requisição vem no request.body (são arquivos JSON) e seu status em request.statuscode.

4. Conhece API REST? Para que são utilizadas? Cite dois exemplos.
R: Sim, é a estrutura da API, falei mais sobre acima no item[3].
E: Mando um POST para API de registro, ele vai chegar mais ou menos assim:
{"Name":"Gabriel Arthur",
  "Email":"dev.gabrielfiusa@gmail.com",
  "Password":"123",}
Geralmente no body do request ele retorna um TOKEN que geralmente é baseado em quando ele faz aquela requisição e gera uma Data() limite para ele continuar fazendo requisição. Visto a essa requisição ele vai na API, verifica se não tem uma conta com esse EMAIL, criptografa a senha e registro no banco e para consultar, fazemos uma requisição GET passando o TOKEN e ele sera referenciado ao usuario que está logado e se ele não estiver logado, redirecionamos ele para o login.

5. Conhece o conceito de AJAX? Descreva a tecnologia utilizada.
R: Não possuo conhecimento de AJAX

6. Conhece o conceito de assincronicidade ? Como usar na tecnologia deste desafio ?
R: Sim, tanto assincronicidade como nulabilidade e mutabilidade de dados. Poderia ser implementado nesse desafio caso tenha chamada a API ou algo que vá demorar, por isso ultilizamos o conceito de assincronicidade mas como não foi ultilizado, porquê o nivel de complexidade era baixo(O custo de subir uma API apenas para retonar dados de um BD, que são fixo, não vale), é melhor ultilizar dados staticos no dart por exemplo.

7. Conhece padrões de projeto ? Descreva um cenário onde usaria um padrão de projeto que implementa IoC, e qual seria este padrão.
R: Não possuo conhecimento de padrões de projeto, o unico que eu conheço é o Modular(flutter_modular)


