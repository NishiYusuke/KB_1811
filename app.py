# -*- coding: utf-8 -*-
import sys
sys.path.append('./vendor')

import json
import urllib.parse
from flask import Flask, request, abort

from linebot import (
    LineBotApi, WebhookHandler
)
from linebot.exceptions import (
    InvalidSignatureError
)
from linebot.models import (
    MessageEvent, TextMessage, TextSendMessage, StickerSendMessage
)

app = Flask(__name__)

line_bot_api = LineBotApi('3e5qlbYb2Exgu4ZGGyJPS/SZPtWQTSPGCraGGQOA5zuzN9AAk6/eqd7Ej2DKFi1oYbEVvQembHE8C8eXgMS59Ox4mRoRVOJIo4/hpCWNt2dZY+ECwJIWZMEDXjN9IJ0IQ8L5MoeKy8fuQHvkiT2UzAdB04t89/1O/w1cDnyilFU=')
handler = WebhookHandler('dec9dc4525258cd8c82a7f712e79e4f0')

def get_ohira(get_name):
    with urllib.request.urlopen("http://192.168.179.6:3000/rooms/1/" + get_name) as res:
       html = res.read().decode("utf-8")
    return html

#@app.route("/callback", methods=['POST'])
@app.route("/", methods=['POST'])
def callback():
    # get X-Line-Signature header value
    signature = request.headers['X-Line-Signature']

    # get request body as text
    body = request.get_data(as_text=True)
    app.logger.info("Request body: " + body)

    # handle webhook body
    try:
        handler.handle(body, signature)
    except InvalidSignatureError:
        abort(400)

    return 'OK'


@handler.add(MessageEvent, message=TextMessage)
def handle_message(event):
    if event.type == "message":
        if event.message.type == "text":
            profile = line_bot_api.get_profile(event.source.user_id)
            print(event.source.user_id)
            displayName = profile.display_name

            if event.message.text == u"誰がいるの？":

                #open_name = open('C:\\Users\\isowa\\Downloads\\python\\python\\test_name.json', 'r') #ここが(1)
                #person_name = json.load(open_name) #ここが(2)
                person_name = json.loads(get_ohira("users.json"))
                if len(person_name) != 0:
                    msg = ""
                    for ind in person_name:
                        msg += ind["name"] + ","
                        #msg += app.name_buffer[ind["name"]] + ","
                    print(event.reply_token)
                    line_bot_api.reply_message(
                        event.reply_token,
                        [
                            StickerSendMessage(package_id=1, sticker_id=17),
                            TextSendMessage(text='%sがいます' % msg)
                        ]
                    )
                else :
                    line_bot_api.reply_message(
                        event.reply_token,
                        [
                            StickerSendMessage(package_id=2, sticker_id=13),
                            TextSendMessage(text='誰もいませんよ。外出、帰宅のさいは施錠をお願いしますね。')
                        ]
                    )
            elif event.message.text == u"今何人？":
                #open_number = open('C:\\Users\\isowa\\Downloads\\python\\python\\test.json', 'r') #ここが(1)
                #number_count = json.load(open_number) #ここが(2)

                number_count = json.loads(get_ohira("count"))
                line_bot_api.reply_message(
                    event.reply_token,
                    [
                        StickerSendMessage(package_id=1, sticker_id=17),
                        TextSendMessage(text='今%s人です。' % number_count['count'])
                    ]
                )
            else:
                line_bot_api.reply_message(
                    event.reply_token,
                    [
                        TextSendMessage(text="「今何人？」と聞くと今この建物にいる人数を答えます。「誰がいるの？」と聞くと誰がいるかを答えます。"),
                        StickerSendMessage(package_id=1, sticker_id=4),
                    ]
                )

if __name__ == "__main__":
    app.run(host='localhost', port=4999)
