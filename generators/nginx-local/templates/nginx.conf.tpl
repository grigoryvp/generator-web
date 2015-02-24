events {
  worker_connections  1024;
}

http {
  include mime.types;
  server {
    listen 127.0.0.1:80;
    root .;

    location / {
      index index.php;
      try_files $uri $uri/ /index.php?$args;
    }

    location ~ \.php$ {
      fastcgi_pass  127.0.0.1:9123;
      fastcgi_index index.php;
      fastcgi_param SCRIPT_FILENAME  $document_root$fastcgi_script_name;
      fastcgi_param DEBUG 'true';
      include fastcgi_params;
    }
  }
}

