extends Node


var 普通店面 = Decoration.new(
    '普通店面',
    '普通的店，没什么特别。',
    '店面',
    0,
    func (): pass
)

var 豪华店面 = Decoration.new(
    '豪华店面',
    '装潢华丽的店面；每回合减少 2 金币；成功接待客人的收入增加 1 金币。',
    '店面',
    0,
    func (_game, player: Player, when: String, _args):
        match when:
            "turn_started":
                player.coins -= 2
            "customer_succeeded":
                player.coins += 1
)

var 魔法店面 = Decoration.new(
    '魔法店面',
    '蕴含着魔法力量的店面；每回合收入 1 金币。',
    '店面',
    0,
    func (_game, player: Player, when: String, _args):
        match when:
            "turn_started":
                player.coins += 1
)

var 猫耳女仆 = Decoration.new(
    '猫耳女仆',
    '成功接待客人收入增加 1 金币。',
    '服务员',
    0,
    func (_game, player: Player, when: String, _args):
        match when:
            'customer_succeeded':
                player.coins += 1
)

var 打工人 = Decoration.new(
    '打工人',
    '成功接待客人收入增加 2 金币',
    '服务员',
    0,
    func (_game, player: Player, when: String, _args):
        match when:
            'customer_succeeded':
                player.coins += 2
)

var 多肉植物 = Decoration.new(
    '多肉植物',
    '每回合开始时增加 1 金币',
    '盆栽',
    3,
    func (_game, player: Player, when: String, _args):
        match when:
            "turn_started":
                player.coins += 1
)

var 仙人掌 = Decoration.new(
    '仙人掌',
    '每回合开始时增加 2 金币',
    '盆栽',
    2,
    func (_game, player: Player, when: String, _args):
        match when:
            "turn_started":
                player.coins += 2
)
