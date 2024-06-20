extends Node2D

@onready var spawnTimer := $SpawnTimer

var nextSpawnTime := 3.0

var preloadedComprador = preload("res://Comprador/comprador.tscn")

var contador = 0
var contNome = 0
var contExecuta = 0

const max = 5

var maxD = 5
var maxH = 0

var iniciar = true

func _ready():
	#spawnTimer.start(nextSpawnTime)
	pass


func _on_spawn_timer_timeout():
	if contador < maxD:
		var comprador := preloadedComprador.instantiate()
		comprador.nome = contNome
		call_deferred("add_child", comprador)
		contador = contador + 1
		contNome = contNome + 1
		spawnTimer.start(nextSpawnTime)
	else:
		iniciar = true
		


func _on_button_button_down():
	if iniciar:
		maxD = maxH
		contador = 0
		spawnTimer.start(nextSpawnTime)
		print("||||||||||||Execucao numero " + str(contExecuta) + "|||||||||||")
		
		print("________" + str(maxD) + " Compradores________")
		contExecuta = contExecuta + 1
		iniciar = false



func _on_h_slider_value_changed(value):
	maxH = value
