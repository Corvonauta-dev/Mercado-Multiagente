extends Node2D
class_name Vendedor

var dinheiro = 0

var preloadedProdutos = [
	preload("res://Produtos/produto_1.tscn"),
	preload("res://Produtos/produto_2.tscn"),
	preload("res://Produtos/produto_3.tscn"),
	preload("res://Produtos/produto_4.tscn"),
	preload("res://Produtos/produto_5.tscn"),
	preload("res://Produtos/produto_6.tscn"),
	preload("res://Produtos/produto_7.tscn"),
	preload("res://Produtos/produto_8.tscn"),
	preload("res://Produtos/produto_9.tscn"),
	preload("res://Produtos/produto_10.tscn")
]

func _ready():
	randomize()
	escolhe_produtos()

func escolhe_produtos():
	var produtPreload 
	var produto
	for i in 5:
		produtPreload = preloadedProdutos[randi() % preloadedProdutos.size()]
		produto = produtPreload.instantiate()
		#print("###############")
		#print(produto.valor)
		#print("--------------")
		produto.valor = produto.valor + randi() % 10
		produto.valor = produto.valor - randi() % 10
		#print(produto.valor)
		#print("###############")
		if i == 0:
			produto.position = Vector2(-30, 30)
		elif i == 1:
			produto.position = Vector2(-15, 30)
		elif i == 2:
			produto.position = Vector2(0, 30)
		elif i == 3:
			produto.position = Vector2(15, 30)
		else:
			produto.position = Vector2(30, 30)
		call_deferred("add_child", produto)
		
