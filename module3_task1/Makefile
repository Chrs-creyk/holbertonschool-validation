build: ## Generate the website from the markdown and configuration files in the directory dist/ and compile the source code of the application to a binary named awesome-api
	@sudo make check
	@sudo make lint
	@sudo go build
	@sudo hugo

clean: ## Cleanup the content of the directory dist/, the binary awesome-api and the log file awesome-api.log
	-@sudo make stop
	-@sudo rm -rf ./dist
	-@sudo rm ./awesome-api ./awesome-api.log ./coverage-units.out 

post: ## Create a new blog post whose filename and title come from the environment variables POST_TITLE and POST_NAME.
	@sudo hugo new posts/${POST_NAME}.md
	@sudo sed -i 's/^title:.*/title: ${POST_TITLE}/g' ./content/posts/${POST_NAME}.md

run: ## Run the application in background by executing the binary awesome-api, and write logs into a file named awesome-api.log
	@sudo make build
	@sudo ./awesome-api >./awesome-api.log 2>&1 &

stop: ## Stop the application with the command kill XXXXX where XXXXX is the Process ID of the application. 
	@sudo kill "$(shell pgrep awesome-api)"

test: ## Check expected behaviour of the app
	@sudo make unit-tests
	@sudo make integration-tests
	@sudo make validate

lint: ## Static linting on go files using golangci-lint
	@sudo golangci-lint run

unit-tests: ## execute (successfully) the Golang unit tests
	@sudo go test -v -short -coverprofile=coverage-units.out     

integration-tests: ## execute the Golang integration tests
	@sudo go test -v -coverprofile=coverage-integrations.out

check: ## Markdown linting on syntax and dead links
	@sudo markdown-link-check ./content/posts/*
	@sudo markdownlint ./content/posts/*

validate: ## should validate the file ./dist/index.html by using the command line Holberton’s W3C Validator
	@sudo ./w3c_validator.py ./dist/index.html

help: ## Shows this help message
	@sudo fgrep -h "##" $(MAKEFILE_LIST) | sudo fgrep -v fgrep | sudo sed -e 's/\\$$//' | sudo sed -e 's/##//'
