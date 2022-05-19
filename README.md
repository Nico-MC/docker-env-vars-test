When change the port in .env please be aware of rebuild the project.

```docker-compose up --build```

This is because the port is passed through the dockerfile when the image is build. Finally it will be applied in the server directive (server { ... }) of the nginx.conf.