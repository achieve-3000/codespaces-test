run-web:
	DEBUG=codespaces-test:* nohup npm start > /tmp/app.log &
run-tunnel:
	nohup lt --port 3000> /tmp/server.log &
cat-tunnel:
	sleep 2 && cat /tmp/server.log > /tmp/server-address.log && cat /tmp/server-address.log
server-address:
	cat /tmp/server-address.log
run: install run-web run-tunnel cat-tunnel
server-log:
	tail -f /tmp/server.log
application-log:
	tail -f /tmp/app.log	
install:
	npm install && npm install -g localtunnel
list-processes:
	ps | grep -ie node | awk '{print $$1}' 
stop:
	ps | grep -ie node | awk '{print $$1}' | xargs kill -9
list:
	@grep '^[^#[:space:]].*:' Makefile