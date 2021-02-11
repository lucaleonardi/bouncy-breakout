extends Node2D


var total_score := 0

func _ready() -> void:
	$Ball.connect("scored", self, "_update_score")

func _update_score(score: int) -> void:
	total_score += score
