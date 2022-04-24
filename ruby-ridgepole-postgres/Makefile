.PHONY: up
up: ## 依存コンテナを立ち上げる
	docker-compose up db

.PHONY: bash
bash: ## appサービスにbashで入る
	docker-compose run --rm --service-ports app bash

.PHONY: clean
clean: ## コンテナを落とす(Volumeも含める)
	docker-compose down --volumes

.PHONY: build
build: ## Docker image を build
	docker-compose build


################################################################################
# Utility-Command help
################################################################################
.DEFAULT_GOAL := help

################################################################################
# マクロ
################################################################################
# Makefileの中身を抽出してhelpとして1行で出す
# $(1): Makefile名
define help
  grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(1) \
  | grep --invert-match "## non-help" \
  | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[36m%-20s\033[0m %s\n", $$1, $$2}'
endef
################################################################################
# タスク
################################################################################
.PHONY: help
help: ## Make タスク一覧
	@echo '######################################################################'
	@echo '# Makeタスク一覧'
	@echo '# $$ make XXX'
	@echo '# or'
	@echo '# $$ make XXX --dry-run'
	@echo '######################################################################'
	@echo $(MAKEFILE_LIST) \
