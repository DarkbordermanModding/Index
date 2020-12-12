init:
	docker-compose run --name steamcmd steamcmd;

exec:
	docker start steamcmd;
	docker exec -it steamcmd bash;

steamcmd:
	docker start steamcmd;
	docker exec -it steamcmd /home/steam/steamcmd/steamcmd.sh;

workshop_upload:
	# step1(read): read appid, publishfield from stdin
	# step2(export): use grep to get steam account info
	# step3(envsubst): generate .vdf file
	# step4(docker): use docker to upload

	read -p "appid: " appid && \
	read -p "publishfield: " publishfield && \
	export $$(grep -v '^#' .env) && \
	export CONFIG_DIR=$${PWD}/$$appid/$$publishfield && \
	export DOCKER_DIR=/tmp/index/$$appid/$$publishfield && \
	(envsubst < $$CONFIG_DIR/config.cfg) > $$CONFIG_DIR/config.vdf && \
	docker exec -it \
		steamcmd bash -c "/home/steam/steamcmd/steamcmd.sh \
		+login $$STEAM_ACCOUNT $$STEAM_PASSWORD \
		+workshop_build_item $$DOCKER_DIR/config.vdf +quit";
