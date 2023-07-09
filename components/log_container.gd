extends PanelContainer


func _ready() -> void:
	Log.logged.connect(_on_logged)
	%LabelTemplate.hide()


func _on_logged(message: String) -> void:
	_add_log(message)


func _add_log(message) -> void:
	var label = %LabelTemplate.duplicate()
	label.visible = true
	label.text = message
	%LogList.add_child(label)
