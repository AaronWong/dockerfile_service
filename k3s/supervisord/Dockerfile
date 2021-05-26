FROM python:3.6
LABEL maintainer="kencheng" \
      version="1.0" \
      description="python3.6 API"
ENV LANG en_US.UTF-8
ENV TZ=Asia/Shanghai
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone
RUN apt-get update -y && apt-get install -y nginx supervisor
RUN mkdir -p /var/www/
RUN pip3 install aliyun-python-sdk-core==2.13.30 \
        aliyun-python-sdk-core-v3==2.13.11 \
        aliyun-python-sdk-dysmsapi==2.1.1 \
        autopep8==1.5.4 \
        beautifulsoup4==4.9.3 \
        bs4==0.0.1 \
        certifi==2020.12.5 \
        cffi==1.14.4 \
        chardet==3.0.4 \
        click==7.1.2 \
        crypto==1.4.1 \
        cryptography==3.2.1 \
        dataclasses==0.8 \
        fire==0.3.1 \
        Flask==1.1.2 \
        Flask-JSONRPC==0.3.1 \
        idna==2.10 \
        imageio==2.9.0 \
        itsdangerous==1.1.0 \
        Jinja2==2.11.2 \
        jmespath==0.10.0 \
        ldap3==2.6 \
        MarkupSafe==1.1.1 \
        minio==7.0.1 \
        Naked==0.1.31 \
        numpy==1.19.5 \
        opssdk==0.0.40 \
        Pillow==8.1.0 \
        pyasn1==0.4.8 \
        pycodestyle==2.6.0 \
        pycparser==2.20 \
        pycryptodome==3.9.9 \
        pydantic==1.4 \
        PyJWT==1.7.1 \
        PyMySQL==0.9.3 \
        pyotp==2.4.1 \
        python-dateutil==2.7.5 \
        python3-pika==0.9.14 \
        PyYAML==5.4.1 \
        redis==2.10.6 \
        requests==2.24.0 \
        rsa==4.0 \
        shellescape==3.8.1 \
        shortuuid==1.0.1 \
        six==1.15.0 \
        soupsieve==2.1 \
        SQLAlchemy==1.3.0 \
        termcolor==1.1.0 \
        toml==0.10.2 \
        tornado==6.1 \
        typeguard==2.10.0 \
        urllib3==1.25.11 \
        Werkzeug==1.0.1 \
        pypinyin==0.41.0

EXPOSE 80
CMD ["/usr/bin/supervisord"]
