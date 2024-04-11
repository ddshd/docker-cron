# docker-cron
 Simple Docker container to run scheduled tasks

# Usage

Sample `docker-compose.yml` file:

```
version: "3.8"

services:
  cron:
    image: ghcr.io/ddshd/docker-cron:latest
    volumes:
      - /your_scripts/location/:/scripts/
      - /your_startup_scripts/location/:/startup/ # Optional
    environment:
      CRON_SCHEDULE: '* * * * *'
    restart: always
```

- Scripts in the volumed mapped `/startup/` are only run once, during startup
- Scripts in the volumed mapped `/scripts/` are run during the cron schedule specified with `CRON_SCHEDULE` env variable

`CRON_SCHEDULE` accepts any cron syntax. See: https://crontab.guru/ for help.
