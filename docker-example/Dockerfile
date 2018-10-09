# -- Base images
FROM node:10-alpine as node

# -- Production environment
FROM    node AS production
ENV     NODE_ENV=production
EXPOSE  3000
WORKDIR /app
COPY    package.json package-lock.json /app/
RUN     npm install
COPY    . /app
CMD     ["npm", "start"]

# -- Development
# We can just override NODE_ENV and re-run install to get the additional dev
# deps.
FROM production as development
ENV  NODE_ENV=development
RUN  npm install

# -- Default target
FROM production