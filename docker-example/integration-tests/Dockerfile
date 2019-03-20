FROM buildkite/puppeteer:v1.13.0
WORKDIR /app
RUN     curl https://raw.githubusercontent.com/vishnubob/wait-for-it/master/wait-for-it.sh > /usr/sbin/wait-for-it.sh \
        && chmod +x /usr/sbin/wait-for-it.sh
COPY    package.json package-lock.json /app/
RUN     npm install
COPY    . /app
CMD     ["wait-for-it.sh", "app:3000", "--", "npm", "test"]
