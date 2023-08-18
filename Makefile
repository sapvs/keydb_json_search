KEYDB_BRANCH=main
REJSON_VER=v2.4.2
REDISEARCH_VERSION=v2.6.3

keydb_main:
	docker build --build-arg BRANCH=$(KEYDB_BRANCH)  -t  keydb_main . 

rejson: keydb_main
	docker build -t keydb_main_rejson --build-arg BRANCH=$(REJSON_VER) -f Dockerfile.keydb.rejson .


redisearch: keydb_main
	docker build -t keydb_main_redisearch  --build-arg BRANCH=$(REDISEARCH_VERSION) -f Dockerfile.keydb.rejson .