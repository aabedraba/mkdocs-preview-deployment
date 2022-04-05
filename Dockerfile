FROM python:3.8-slim-buster as builder
WORKDIR /app
RUN pip3 install mkdocs-material
COPY . .
RUN mkdocs build


FROM nginx:alpine
COPY --from=builder /app/site /usr/share/nginx/html
