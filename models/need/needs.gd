extends Node


var 米饭 = Need.new(
	'米饭',
	'任意米',
	func (materials: Array[FoodMaterial]):
		return has_rice(materials),
	3
)

var 米饭巨无霸 = Need.new(
	'米饭巨无霸',
	'任意米3份',
	func (materials: Array[FoodMaterial]):
		return has_rice(materials, 3),
	3
)

var 煲仔饭 = Need.new(
	'煲仔饭',
	'任意米 + 任意肉类',
	func (materials: Array[FoodMaterial]):
		return has_rice(materials) and has_meat(materials),
	4
)

var 金闪闪的肉拼盘 = Need.new(
	'金闪闪的肉拼盘',
	'猪肉 + 牛肉 + 鱼肉',
	func (materials: Array[FoodMaterial]):
		return has_item(materials, '猪肉') and has_item(materials, '牛肉') and has_item(materials, '鱼肉'),
	8
)

var 水果拼盘 = Need.new(
	'全肉拼盘',
	'任意水果3份',
	func (materials: Array[FoodMaterial]):
		return has_fruit(materials, 3),
	6
)

func has_rice(materials: Array[FoodMaterial], number := 1) -> bool:
	return has_category_item(materials, '米', number)


func has_meat(materials: Array[FoodMaterial], number := 1) -> bool:
	return has_category_item(materials, '肉', number)


func has_fruit(materials: Array[FoodMaterial], number := 1) -> bool:
	return has_category_item(materials, '水果', number)


func has_category_item(materials: Array[FoodMaterial], category: String, number := 1) -> bool:
	return len(materials.filter(func (x): return x.category == category)) >= number


func has_item(materials: Array[FoodMaterial], item: String, number := 1) -> bool:
	return len(materials.filter(func (x): return x.title == item)) >= number
