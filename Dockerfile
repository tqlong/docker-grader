FROM gcc

RUN useradd -ms /bin/bash compiler
USER compiler

WORKDIR /home/compiler
ADD run_compiler.sh /home/compiler

CMD ["bash", "run_compiler.sh"]