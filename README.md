# booru-bot-discord
A discord bot to search and post pictures from Danbooru, Gelbooru, Safebooru, yande.re and hopefully more.

## Available commands

- !danbooru your_tag (Sends a picture from danbooru that matches the specified tag.s)
- !gelbooru your_tag (Sends a picture from gelbooru that matches the specified tag.s)
- !safebooru your_tag (Sends a picture from safebiiry that matches the specified tag.s)
- !safebooru your_tag (Sends a picture from yande.re that matches the specified tag.s)

## How to use

edit this line in the code

```swift
let botInfo = Bot(token: "bot token here", status: "Your status here", prefix: "Your prefix here", defaultQuery: "tag_here")
````

Replace every string accordingly, then:

`swift build`
  

`swift run`

**Make sure you have Xcode tools or xcode installed**
