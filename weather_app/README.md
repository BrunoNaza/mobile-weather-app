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

*  Para a demonstração ser mais curta, está disponibilizada no próprio código a minha API KEY = '16bd8cf4d8f87d244c21a6a883526291' , mas caso seja de seu interesse, abaixo segue a dica para como usar sua própria KEY
* 1 - Aqui você consegue pegar sua API KEY : https://home.openweathermap.org/users/sign_in 
* 2 - Depois vá até a pasta onde estão os arquivos e busque `weather_app\lib\models`. 
* 3 - Nos arquivos: `forecast_weather`e `WeatherNow`, coloque sua chave: final apiKey = 'Sua chave aqui'

#
# Licenças 
Os assets utilizados foram, primordialmente, tirados a partir desse link: https://www.freepik.com/free-vector/gradients-weather-icons-apps-collection_15292634.htm 
A exceção é o asset de floco de neve que foi utilizado desse link: https://br.freepik.com/vetores-gratis/gradientes-de-icones-de-clima-para-aplicativos_15292633.htm#query=clima&position=2&from_view=keyword&track=robertav1_2_sidr 
