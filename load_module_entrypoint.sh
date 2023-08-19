#!/bin/sh

set -e


log (){
  echo `date +"%d-%m-%Y %H:%M:%S"` "MODULE_LOADER" $@
}

load (){
  log "load_module_entrypoint.sh called with " $@
  while [ 1 ]; do 
    # sleep for some time
    sleep 1
    keydb-cli --raw ping >/dev/null 2>&1
    
    if [ $? -eq 0 ]; then
      log "keyd is up, loading modules"
      
      keydb-cli --raw module load /etc/libs/librejson.so >/dev/null 2>&1
      if [ $? -eq 0 ]; then
        log "rejson load successfully"
      fi

      keydb-cli --raw module load /etc/libs/redisearch.so >/dev/null 2>&1
      if [ $? -eq 0 ]; then
        log "redisearch load successfully"
      fi
      # break the loop
      break
    fi

  done 
  log "Module load done " $@
} 

load $@ &

log "Calling docker-entrypoint.sh with " $@
exec docker-entrypoint.sh "$@"
