FROM python:3.7
RUN apt-get update \
    && apt-get install -qqy --no-install-recommends \
        apt-utils \
        ffmpeg \
        sox \
        libcairo2-dev \
        texlive \
        texlive-fonts-extra \
        texlive-latex-extra \
        texlive-latex-recommended \
        texlive-science \
        tipa \
		fontconfig \
		xfonts-utils \
    && rm -rf /var/lib/apt/lists/* \
	&& mkdir /usr/share/fonts/msyh
COPY ./font/* /usr/share/fonts/msyh/
COPY . /manim
RUN cd /usr/share/fonts \
    && mkfontscale \
    && mkfontdir \
    && fc-cache \
    && fc-list :lang=zh \
    && cd /manim \
    && git init \
    && python setup.py sdist \
    && python -m pip install dist/manimlib* \
    && pip install -r /manim/requirements.txt
ENTRYPOINT ["/bin/bash"]
