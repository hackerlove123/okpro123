# Sử dụng base image với JupyterLab
FROM jupyter/base-notebook:latest

# Chạy với quyền root
USER root

# Thiết lập user root làm mặc định khi container khởi động
ENV NB_USER root
ENV NB_UID=0
ENV NB_GID=0

# Cài đặt các công cụ cần thiết
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    curl \
    git \
    htop \
    && apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Copy file start.sh vào container
COPY start.sh /usr/local/bin/start.sh
RUN chmod +x /usr/local/bin/start.sh

# Expose cổng 8888 để chạy JupyterLab
EXPOSE 8888

# Chạy script start.sh khi container khởi động
CMD ["/usr/local/bin/start.sh"]
