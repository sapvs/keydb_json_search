KEYDB_BRANCH=main
REJSON_VER=v2.4.2
REDISEARCH_VERSION=v2.6.3

keydb_main:
	docker build --build-arg BRANCH=$(KEYDB_BRANCH)  -t  keydb_main .
	
jsonsearch: keydb_main
	docker build -t keydb_json_search \
		--build-arg REDISEARCH_BRANCH=$(REDISEARCH_VERSION) \
		--build-arg REJSON_BRANCH=$(REJSON_VER) \
		-f Dockerfile.keydb_json_search .

runjsonsearch: jsonsearch
	docker run --rm -it keydb_json_search

redisearch: keydb_main
	docker build -t keydb_main_redisearch  --build-arg BRANCH=$(REDISEARCH_VERSION) -f Dockerfile.keydb.redisearch .