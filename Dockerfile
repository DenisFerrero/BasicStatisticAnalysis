FROM node:15.13-alpine

# copy the app and sh files
WORKDIR /usr/src/app/
COPY . /usr/src/app/

# Install node_modules
RUN npm install --silent

# build the application
RUN npm run build

# expose 5000 port
EXPOSE 5000

# set app serving to permissive / assigned
ENV NUXT_HOST=0.0.0.0
# set app port
ENV NUXT_PORT=5000

# start the app
CMD [ "npm", "run", "start" ]
