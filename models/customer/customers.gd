extends Node


var 金闪闪 = Customer.new(
	'金闪闪',
	'掌握王之财宝的英雄王。',
	[Needs.金闪闪的肉拼盘],
	[Events.五谷丰登]
)

var 上班族 = Customer.new(
	'上班族',
	'',
	[Needs.米饭巨无霸, Needs.煲仔饭],
	[]
)

var 大学生 = Customer.new(
	'大学生',
	'正在节食减肥的大学生',
	[Needs.米饭, Needs.水果拼盘]
)
