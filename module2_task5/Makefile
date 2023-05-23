build: ## Genera el sitio web a partir de los archivos de markdown y configuración en el directorio dist/ y compila el código fuente de la aplicación en un archivo binario llamado awesome-api
	@make check
	@make lint
	@go build -o awesome-api
	@hugo

clean: ## Limpia el contenido del directorio dist/, el binario awesome-api y el archivo de registro awesome-api.log
	-@make stop
	-@rm -rf ./dist
	-@rm ./awesome-api ./awesome-api.log ./coverage-units.out 

post: ## Crea una nueva publicación de blog con el nombre de archivo y título provenientes de las variables de entorno POST_TITLE y POST_NAME.
	@hugo new posts/${POST_NAME}.md
	@sed -i 's/^title:.*/title: ${POST_TITLE}/g' ./content/posts/${POST_NAME}.md

run: ## Ejecuta la aplicación en segundo plano ejecutando el binario awesome-api y escribe los registros en un archivo llamado awesome-api.log
	@make build
	@./awesome-api > ./awesome-api.log 2>&1 &

stop: ## Detiene la aplicación con el comando kill XXXXX donde XXXXX es el ID del proceso de la aplicación.
	@kill "$(shell pgrep awesome-api)"

test: ## Verifica el comportamiento esperado de la aplicación
	@make unit-tests
	@make integration-tests
	@make validate

lint: ## Linting estático en archivos Go utilizando golangci-lint
	@golangci-lint run

unit-tests: ## Ejecuta (exitosamente) las pruebas unitarias en Go
	@go test -v -short -coverprofile=coverage-units.out     

integration-tests: ## Ejecuta las pruebas de integración en Go
	@go test -v -coverprofile=coverage-integrations.out

check: ## Linting de sintaxis y verificación de enlaces en archivos de Markdown
	@markdown-link-check ./content/posts/*
	@markdownlint ./content/posts/*

validate: ## Valida el archivo ./dist/index.html utilizando el validador de W3C desde la línea de comandos
	-@./w3c_validator.py ./dist/index.html

help: ## Muestra este mensaje de ayuda
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'
