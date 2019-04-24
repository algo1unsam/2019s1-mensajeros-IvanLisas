object puenteDeBrooklyn {
	
	method puedeEntrar(mensajero){
		return mensajero.peso()<1000
	}
}

object matrix { 
	
	method puedeEntrar(mensajero){
		return mensajero.puedeLlamar()
	}
	
}