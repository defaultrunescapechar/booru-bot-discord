import Sword
import Foundation

func danbooruWaifu(searchQuery: String) -> String {
    let url = "https://danbooru.donmai.us/posts.json?random=true&tags=\(searchQuery)&rating=safe&limit=1"
    var res:String = String()
    if let url = URL(string: url) {
                if let data = try? Data(contentsOf: url) {
                    let img: [Danbooru] = try! JSONDecoder().decode([Danbooru].self, from: data)
                    res = String(img.first?.url ?? "Didn't find anything.")
            }
        }
            return res
}

func safeBooruWaifu(searchQuery: String) ->String {
    let url = "https://safebooru.donmai.us/posts.json?random=true&tags=\(searchQuery)&rating=safe&limit=1"
    var res:String = String()
    if let url = URL(string: url) {
                if let data = try? Data(contentsOf: url) {
                    let img: [SafeBooru] = try! JSONDecoder().decode([SafeBooru].self, from: data)
                    res = String(img.first?.url ?? "Didn't find anything.")
            }
        }
            return res
}

func gelbooruWaifu(searchQuery: String) -> String{
    let pid = Int.random(in: 1..<10)
    let url = "https://gelbooru.com//index.php?page=dapi&s=post&q=index&json=1&tags=\(searchQuery)&limit=1&pid=\(pid)"
    var res:String = String()
    if let url = URL(string: url) {
                if let data = try? Data(contentsOf: url) {
                    let img: [Gelbooru] = try! JSONDecoder().decode([Gelbooru].self, from: data)
                    res = String(img.first?.url ?? "Didn't find anything.")
            }
        }
            return res
}

func yandereWaifu(searchQuery: String) -> String {
    let url = "https://yande.re/post.json?tags=\(searchQuery)&limit=1"
    var res:String = String()
    if let url = URL(string: url) {
                if let data = try? Data(contentsOf: url) {
                    let img: [Yandere] = try! JSONDecoder().decode([Yandere].self, from: data)
                    res = String(img.first?.url ?? "Didn't find anything.")
                }
        }
         return res
}

let botInfo = Bot(token: "NzcwNTE1NDYyMTM1NjExMzky.X5escQ.-mXj9SPXoMJ7FX2uZnYYXguMOio", status: "!help", prefix: "!", defaultQuery: "makise_kurisu")
let bot = Sword(token: botInfo.token)
bot.editStatus(to: "online", playing: botInfo.status)
bot.on(.messageCreate) { data in

    let message = data as! Message
    var waifuName:String = String()
    var waifu:String = String()
    if message.content.starts(with: botInfo.prefix + "danbooru"){
        let messageContent = String(message.content)
        let messageArray = messageContent.split(separator: " ")
        if messageArray.count == 1 || messageArray.count > 2{
            message.reply(with:"Invalid parameters\nUsage: !danbooru your_tag\nExample:!danbooru makise_kurisu")
        }
        else if messageArray[1] == "default"{
            
            waifu = danbooruWaifu(searchQuery: botInfo.defaultQuery)
            message.reply(with: waifu)
        }
        else{
            waifuName = String(messageArray[1])
            waifu = danbooruWaifu(searchQuery: waifuName)
            message.reply(with: waifu)
        }
    }
    else if message.content.starts(with: botInfo.prefix + "gelbooru"){
        let messageContent = String(message.content)
        let messageArray = messageContent.split(separator: " ")
        if messageArray.count == 1 || messageArray.count > 2{
            message.reply(with:"Invalid parameters\nUsage: !gelbooru your_tag\nExample:!gelbooru makise_kurisu")
        }
        else if messageArray[1] == "default"{
            
            waifu = gelbooruWaifu(searchQuery: botInfo.defaultQuery)
            message.reply(with: waifu)
        }
        else{
            waifuName = String(messageArray[1])
            waifu = gelbooruWaifu(searchQuery: waifuName)
            message.reply(with: waifu)
        }
    }
    else if message.content.starts(with: botInfo.prefix + "safebooru"){
        let messageContent = String(message.content)
        let messageArray = messageContent.split(separator: " ")
        if messageArray.count == 1 || messageArray.count > 2{
            message.reply(with:"Invalid parameters\nUsage: !safebooru your_tag\nExample:!safebooru makise_kurisu")
        }
        else if messageArray[1] == "default"{
            
            waifu = safeBooruWaifu(searchQuery: botInfo.defaultQuery)
            message.reply(with: waifu)
        }
        else{
            waifuName = String(messageArray[1])
            waifu = safeBooruWaifu(searchQuery: waifuName)
            message.reply(with: waifu)
        }
    }
    else if message.content.starts(with: botInfo.prefix + "yandere"){
        let messageContent = String(message.content)
        let messageArray = messageContent.split(separator: " ")
        if messageArray.count == 1 || messageArray.count > 2{
            message.reply(with:"Invalid parameters\nUsage: !yandere your_tag\nExample:!yandere makise_kurisu")
        }
        else if messageArray[1] == "default"{
            
            waifu = yandereWaifu(searchQuery: botInfo.defaultQuery)
            message.reply(with: waifu)
        }
        else{
            waifuName = String(messageArray[1])
            waifu = yandereWaifu(searchQuery: waifuName)
            message.reply(with: waifu)
        }
    }
        
    
    else if message.content == botInfo.prefix + "help"{
        message.reply(with: "It works just like it would if you were on a booru directly\nexample usage: `\(botInfo.prefix)danbooru your_tag`\nSupported boorus:\n-danbooru\n-gelbooru(segfaults)\n-safebooru")
    }
}

bot.connect()
