extends PanelContainer


@onready var log_list: VBoxContainer = %LogList

@onready var scroll_container = %ScrollContainer

@onready var scroll_bar: VScrollBar = scroll_container.get_v_scroll_bar()

var _scroll_bar_max_value: float

var _stick_to_bottom: bool = true


func _ready() -> void:
	%LabelTemplate.hide()

	Log.logged.connect(_on_logged)
	scroll_bar.changed.connect(_on_scroll_bar_changed)
	scroll_bar.value_changed.connect(_on_scroll_bar_value_changed)


func _on_scroll_bar_changed() -> void:
	if _scroll_bar_max_value != scroll_bar.max_value:
		_scroll_bar_max_value = scroll_bar.max_value
		if _stick_to_bottom:
			scroll_container.scroll_vertical = _scroll_bar_max_value


func _on_scroll_bar_value_changed(value: float) -> void:
	_stick_to_bottom = is_equal_approx(scroll_bar.max_value, value + scroll_bar.page)


func _on_logged(message: String) -> void:
	_add_log(message)


func _add_log(message) -> void:
	var label = %LabelTemplate.duplicate()
	label.visible = true
	label.text = message
	log_list.add_child(HSeparator.new())
	log_list.add_child(label)

	_clean_logs_when_necessary()


func _clean_logs_when_necessary() -> void:
	if log_list.get_child_count() > 200:
		var logs = log_list.get_children().slice(0, 100)
		Utils.free_all(logs)
