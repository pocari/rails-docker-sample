##### 作成環境
 - docker-machine version 0.5.5
 - Docker version 1.9.1
 - docker-compose version 1.5.2

##### イメージビルド

 ```
 $ cd ${PROJECT_ROOT}/docker
 $ bin/run_docker-compose build
 ```

##### コンテナ起動
 
 ```
 $ bin/run_docker-compose up -d
 ```
 
##### webappの起動確認
 `docker ps`でしらべたwebappコンテナのnameが`bin_webapp_1`とすると
 
 ```
 $ docker exec bin_webapp_1 ps aux
 USER       PID %CPU %MEM    VSZ   RSS TTY      STAT START   TIME COMMAND
 ...略...
 root        57 53.4  9.4 225788 96716 ?        Sl   13:55   0:22 unicorn_rails master -c /var/data/config/unicorn.rb -E development -D
 root       113  0.0  0.1 124652  1420 ?        Ss   13:56   0:00 nginx: master process /usr/sbin/nginx
 ...略...
 ```
 
 で、`unicorn`と`nginx`のプロセスが起動すれば起動完了
 
 対象のdocker hostのipアドレス(docker-machineならvmのipアドレスnativeならlocalhost)から`http://${docker_host_ip}`にアクセスしてrailsのトップページが表示されればOK
 
 
 
