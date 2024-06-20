extends Area2D
class_name C

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

var preloadedSprites = [
	preload("res://Comprador/rebecca.tscn"),
	preload("res://Comprador/davidmartinez.tscn"),
	preload("res://Comprador/dorio.tscn"),
	preload("res://Comprador/faraday.tscn"),
	preload("res://Comprador/jackie.tscn"),
	preload("res://Comprador/johnny.tscn"),
	preload("res://Comprador/judy.tscn"),
	preload("res://Comprador/kiwi.tscn"),
	preload("res://Comprador/lucy.tscn"),
	preload("res://Comprador/maine.tscn"),
]
@export var dinheiro := 0
var produtos = ["cenoura", "peixe", "carne", "vinho", "nabo", "livro", "pocao","flor", "cristal", "maca"]
var produtoDesejado

@export var horizontalSpeed := 200.0
var estado = "indo"
var estado2 = "nada"

@onready var negociandoTimer := $Negociando
@onready var comprandoTimer := $Comprando


var min = 50
var vendedorMin = "nenhum"

var t = 2

var nome

var spritePreload 
var sprite

func _ready():
	randomize()
	escolhe_produtos()
	escolhe_sprite()
	dinheiro = 5 + randi() % 31
	print("§§§§§§§§§§§§§§§§§§§§§§§")
	print("Comprador: " + str(nome))
	print("Deseja: " + produtoDesejado)
	print("Possui: R$" + str(dinheiro))
	print("§§§§§§§§§§§§§§§§§§§§§§§")
	
func escolhe_sprite():
	
	spritePreload = preloadedSprites[randi() % preloadedSprites.size()]
	sprite = spritePreload.instantiate()
	call_deferred("add_child", sprite)

func _physics_process(delta):
	if estado == "indo":
		ida(delta)
		sprite.get_children()[0].play("walk_left")
	if estado == "subindo":
		sobe(delta)
		sprite.get_children()[0].play("walk_up")
	if estado == "voltando":
		volta(delta)
		sprite.get_children()[0].play("walk_rigth")
	if estado == "descendo":
		desce(delta)
		sprite.get_children()[0].play("walk_down")
	if estado == "negociando":
		sprite.get_children()[0].play("stop")

func escolhe_produtos():
	produtoDesejado = produtos[randi() % produtos.size()]

func ida(delta):
	position.x -= horizontalSpeed * delta

func volta(delta):
	position.x += horizontalSpeed * delta

func sobe(delta):
	position.y -= horizontalSpeed * delta

func desce(delta):
	position.y += horizontalSpeed * delta

func _on_area_entered(area):
	
	if area is Vendedor && estado2 == "nada":
		estado = "negociando"
		print("========Negociando========")
		print("Comprador: " + str(nome))
		print("Deseja: " + produtoDesejado)
		print("Possui: R$" + str(dinheiro))
		print(area.nome)
		print("Possui:")
		if produtoDesejado == area.get_children()[2].nome:
			print("--------------------")
			print("Produto: " + area.get_children()[2].nome)
			print("Valor: R$" + str(area.get_children()[2].valor))
			if area.get_children()[2].valor < min:
				min = area.get_children()[2].valor
				vendedorMin = area.cn
		if produtoDesejado == area.get_children()[3].nome:
			print("--------------------")
			print("Produto: " + area.get_children()[3].nome)
			print("Valor: R$" + str(area.get_children()[3].valor))
			if area.get_children()[3].valor < min:
				min =area.get_children()[3].valor
				vendedorMin = area.cn
		if produtoDesejado == area.get_children()[4].nome:
			print("--------------------")
			print("Produto: " + area.get_children()[4].nome)
			print("Valor: R$" + str(area.get_children()[4].valor))
			if area.get_children()[4].valor < min:
				min = area.get_children()[4].valor
				vendedorMin = area.cn
		if produtoDesejado == area.get_children()[5].nome:
			print("--------------------")
			print("Produto: " + area.get_children()[5].nome)
			print("Valor: R$" + str(area.get_children()[5].valor))
			if area.get_children()[5].valor < min:
				min = area.get_children()[5].valor
				vendedorMin = area.cn
		if produtoDesejado == area.get_children()[6].nome:
			print("--------------------")
			print("Produto: " + area.get_children()[6].nome)
			print("Valor: R$" + str(area.get_children()[6].valor))
			if area.get_children()[6].valor < min:
				min = area.get_children()[6].valor
				vendedorMin = area.cn
		print("==========================")
		negociandoTimer.start(t)
	if area is Vendedor && estado2 == "comprando":
		var posicao = 0
		var comProduto = false
		estado = "parado"
		if produtoDesejado == area.get_children()[2].nome:
			#print(area.get_children()[2].nome)
			#print(area.get_children()[2].valor)
			if area.get_children()[2].valor <= min:
				min = area.get_children()[2].valor
				posicao = 2
				comProduto = true
				
		if produtoDesejado == area.get_children()[3].nome:
			#print(area.get_children()[3].nome)
			#print(area.get_children()[3].valor)
			if area.get_children()[3].valor <= min:
				min =area.get_children()[3].valor
				posicao = 3
				comProduto = true
				
		if produtoDesejado == area.get_children()[4].nome:
			#print(area.get_children()[4].nome)
			#print(area.get_children()[4].valor)
			if area.get_children()[4].valor <= min:
				min = area.get_children()[4].valor
				posicao = 4
				comProduto = true
				
		if produtoDesejado == area.get_children()[5].nome:
			#print(area.get_children()[4].nome)
			#print(area.get_children()[4].valor)
			if area.get_children()[5].valor <= min:
				min = area.get_children()[5].valor
				posicao = 5
				comProduto = true
		if produtoDesejado == area.get_children()[6].nome:
			#print(area.get_children()[4].nome)
			#print(area.get_children()[4].valor)
			if area.get_children()[6].valor <= min:
				min = area.get_children()[6].valor
				posicao = 6
				comProduto = true
		
				
		vendedorMin = "nenhum"
		if comProduto:
			print("========Comprando========")
			print("Comprador: " + str(nome))
			print("Deseja: " + produtoDesejado)
			print("Possui: R$" + str(dinheiro))
			print(area.nome)
			print("Possui: " + area.get_children()[posicao].nome)
			print("Custa: " + str(area.get_children()[posicao].valor))
			
			if dinheiro >= area.get_children()[posicao].valor:
				print("Comprei")
				area.dinheiro = area.dinheiro + dinheiro
				compra(area.get_children()[posicao].nome, area.get_children()[posicao].valor)
				area.get_children()[posicao].nome = "-"
				area.get_children()[posicao].get_children()[0].visible = false
				
				print("dinheiro do vendedor: R$" + str(area.dinheiro))
			elif randi() % 2 == 0:
				print("Comprei com desconto")
				area.dinheiro = area.dinheiro + dinheiro
				compra(area.get_children()[posicao].nome, area.get_children()[posicao].valor)
				area.get_children()[posicao].nome = "-"
				area.get_children()[posicao].get_children()[0].visible = false
				
				print("dinheiro do vendedor: R$" + str(area.dinheiro))
			else:
				print("Nao Comprei")
		else:
			print("-----Comprando-----")
			print("Comprador: " + str(nome))
			print("Deseja: " + produtoDesejado)
			print("Possui: R$" + str(dinheiro))
			print(area.nome)
			print("Nao tem mais " + produtoDesejado + " aqui")
		comprandoTimer.start(t)
		
	if area is FimNegociacao:
		estado = "subindo"
	if area is InicioCmpra:
		estado = "voltando"
	if area is Compra1:
		if vendedorMin == "Compra1":
			estado = "descendo"
			estado2 = "comprando"
			
	if area is Compra2:
		if vendedorMin == "Compra2":
			estado = "descendo"
			estado2 = "comprando"
			
	if area is Compra3:
		if vendedorMin == "Compra3":
			estado = "descendo"
			estado2 = "comprando"
			
	if area is Compra4:
		if vendedorMin == "Compra4":
			estado = "descendo"
			estado2 = "comprando"
			
	
func compra(nome, valor):
	var produtPreload 
	var produto
	if nome == produtos[0]:	
		produtPreload = preloadedProdutos[0]
	elif nome == produtos[1]:
		produtPreload = preloadedProdutos[1]
	elif  nome == produtos[2]:
		produtPreload = preloadedProdutos[2]
	elif  nome == produtos[3]:
		produtPreload = preloadedProdutos[3]
	elif  nome == produtos[4]:
		produtPreload = preloadedProdutos[4]
	elif  nome == produtos[5]:
		produtPreload = preloadedProdutos[5]
	elif  nome == produtos[6]:
		produtPreload = preloadedProdutos[6]
	elif  nome == produtos[7]:
		produtPreload = preloadedProdutos[7]
	elif  nome == produtos[8]:
		produtPreload = preloadedProdutos[8]
	elif  nome == produtos[9]:
		produtPreload = preloadedProdutos[9]
	produto = produtPreload.instantiate()
	dinheiro = dinheiro - valor
	produto.position = Vector2(0, -50)
	call_deferred("add_child", produto)

func _on_comprando_timeout():
	if estado == "parado":
		estado = "subindo"

func _on_negociando_timeout():
	if estado == "negociando" && estado2 == "nada":
		estado = "indo"

func _on_visible_on_screen_enabler_2d_screen_exited():
	queue_free()
