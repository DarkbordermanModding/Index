# Index
Various mod collection index

# Init service (steamcmd docker)

0. Setup environment variable
```
cp sample.env .env
```
Fill in Steam's account and password into `.env`

1. Start steamcmd for uploading to workshop
**Note**: You may need to check mail/phone for steam Guard code
```
make init
```

2. (Optional) Restarting and enter steamcmd shell
```
make steamcmd
```

# Upload to workshop (Steam Workshop only)
File path is used to recognize game uid and workshop number.

The path uses the following format `<steamid>/<workshopid>/`, new workshop item id is 0

There's an example structure at `example_appid/example_workshopid`

0. Start steamcmd workshop upload
```
make workshop_upload
```
