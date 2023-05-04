# <h1 align="center"> Weather App </h1>

<p align="center">
<img src="http://img.shields.io/static/v1?label=STATUS&message=FINALIZADO&color=GREEN&style=for-the-badge"/>
</p>

# Descrição do Projeto

Um aplicativo mobile de previsão do tempo desenvolvido em Flutter, integrado com a OpenWeatherAPI e GeoJS.

# Funcionalidades e Demonstração da Aplicação
- `Tempo de Hoje`: A aplicação fornece a temperatura, a condição, a mínima e a máxima do dia de hoje. 
<img src="https://i.imgur.com/Foxbcbo.gif" width="240" height="480"/>

- `Previsão por Hora`: A aplicação fornece a previsão da temperatura, bem como a condição das proximas 24 horas.
<img src="https://i.imgur.com/ypJ6Awx.gif" width="240" height="480" />

- `Previsão por Semana`: A aplicação fornece a previsão da temperatura mínima e máxima, bem como a condição dos proximos 4 dias.
<img src="https://i.imgur.com/hSVX3Zq.gif" width="240" height="480"/>

- `Mudança de Localização`: A aplicação fornece a possibilidade de escolher diferentes cidades para visualizar as previsões.
<img src="https://i.imgur.com/vvJScRD.gif" width="240" height="480" />

- `Tela de Erro` : Caso não seja possível se conectar com a API, a aplicação tem uma tela de erro que permite tentar novamente. 
<img src="https://i.imgur.com/AtPLVwK.gif" width="240" height="480"/>

# ![Flutter](https://img.shields.io/badge/-Flutter-blue?style=flat-square&logo=flutter&logoColor=white) Tecnologias utilizadas
* Desenvolvido em `Flutter` e `Dart`
* Pacotes usados: `intl`  , `http`

# 📁 Acesso ao projeto

* Para ter acesso ao projeto, primeiro é preciso fazer um clone do projeto usando o seguinte comando: 
 
       git clone https://github.com/BrunoNaza/mobile-weather-app/tree/arrumando_botoes
 
       
* Depois disso, é preciso abrir a pasta `weather_app` e executar normalmente.

*  Para a demonstração ser mais curta, está disponibilizada no próprio código a minha API KEY, mas caso seja de seu interesse, abaixo segue a dica para como usar sua própria KEY
* 1 - Aqui você consegue pegar sua API KEY : 
* 2 - Depois vá até a pasta onde estão os arquivos e busque `weather_app\lib\models`. 
* 3 - Nos arquivos: `forecast_weather`e `WeatherNow`, coloque sua chave: final apiKey = 'Sua chave aqui'

# Alguns pontos sobre a aplicação e possiveis melhorias 

* Sobre a API, ela fornece previsões a cada 3 horas, portanto é limitado o número de previsões que é possivel de ser feita. 
* Além disso, ela fornece dados somente dos proximos 4 dias, também deixando limitado as previsões 
* Uma possivel melhoria para isso é utilizar uma API diferente, talvez paga que forneça mais informações. 
* Uma outra possivel melhoria é utilizar uma melhor API, que trabalhe com geolocalização, para se trabalhar com latitude e longitude.
* Sobre o código, ele possui uma lista de cidades pré-determinadas (devido a falta de tempo, não pude implementar algo melhor), mas ao menos uma das cidades da lista será baseada no IP do dispositivo usado. No caso dos GIF de cima, era Joinville.
* Uma melhoria possivel no código seria a possibilidade de "criar cidades", digitar qualquer cidade e ser capaz de fornecer informações
* Os assets usados não foram exatamente os do Mock, pois ele não possuia todos os icones necessarios, dessa forma optei por escolher um pacote gratuito e livre, bastante parecido, da internet para usar.



# Conclusão
O desenvolvimento desse trabalho para mim foi algo bastante especial, visto que foi meu primeiro contato com esse tipo de desafio. Acredito que consegui desenvolver algo bem legal e fico feliz com o meu desempenho. 
No primeiro dia, fui logo me inteirar sobre o que eu precisava para continuar. E assim eu fui na Alura e dale video na velocidade 3x pra conseguir dar conta. Depois de umas horas estudando sem parar, fui direto pros modelos e entender como funcionava a API. Depois de um tempão consegui e comecei a trabalhar de fato em Flutter. Isso já era no dia da entrega na madrugada e eu tinha o trabalho inteiro a fazer. Fiquei o dia todo nisso e ao fim do dia vi que o prazo foi adiado. Desde então, fiquei polindo e melhorando tudo que era possível, contato com a API, fidelidade com o Mock, que inclusive acho que fiz bem, e tudo mais. No fim de tudo, foi uma parada muito massa de participar e estou bastante satisfeito com meu desempenho. 

# Licenças 
Os assets utilizados foram, primordialmente, tirados a partir desse link: https://www.freepik.com/free-vector/gradients-weather-icons-apps-collection_15292634.htm 
A exceção é o asset de floco de neve que foi utilizado desse link: https://br.freepik.com/vetores-gratis/gradientes-de-icones-de-clima-para-aplicativos_15292633.htm#query=clima&position=2&from_view=keyword&track=robertav1_2_sidr 
