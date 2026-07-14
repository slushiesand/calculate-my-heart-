extends Area2D

@export var text = ""

func _ready() -> void:
	$Label.set_text(text)

func _on_body_entered(body: Node2D) -> void:
	if body is Player:
		$Label.show()

func _on_body_exited(body: Node2D) -> void:
	$Label.hide()
