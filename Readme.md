# Dockerfile для сертификатов ГОСТ и RSA на одном ресурсе

Данный файл сделан для демонстрации одновременной работы ГОСТ и RSA сертификатов. Если у вас не подключено ГОСТ шифрование, сайт откроется под сертификатом RSA.
	
## Подготовка

1) Замените "example.com" на ваш домен в следующих файлах:
	
* confs/host.conf
* certs/ssl-rsa.cnf
* certs/ssl-gost.cnf
		
2) Создайте сертификаты посредством скриптов:
	
* certs/gengost.sh
* certs/genrsa.sh
		
3) Установите сертификаты ```root-rsa.crt``` и ```root-gost.crt``` на подключающиеся машины
	
4) Запустите ```docker build . -t 2certsnginx``` в директории с Dockerfile
	
## Запуск

```
docker run -p 80:80 -p 443:443 -d 2certsnginx
```
	
## Полезные ссылки

[Включение ГОСТ в Яндекс Браузере](https://browser.yandex.ru/help/tls/tls.html)
