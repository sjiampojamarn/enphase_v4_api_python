ARG BUILD_FROM
FROM ${BUILD_FROM} as BUILD_IMAGE

RUN apt-get update \
  && apt-get install -y python3 python3-pip vim \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

WORKDIR /enphase
COPY entrypoint.sh .
RUN chmod 755 entrypoint.sh
COPY requirements.txt .
RUN pip3 install -r requirements.txt

COPY enphase.py .
COPY creds.json.sample .
COPY variables.py.sample .

ENTRYPOINT ["/enphase/entrypoint.sh"]
