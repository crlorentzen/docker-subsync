FROM python:3.7

ENV version='0.16'

RUN echo 'debconf debconf/frontend select Noninteractive' | debconf-set-selections \
  && apt-get update -q \
  && apt-get install -qy \
  autoconf automake bison build-essential ffmpeg gcc git \
  libasound2-dev libavdevice-dev libavfilter-dev libavformat-dev \
  libavutil-dev libpocketsphinx-dev libpulse-dev libsphinxbase-dev \
  libswresample-dev libswscale-dev libtool \
  python3-dev python3-pip python3-pocketsphinx \
  swig \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN git clone -b ${version} https://github.com/sc0ty/subsync.git

WORKDIR /subsync

RUN cp subsync/config.py.template subsync/config.py
RUN pip3 install pocketsphinx && pip3 install -r requirements.txt

RUN python3 setup.py build && python3 setup.py install

WORKDIR /subsync/bin

VOLUME /root

ENTRYPOINT [ "python3", "./subsync", "--cli" ]
