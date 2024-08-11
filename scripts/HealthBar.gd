extends ProgressBar

#TODO fetch actual player health value
func _ready():
	value = 100

func setValue(currentValue: int):
	value = currentValue
