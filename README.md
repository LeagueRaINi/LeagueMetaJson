Dumping league metaclasses in a docker container

Used for code-gen of .bin (de)serialization classes: https://github.com/LoL-Fantome/LeagueToolkit/tree/master/LeagueToolkit.Meta.Classes

Features
- creates a cronjob that dumps every 10 minutes
- exposes the meta directory on localhost:1337
- modified to save to not only keep the latest meta file

Usage:
```sh
# Clone the branch
git clone https://github.com/LeagueRaINi/LeagueMetaJson.git --branch docker-alpine

# Build the docker image
cd LeagueMetaJson && docker build .
```
