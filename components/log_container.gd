extends PanelContainer


@onready var log_list: VBoxContainer = %LogList


func _ready() -> void:
	Log.logged.connect(_on_logged)
	%LabelTemplate.hide()


func _on_logged(message: String) -> void:
	_add_log(message)


func _add_log(message) -> void:
	var label = %LabelTemplate.duplicate()
	label.visible = true
	label.text = message
	log_list.add_child(HSeparator.new())
	log_list.add_child(label)

	_clean_logs_when_neccessary()


func _clean_logs_when_neccessary() -> void:
	if log_list.get_child_count() > 200:
		var logs = log_list.get_children()
		var count = 0
		for item in logs:
			item.queue_free()
			count += 1
			if count > 100:
				break
