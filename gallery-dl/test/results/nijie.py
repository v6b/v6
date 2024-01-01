# -*- coding: utf-8 -*-

# This program is free software; you can redistribute it and/or modify
# it under the terms of the GNU General Public License version 2 as
# published by the Free Software Foundation.

from gallery_dl.extractor import nijie
import datetime
from gallery_dl import exception


__tests__ = (
{
    "#url"     : "https://nijie.info/members.php?id=44",
    "#category": ("Nijie", "nijie", "user"),
    "#class"   : nijie.NijieUserExtractor,
    "#urls"    : (
        "https://nijie.info/members_illust.php?id=44",
        "https://nijie.info/members_dojin.php?id=44",
    ),
},

{
    "#url"     : "https://nijie.info/members_illust.php?id=44",
    "#category": ("Nijie", "nijie", "illustration"),
    "#class"   : nijie.NijieIllustrationExtractor,
    "#urls": (
        "https://pic.nijie.net/04/nijie/14/44/44/illust/0_0_f46c08462568c2f1_be95d7.jpg",
        "https://pic.nijie.net/06/nijie/14/44/44/illust/0_0_28e8c02d921bee33_9222d3.jpg",
    ),

    "artist_id"  : 44,
    "artist_name": "ED",
    "count"      : 1,
    "date"       : datetime.datetime,
    "description": str,
    "extension"  : "jpg",
    "filename"   : str,
    "image_id"   : int,
    "num"        : 0,
    "tags"       : list,
    "title"      : str,
    "url"        : r"re:https://pic.nijie.net/\d+/nijie/.*jpg$",
    "user_id"    : 44,
    "user_name"  : "ED",
},

{
    "#url"     : "https://nijie.info/members_illust.php?id=43",
    "#category": ("Nijie", "nijie", "illustration"),
    "#class"   : nijie.NijieIllustrationExtractor,
    "#exception": exception.NotFoundError,
},

{
    "#url"     : "https://nijie.info/members_dojin.php?id=6782",
    "#category": ("Nijie", "nijie", "doujin"),
    "#class"   : nijie.NijieDoujinExtractor,
    "#count"   : ">= 18",

    "user_id"  : 6782,
    "user_name": "ジョニー＠アビオン村",
},

{
    "#url"     : "https://nijie.info/user_like_illust_view.php?id=44",
    "#category": ("Nijie", "nijie", "favorite"),
    "#class"   : nijie.NijieFavoriteExtractor,
    "#count"   : ">= 16",

    "user_id"  : 44,
    "user_name": "ED",
},

{
    "#url"     : "https://nijie.info/history_nuita.php?id=728995",
    "#category": ("Nijie", "nijie", "nuita"),
    "#class"   : nijie.NijieNuitaExtractor,
    "#range"   : "1-10",
    "#count"   : 10,

    "user_id"  : 728995,
    "user_name": "莚",
},

{
    "#url"     : "https://nijie.info/like_user_view.php",
    "#category": ("Nijie", "nijie", "feed"),
    "#class"   : nijie.NijieFeedExtractor,
    "#range"   : "1-10",
    "#count"   : 10,
},

{
    "#url"     : "https://nijie.info/like_my.php",
    "#category": ("Nijie", "nijie", "followed"),
    "#class"   : nijie.NijieFollowedExtractor,
},

{
    "#url"     : "https://nijie.info/view.php?id=70720",
    "#category": ("Nijie", "nijie", "image"),
    "#class"   : nijie.NijieImageExtractor,
    "#urls"         : "https://pic.nijie.net/06/nijie/14/44/44/illust/0_0_28e8c02d921bee33_9222d3.jpg",
    "#sha1_url"     : "3d654e890212ba823c9647754767336aebc0a743",
    "#sha1_metadata": "58e716bcb03b431cae901178c198c787908e1c0c",
    "#sha1_content" : "d85e3ea896ed5e4da0bca2390ad310a4df716ca6",

    "artist_id"  : 44,
    "artist_name": "ED",
    "count"      : 1,
    "date"       : "dt:2014-01-18 19:58:21",
    "description": "租絵にてお邪魔いたし候\r\n是非ともこの”おっぱい”をご高覧賜りたく馳せ参じた次第\r\n長文にて失礼仕る\r\n\r\nまず全景でありますが、首を右に傾けてみて頂きたい\r\nこの絵図は茶碗を眺めていた私が思わぬ美しさにて昇天したときのものを、筆をとり、したためたものである（トレースではない）\r\n筆は疾風の如く走り、半刻過ぎには私好みの”おっぱい”になっていたのである！\r\n次に細部をみて頂きたい\r\n絵図を正面から見直して頂くと、なんとはんなりと美しいお椀型をしたおっぱいであろうか　　右手から緩やかに生まれる曲線は左手に進むにつれて、穏やかな歪みを含み流れる　　これは所謂轆轤目であるが三重の紐でおっぱいをぐるぐると巻きつけた情景そのままであり、この歪みから茶碗の均整は崩れ、たぷんたぷんのおっぱいの重量感を醸し出している！\r\nさらに左手に進めば梅花皮（カイラギ）を孕んだ高大が現れる　今回は点線にて表現するが、その姿は乳首から母乳が噴出するが如く　或は精子をぶっかけられたが如く　白くとろっとした釉薬の凝固が素晴しい景色をつくりだしているのである！\r\n最後には極めつけ、すくっと螺旋を帯びながらそそり立つ兜巾（ときん）！この情景はまさしく乳首である！　　全体をふんわりと盛り上げさせる乳輪にちょこっと存在する乳頭はぺろりと舌で確かめ勃起させたくなる風情がある！\r\n\r\nこれを”おっぱい”と呼ばずなんと呼ぼうや！？\r\n\r\n興奮のあまり失礼致した\r\n御免",
    "extension"  : "jpg",
    "filename"   : "0_0_28e8c02d921bee33_9222d3",
    "image_id"   : 70720,
    "num"        : 0,
    "tags"       : ["おっぱい"],
    "title"      : "俺好高麗井戸茶碗　銘おっぱい",
    "url"        : "https://pic.nijie.net/06/nijie/14/44/44/illust/0_0_28e8c02d921bee33_9222d3.jpg",
    "user_id"    : 44,
    "user_name"  : "ED",
},

{
    "#url"     : "https://nijie.info/view.php?id=594044",
    "#category": ("Nijie", "nijie", "image"),
    "#class"   : nijie.NijieImageExtractor,
    "#urls": (
        "https://pic.nijie.net/02/nijie/23m12/09/49509/illust/0_0_63568cc428259d50_45ca51.jpg",
        "https://pic.nijie.net/01/nijie/23m12/09/49509/illust/594044_0_1c94b7cc4503589f_79c66c.jpg",
        "https://pic.nijie.net/02/nijie/23m12/09/49509/illust/594044_1_9f4737ad48bf43c7_8f1e8e.jpg",
        "https://pic.nijie.net/01/nijie/23m12/09/49509/illust/594044_2_a162861fac970a45_38c5f8.jpg",
    ),

    "artist_id"  : 49509,
    "artist_name": "黒川　竜",
    "count"      : 4,
    "date"       : "dt:2023-12-02 04:19:29",
    "description": "【DLサイトコム】ウィンターセール　30%OFF\r\n期間：2024年2月14日まで\r\n【toloveるドリンク】\r\nhttps://www.dlsite.com/maniax/work/=/product_id/RJ042727.html\r\n【toloveるドリンク２】\r\nhttps://www.dlsite.com/maniax/work/=/product_id/RJ043289.html\r\n【クランクランBIG】\r\nhttps://www.dlsite.com/maniax/work/=/product_id/RJ043564.html",
    "image_id"   : 594044,
    "num"        : range(0, 3),
    "tags"       : [
        "オリジナル",
        "漫画",
        "中出し",
        "爆乳",
        "巨乳",
        "ToLOVEる",
        "宣伝",
        "クラン・クラン",
        "マクロスF",
    ],
    "title"      : "【DLサイトコム】ウィンターセール",
    "url"        : str,
    "user_id"    : 49509,
    "user_name"  : "黒川　竜",
},

{
    "#url"     : "https://nijie.info/view.php?id=70724",
    "#category": ("Nijie", "nijie", "image"),
    "#class"   : nijie.NijieImageExtractor,
    "#count"   : 0,
},

{
    "#url"     : "https://nijie.info/view_popup.php?id=70720",
    "#category": ("Nijie", "nijie", "image"),
    "#class"   : nijie.NijieImageExtractor,
},

)
