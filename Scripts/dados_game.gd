extends Node

#Fazendo coomo singleton
#Project -> Project settings -> Autoload

var pontos : int = 0;

func pontuar(valor : int):
	pontos += valor;
